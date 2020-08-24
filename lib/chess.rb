# frozen_string_literal: true
require 'pry'

# A module for various movement functions which are reused by different chess pieces
module Movement
  def diagonal(position, board)
    current_position = position
    piece_found = false
    moves = []
    until current_position[0, 1] == 'H' || current_position[1, 1] == '8' || piece_found
      current_position = current_position[0, 1].next + current_position[1, 1].next
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    current_position = position
    piece_found = false
    until current_position[0, 1] == 'H' || current_position[1, 1] == '1' || piece_found
      current_position = current_position[0, 1].next + (current_position[1, 1].to_i - 1).to_s
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    current_position = position
    piece_found = false
    until current_position[0, 1] == 'A' || current_position[1, 1] == '1' || piece_found
      current_position = (current_position[0, 1].ord - 1).chr + (current_position[1, 1].to_i - 1).to_s
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    current_position = position
    piece_found = false
    until current_position[0, 1] == 'A' || current_position[1, 1] == '8' || piece_found
      current_position = (current_position[0, 1].ord - 1).chr + current_position[1, 1].next
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    moves
  end

  def plus(position, board)
    current_position = position
    piece_found = false
    moves = []
    until current_position[0, 1] == 'H' || piece_found
      current_position = current_position[0, 1].next + current_position[1, 1]
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    current_position = position
    piece_found = false
    until current_position[1, 1] == '1' || piece_found
      current_position = current_position[0, 1] + (current_position[1, 1].to_i - 1).to_s
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    current_position = position
    piece_found = false
    until current_position[0, 1] == 'A' ||  piece_found
      current_position = (current_position[0, 1].ord - 1).chr + current_position[1, 1]
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    current_position = position
    piece_found = false
    until current_position[1, 1] == '8' || piece_found
      current_position = current_position[0, 1] + current_position[1, 1].next
      if board[current_position].is_a?(String)
        moves.push(current_position)
      elsif board[current_position].color == @color
        piece_found = true
      else
        moves.push(current_position)
        piece_found = true
      end
    end
    moves
  end
end

# An object representing the king chess piece
class King
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count, :castling_moves

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
    @castling_moves = []
  end

  def symbol_selector
    @color == 'white' ? '♔' : '♚'
  end

  def all_moves(position, board)
    current_position = position
    moves = []
    @castling_moves = []
    check_contents = lambda do |pos|
      if board[pos].is_a?(String)
        moves.push(pos)
        true
      elsif board[pos].color != @color
        moves.push(pos)
        false
      else
        false
      end
    end
    unless current_position[0, 1] == 'H'
      pos = current_position[0, 1].next + current_position[1, 1]
      right_clear = check_contents.call(pos)
    end
    unless current_position[0, 1] == 'A'
      pos = (current_position[0, 1].ord - 1).chr + current_position[1, 1]
      left_clear = check_contents.call(pos)
    end
    unless current_position[1, 1] == '8'
      pos = current_position[0, 1] + current_position[1, 1].next
      check_contents.call(pos)
    end
    unless current_position[1, 1] == '1'
      pos = current_position[0, 1] + (current_position[1, 1].to_i - 1).to_s
      check_contents.call(pos)
    end
    unless current_position[0, 1] == 'A' || current_position[1, 1] == '8'
      pos = (current_position[0, 1].ord - 1).chr + current_position[1, 1].next
      check_contents.call(pos)
    end
    unless current_position[0, 1] == 'H' || current_position[1, 1] == '8'
      pos = current_position[0, 1].next + current_position[1, 1].next
      check_contents.call(pos)
    end
    unless current_position[0, 1] == 'H' || current_position[1, 1] == '1'
      pos = current_position[0, 1].next + (current_position[1, 1].to_i - 1).to_s
      check_contents.call(pos)
    end
    unless current_position[0, 1] == 'A' || current_position[1, 1] == '1'
      pos = (current_position[0, 1].ord - 1).chr + (current_position[1, 1].to_i - 1).to_s
      check_contents.call(pos)
    end
    if @move_count.zero? && (current_position[1, 1] == '1' || current_position[1, 1] == '8')
      unless current_position[0, 1] == 'A' || current_position[0, 1] == 'B'
        proposed_position = (current_position[0, 1].ord - 2).chr + current_position[1, 1]
        if left_clear && board[proposed_position].is_a?(String) && check_rooks(proposed_position, board)
          moves.push((current_position[0, 1].ord - 2).chr + current_position[1, 1])
          @castling_moves.push((current_position[0, 1].ord - 2).chr + current_position[1, 1])
        end
      end
      unless current_position[0, 1] == 'G' || current_position[0, 1] == 'H'
        proposed_position = (current_position[0, 1].ord + 2).chr + current_position[1, 1]
        if right_clear && board[proposed_position].is_a?(String) && check_rooks(proposed_position, board)
          moves.push((current_position[0, 1].ord + 2).chr + current_position[1, 1])
          @castling_moves.push((current_position[0, 1].ord + 2).chr + current_position[1, 1])
        end
      end
    end
    moves.uniq
  end

  def find_rooks(board)
    rooks = []
    board.each do |key, value|
      unless value.is_a?(String)
        if value.color == @color && value.is_a?(Rook)
          rooks.push(key)
        end
      end
    end
    rooks
  end

  def check_rooks(position, board)
    rooks = find_rooks(board)
    available_rook = false
    rooks.each do |rook|
      if board[rook].all_moves(rook, board).include?(position) && board[rook].move_count.zero?
        available_rook = true
      end
    end
    available_rook
  end
