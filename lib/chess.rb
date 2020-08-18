# frozen_string_literal: true

# An object representing the king chess piece
class King
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @possible_moves = legal_moves
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♔' : '♚'
  end

  def legal_moves
  end
end

# An object representing the rook chess piece
class Rook
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @possible_moves = legal_moves
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♖' : '♜'
  end

  def legal_moves
  end
end

# An object representing the bishop chess piece
class Bishop
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @possible_moves = legal_moves
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♗' : '♝'
  end

  def legal_moves
  end
end

# An object representing the queen chess piece
class Queen
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @possible_moves = legal_moves
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♕' : '♛'
  end

  def legal_moves
  end
end

# An object representing the knight chess piece
class Knight
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @possible_moves = legal_moves
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♘' : '♞'
  end

  def legal_moves
  end
end

# An object representing the pawn chess piece
class Pawn
  attr_accessor :color, :symbol, :position, :possible_moves, :move_count

  def initialize(color, position)
    @color = color
    @symbol = symbol_selector
    @position = position
    @possible_moves = legal_moves
    @move_count = 0
  end

  def symbol_selector
    @color == 'white' ? '♙' : '♟︎'
  end

  def legal_moves
  end
end
