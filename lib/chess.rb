# frozen_string_literal: true

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
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count, :castled

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
    @castled = false
  end

  def symbol_selector
    @color == 'white' ? '♔' : '♚'
  end

  def all_moves
    current_position = @position.dup
    moves = []
    unless current_position[0, 1] == 'H'
      moves.push(current_position[0, 1].next + current_position[1, 1])
    end
    unless current_position[0, 1] == 'A'
      moves.push((current_position[0, 1].ord - 1).chr + current_position[1, 1])
    end
    unless current_position[1, 1] == '8'
      moves.push(current_position[0, 1] + current_position[1, 1].next)
    end
    unless current_position[1, 1] == '1'
      moves.push(current_position[0, 1] + (current_position[1, 1].to_i - 1).to_s)
    end
    unless current_position[0, 1] == 'A' || current_position[1, 1] == '8'
      moves.push((current_position[0, 1].ord - 1).chr + current_position[1, 1].next)
    end
    unless current_position[0, 1] == 'H' || current_position[1, 1] == '8'
      moves.push(current_position[0, 1].next + current_position[1, 1].next)
    end
    unless current_position[0, 1] == 'H' || current_position[1, 1] == '1'
      moves.push(current_position[0, 1].next + (current_position[1, 1].to_i - 1).to_s)
    end
    unless current_position[0, 1] == 'A' || current_position[1, 1] == '1'
      moves.push((current_position[0, 1].ord - 1).chr + (current_position[1, 1].to_i - 1).to_s)
    end
    if @castled == false && (current_position[1, 1] == '1' || current_position[1, 1] == '8')
      unless current_position[0, 1] == 'A' || current_position[0, 1] == 'B'
        moves.push((current_position[0, 1].ord - 2).chr + current_position[1, 1])
      end
      unless current_position[0, 1] == 'G' || current_position[0, 1] == 'H'
        moves.push((current_position[0, 1].ord + 2).chr + current_position[1, 1])
      end
    end
    moves.uniq
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
end

# An object representing the pawn chess piece
class Pawn
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♙' : '♟︎'
  end
end

# An object representing the game board, containing all information about whats on it
class Board
  attr_accessor :black, :white, :grid

  def initialize(black, white)
    @black = black
    @white = white
    @grid = make_grid
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
      puts "| #{counter.to_s}"
      counter -= 1
    end
    puts ' -----------------'
  end

  def test_for_path(position)
  end
end

# board = Board.new('a', 'b')
# board.show