end

# An object representing the rook chess piece
class Rook
  include Movement

  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♖' : '♜'
  end


  def all_moves(position, board)
    plus(position, board)
  end
end

# An object representing the bishop chess piece
class Bishop
  include Movement

  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♗' : '♝'
  end

  def all_moves(position, board)
    diagonal(position, board)
  end
end

# An object representing the queen chess piece
class Queen
  include Movement

  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♕' : '♛'
  end

  def all_moves(position, board)
    plus(position, board) + diagonal(position, board)
  end
end

# An object representing the knight chess piece
class Knight
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♘' : '♞'
  end

  def all_moves(position, board)
    current_position = position
    moves = []
    check_contents = lambda do |pos|
      if board[pos].is_a?(String)
        moves.push(pos)
        true
      elsif board[pos].color != @color
        moves.push(pos)
        false
      else
        false
      end
    end
    unless current_position[0, 1] == 'A' || %w[7 8].include?(current_position[1, 1])
      pos = (current_position[0, 1].ord - 1).chr + (current_position[1, 1].to_i + 2).to_s
      check_contents.call(pos)
    end
    unless current_position[0, 1] == 'H' || %w[7 8].include?(current_position[1, 1])
      pos = (current_position[0, 1].ord + 1).chr + (current_position[1, 1].to_i + 2).to_s
      check_contents.call(pos)
    end
    unless %w[G H].include?(current_position[0, 1]) || current_position[1, 1] == '8'
      pos = (current_position[0, 1].ord + 2).chr + (current_position[1, 1].to_i + 1).to_s
      check_contents.call(pos)
    end
    unless %w[G H].include?(current_position[0, 1]) || current_position[1, 1] == '1'
      pos = (current_position[0, 1].ord + 2).chr + (current_position[1, 1].to_i - 1).to_s
      check_contents.call(pos)
    end
    unless current_position[0, 1] == 'H' || %w[1 2].include?(current_position[1, 1])
      pos = (current_position[0, 1].ord + 1).chr + (current_position[1, 1].to_i - 2).to_s
      check_contents.call(pos)
    end
    unless current_position[0, 1] == 'A' || %w[1 2].include?(current_position[1, 1])
      pos = (current_position[0, 1].ord - 1).chr + (current_position[1, 1].to_i - 2).to_s
      check_contents.call(pos)
    end
    unless %w[A B].include?(current_position[0, 1]) || current_position[1, 1] == '1'
      pos = (current_position[0, 1].ord - 2).chr + (current_position[1, 1].to_i - 1).to_s
      check_contents.call(pos)
    end
    unless %w[A B].include?(current_position[0, 1]) || current_position[1, 1] == '8'
      pos = (current_position[0, 1].ord - 2).chr + (current_position[1, 1].to_i + 1).to_s
      check_contents.call(pos)
    end
    moves
  end
end

# An object representing the pawn chess piece
class Pawn
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count, :start

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
    @start = determine_direction
  end

  def symbol_selector
    @color == 'white' ? '♙' : '♟︎'
  end

  def determine_direction
    if @position[1, 1] == '2'
      'bottom'
    else
      'top'
    end
  end



  def all_moves(position, board)
    current_position = position
    moves = []
    if @start == 'top'
      if board[current_position[0, 1] + (current_position[1, 1].to_i - 1).to_s].is_a?(String)
        moves.push(current_position[0, 1] + (current_position[1, 1].to_i - 1).to_s)
        pos = current_position[0, 1] + (current_position[1, 1].to_i - 2).to_s
        if @move_count.zero? && board[pos].is_a?(String)
          moves.push(pos)
        end
      end
      unless current_position[0, 1] == 'A'
        pos = (current_position[0, 1].ord - 1).chr + (current_position[1, 1].to_i - 1).to_s
        unless board[pos].is_a?(String)
          unless board[pos].color == @color
            moves.push(pos)
          end
        end
      end
      unless current_position[0, 1] == 'H'
        pos = (current_position[0, 1].ord + 1).chr + (current_position[1, 1].to_i - 1).to_s
        unless board[pos].is_a?(String)
          unless board[pos].color == @color
            moves.push(pos)
          end
        end
      end
    else
      if board[current_position[0, 1] + (current_position[1, 1].to_i + 1).to_s].is_a?(String)
        moves.push(current_position[0, 1] + (current_position[1, 1].to_i + 1).to_s)
        pos = current_position[0, 1] + (current_position[1, 1].to_i + 2).to_s
        if @move_count.zero? && board[pos].is_a?(String)
          moves.push(pos)
        end
      end
      unless current_position[0, 1] == 'A'
        pos = (current_position[0, 1].ord - 1).chr + (current_position[1, 1].to_i + 1).to_s
        unless board[pos].is_a?(String)
          unless board[pos].color == @color
            moves.push(pos)
          end
        end
      end
      unless current_position[0, 1] == 'H'
        pos = (current_position[0, 1].ord + 1).chr + (current_position[1, 1].to_i + 1).to_s
        unless board[pos].is_a?(String)
          unless board[pos].color == @color
            moves.push(pos)
          end
        end
      end
    end
    moves
  end
end

# An object representing the game board, containing all information about whats on it
class Board
  attr_accessor :black, :white, :grid, :current_player

  def initialize(black, white)
    @black = black
    @white = white
    @grid = make_grid
    @current_player = 'white'
  end

  def make_grid
    random_number = Random.new.rand(2)
    if random_number.zero?
      top = 'white'
      bottom = 'black'
    else
      top = 'black'
      bottom = 'white'
    end
    {
      'A8' => Rook.new(top, 'A8'),
      'B8' => Knight.new(top, 'B8'),
      'C8' => Bishop.new(top, 'C8'),
      'D8' => Queen.new(top, 'D8'),
      'E8' => King.new(top, 'E8'),
      'F8' => Bishop.new(top, 'F8'),
      'G8' => Knight.new(top, 'G8'),
      'H8' => Rook.new(top, 'H8'),
      'A7' => Pawn.new(top, 'A7'),
      'B7' => Pawn.new(top, 'B7'),
      'C7' => Pawn.new(top, 'C7'),
      'D7' => Pawn.new(top, 'D7'),
      'E7' => Pawn.new(top, 'E7'),
      'F7' => Pawn.new(top, 'F7'),
      'G7' => Pawn.new(top, 'G7'),
      'H7' => Pawn.new(top, 'H7'),
      'A6' => '*',
      'B6' => '*',
      'C6' => '*',
      'D6' => '*',
      'E6' => '*',
      'F6' => '*',
      'G6' => '*',
      'H6' => '*',
      'A5' => '*',
      'B5' => '*',
      'C5' => '*',
      'D5' => '*',
      'E5' => '*',
      'F5' => '*',
      'G5' => '*',
      'H5' => '*',
      'A4' => '*',
      'B4' => '*',
      'C4' => '*',
      'D4' => '*',
      'E4' => '*',
      'F4' => '*',
      'G4' => '*',
      'H4' => '*',
      'A3' => '*',
      'B3' => '*',
      'C3' => '*',
      'D3' => '*',
      'E3' => '*',
      'F3' => '*',
      'G3' => '*',
      'H3' => '*',
      'A2' => Pawn.new(bottom, 'A2'),
      'B2' => Pawn.new(bottom, 'B2'),
      'C2' => Pawn.new(bottom, 'C2'),
      'D2' => Pawn.new(bottom, 'D2'),
      'E2' => Pawn.new(bottom, 'E2'),
      'F2' => Pawn.new(bottom, 'F2'),
      'G2' => Pawn.new(bottom, 'G2'),
      'H2' => Pawn.new(bottom, 'H2'),
      'A1' => Rook.new(bottom, 'A1'),
      'B1' => Knight.new(bottom, 'B1'),
      'C1' => Bishop.new(bottom, 'C1'),
      'D1' => Queen.new(bottom, 'D1'),
      'E1' => King.new(bottom, 'E1'),
      'F1' => Bishop.new(bottom, 'F1'),
      'G1' => Knight.new(bottom, 'G1'),
      'H1' => Rook.new(bottom, 'H1')
    }
  end

  def show
    puts '  A B C D E F G H'
    puts ' -----------------'
    letters = ('A'..'H').to_a
    counter = 8
    until counter.zero?
      print '| '
      letters.each do |letter|
        value = @grid[(letter + counter.to_s)]
        print "#{value.is_a?(String) ? value : value.symbol} "
      end
      puts "| #{counter}"
      counter -= 1
    end
    puts ' -----------------'
  end

  def ask_for_position
    correct_input = false
    until correct_input
      print 'Position: '
      input = gets.chomp.upcase
      if @grid.keys.include?(input)
        correct_input = true
      else
        puts 'PLEASE ENTER A VALID POSITION IN THE FORM <LETTER><NUMBER> eg. A1'
      end
    end
    input
  end

  def valid_origin_type(position)
    if @grid[position].is_a?(String)
      false
    else
      @grid[position].color == @current_player
    end
  end

  def fetch_origin
    valid = false
    until valid
      puts "#{@current_player.capitalize}, please select a chess piece to move"
      chosen_position = ask_for_position
      if valid_origin_type(chosen_position)
        if @grid[chosen_position].all_moves(chosen_position, @grid).empty?
          puts 'THAT CHESS PIECE DOES NOT HAVE ANY LEGAL MOVES'
        else
          valid = true
        end
      else
        puts 'PLEASE SELECT A POSITION WHICH CURRENTLY CONTAINS A CHESS PIECE OF YOUR COLOR'
      end
    end
    chosen_position
  end

  def fetch_destination(origin)
    valid = false
    moves = @grid[origin].all_moves(origin, @grid)
    until valid
      puts 'Where would you like to move this chess piece?'
      chosen_position = ask_for_position
      if moves.include?(chosen_position)
        valid = true
      else
        puts 'THIS IS NOT A LEGAL MOVE FOR THIS PIECE'
      end
    end
    chosen_position
  end

  def check(origin, destination)
    in_check = false
    temp_board = @grid.dup
    piece = temp_board[origin]
    temp_board[origin] = '*'
    temp_board[destination] = piece
    temp_board[destination].position = destination
    king_position = nil
    temp_board.each do |key, value|
      unless value.is_a?(String)
        if value.is_a?(King) && value.color == @current_player
          king_position = key
        end
      end
    end
    temp_board.each_value do |value|
      unless value.is_a?(String)
        unless value.color == @current_player
          if value.all_moves(value.position, temp_board).include?(king_position)
            in_check = true
          end
        end
      end
    end
    in_check
  end

  def move
    valid_move = false
    until valid_move
      origin = fetch_origin
      puts "\n"
      destination = fetch_destination(origin)
      if check(origin, destination)
        puts "THAT MOVE IS NOT ALLOWED AS IT WOULD PUT YOUR KING IN CHECK\n"
      else
        if @grid[origin].is_a?(King) && @grid[origin].castling_moves.include?(destination)
          if castling(origin, destination)
            valid_move = true
          else
            puts "THAT CASTLING MOVE IS NOT VALID AS THE KING PASSES THROUGH A SQUARE THAT IS UNDER ATTACK\n"
          end
        else
          @grid[destination] = @grid[origin]
          @grid[destination].position = destination
          @grid[origin] = '*'
          @grid[destination].move_count += 1
          valid_move = true
        end
      end
    end
  end

  def castling(origin, destination)
    complete = false
    if %w[A B C D].include?(destination[0, 1])
      rook_location = (destination[0, 1].ord + 1).chr + destination[1, 1]
      unless check(origin, rook_location)
        @grid[rook_location] = @grid['A' + destination[1, 1]]
        @grid[rook_location].position = rook_location
        @grid['A' + destination[1, 1]] = '*'
        complete = true
        @grid[rook_location].move_count += 1
      end
    else
      rook_location = (destination[0, 1].ord - 1).chr + destination[1, 1]
      unless check(origin, rook_location)
        @grid[rook_location] = @grid['H' + destination[1, 1]]
        @grid[rook_location].position = rook_location
        @grid['H' + destination[1, 1]] = '*'
        complete = true
        @grid[rook_location].move_count += 1
      end
    end
    if complete
      @grid[destination] = @grid[origin]
      @grid[destination].position = destination
      @grid[origin] = '*'
      @grid[destination].move_count += 1
    end
    complete
  end

  def checkmate
    in_checkmate = true
    king_position = king_location
    king_moves = @grid[king_position].all_moves(king_position, @grid)
    if check(king_position, king_position)
      king_moves.each do |destination|
        if check(king_position, destination) == false
          in_checkmate = false
        end
      end
    else
      in_checkmate = false
    end
    in_checkmate
  end

  def stalemate
    in_stalemate = true
    @grid.each do |key, value|
      unless value.is_a?(String)
        if value.color == @current_player
          moves = value.all_moves(key, @grid)
          moves.each do |destination|
            unless check(key, destination)
              in_stalemate = false
              break
            end
          end
        end
      end
    end
    in_stalemate
  end

  def king_location
    king_position = nil
    @grid.each do |key, value|
      unless value.is_a?(String)
        if value.is_a?(King) && value.color == @current_player
          king_position = key
        end
      end
    end
    king_position
  end

  def promotion_check
    top_row = %w[A8 B8 C8 D8 E8 F8 G8 H8]
    bottom_row = %w[A1 B1 C1 D1 E1 F1 G1 H1]
    top_row.each do |position|
      item = @grid[position]
      if item.is_a?(Pawn)
        if item.start == 'bottom'
          promote(position)
        end
      end
    end
    bottom_row.each do |position|
      item = @grid[position]
      if item.is_a?(Pawn)
        if item.start == 'top'
          promote(position)
        end
      end
    end
  end

  def promote(position)
    puts "The pawn at #{position} needs to be promoted"
    chess_piece = ask_for_promotion
    case chess_piece
    when 'queen'
      @grid[position] = Queen.new(@current_player, position)
    when 'rook'
      @grid[position] = Rook.new(@current_player, position)
    when 'bishop'
      @grid[position] = Bishop.new(@current_player, position)
    when 'knight'
      @grid[position] = Knight.new(@current_player, position)
    end
  end

  def ask_for_promotion
    puts 'What chess piece would you like to promote the pawn to?'
    puts 'Your options are: Queen, Rook, Bishop or Knight'
    correct_input = false
    until correct_input
      print 'Chess piece: '
      input = gets.chomp.downcase
      if %w[queen rook bishop knight].include?(input)
        correct_input = true
      else
        puts 'PLEASE ENTER A VALID CHESSPIECE (Queen, Rook, Bishop or Knight)'
      end
    end
    input
  end
end

board = Board.new('a', 'b')
board.grid['F1'] = '*'
board.grid['G1'] = '*'
board.grid['F8'] = '*'
board.grid['G8'] = '*'
board.grid['G7'] = Rook.new('black', 'G7')
board.show
board.move
board.show
