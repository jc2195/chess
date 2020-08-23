# frozen_string_literal: true
require './lib/chess'

blank_grid = {
  'A8' => '*',
  'B8' => '*',
  'C8' => '*',
  'D8' => '*',
  'E8' => '*',
  'F8' => '*',
  'G8' => '*',
  'H8' => '*',
  'A7' => '*',
  'B7' => '*',
  'C7' => '*',
  'D7' => '*',
  'E7' => '*',
  'F7' => '*',
  'G7' => '*',
  'H7' => '*',
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
  'A2' => '*',
  'B2' => '*',
  'C2' => '*',
  'D2' => '*',
  'E2' => '*',
  'F2' => '*',
  'G2' => '*',
  'H2' => '*',
  'A1' => '*',
  'B1' => '*',
  'C1' => '*',
  'D1' => '*',
  'E1' => '*',
  'F1' => '*',
  'G1' => '*',
  'H1' => '*'
}

movement_test_grid = {
  'A8' => '*',
  'B8' => '*',
  'C8' => '*',
  'D8' => '*',
  'E8' => '*',
  'F8' => '*',
  'G8' => '*',
  'H8' => '*',
  'A7' => '*',
  'B7' => '*',
  'C7' => '*',
  'D7' => '*',
  'E7' => '*',
  'F7' => '*',
  'G7' => '*',
  'H7' => '*',
  'A6' => '*',
  'B6' => '*',
  'C6' => '*',
  'D6' => Pawn.new('white', 'D6'),
  'E6' => '*',
  'F6' => Pawn.new('white', 'F6'),
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
  'C4' => Pawn.new('black', 'C4'),
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
  'A2' => '*',
  'B2' => '*',
  'C2' => '*',
  'D2' => Pawn.new('black', 'D2'),
  'E2' => '*',
  'F2' => '*',
  'G2' => '*',
  'H2' => '*',
  'A1' => '*',
  'B1' => '*',
  'C1' => '*',
  'D1' => '*',
  'E1' => '*',
  'F1' => '*',
  'G1' => '*',
  'H1' => '*'
}

pawn_test_grid = {
  'A8' => '*',
  'B8' => '*',
  'C8' => '*',
  'D8' => '*',
  'E8' => '*',
  'F8' => '*',
  'G8' => '*',
  'H8' => '*',
  'A7' => '*',
  'B7' => '*',
  'C7' => '*',
  'D7' => '*',
  'E7' => '*',
  'F7' => '*',
  'G7' => '*',
  'H7' => '*',
  'A6' => '*',
  'B6' => '*',
  'C6' => '*',
  'D6' => '*',
  'E6' => Pawn.new('white', 'E6'),
  'F6' => '*',
  'G6' => Pawn.new('black', 'G6'),
  'H6' => '*',
  'A5' => '*',
  'B5' => '*',
  'C5' => '*',
  'D5' => '*',
  'E5' => '*',
  'F5' => Pawn.new('black', 'F5'),
  'G5' => '*',
  'H5' => '*',
  'A4' => '*',
  'B4' => '*',
  'C4' => '*',
  'D4' => '*',
  'E4' => '*',
  'F4' => Pawn.new('black', 'F4'),
  'G4' => '*',
  'H4' => '*',
  'A3' => '*',
  'B3' => '*',
  'C3' => '*',
  'D3' => '*',
  'E3' => Pawn.new('white', 'E3'),
  'F3' => '*',
  'G3' => Pawn.new('black', 'G3'),
  'H3' => '*',
  'A2' => '*',
  'B2' => '*',
  'C2' => '*',
  'D2' => '*',
  'E2' => '*',
  'F2' => '*',
  'G2' => '*',
  'H2' => '*',
  'A1' => '*',
  'B1' => '*',
  'C1' => '*',
  'D1' => '*',
  'E1' => '*',
  'F1' => '*',
  'G1' => '*',
  'H1' => '*'
}

check_grid = {
  'A8' => '*',
  'B8' => '*',
  'C8' => King.new('black', 'C8'),
  'D8' => '*',
  'E8' => Bishop.new('black', 'E8'),
  'F8' => '*',
  'G8' => '*',
  'H8' => '*',
  'A7' => Pawn.new('black', 'A7'),
  'B7' => Pawn.new('black', 'B7'),
  'C7' => Pawn.new('black', 'C7'),
  'D7' => '*',
  'E7' => '*',
  'F7' => '*',
  'G7' => '*',
  'H7' => '*',
  'A6' => '*',
  'B6' => '*',
  'C6' => '*',
  'D6' => '*',
  'E6' => '*',
  'F6' => '*',
  'G6' => '*',
  'H6' => '*',
  'A5' => Rook.new('black', 'A5'),
  'B5' => '*',
  'C5' => '*',
  'D5' => '*',
  'E5' => '*',
  'F5' => Bishop.new('white', 'F5'),
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
  'A2' => '*',
  'B2' => '*',
  'C2' => '*',
  'D2' => '*',
  'E2' => '*',
  'F2' => Pawn.new('white', 'F2'),
  'G2' => '*',
  'H2' => Pawn.new('white', 'F2'),
  'A1' => '*',
  'B1' => '*',
  'C1' => '*',
  'D1' => '*',
  'E1' => '*',
  'F1' => Rook.new('white', 'F1'),
  'G1' => King.new('white', 'G1'),
  'H1' => '*'
}

checkmate_grid = {
  'A8' => '*',
  'B8' => '*',
  'C8' => '*',
  'D8' => '*',
  'E8' => Queen.new('white', 'E8'),
  'F8' => '*',
  'G8' => King.new('black', 'G8'),
  'H8' => '*',
  'A7' => '*',
  'B7' => '*',
  'C7' => '*',
  'D7' => '*',
  'E7' => '*',
  'F7' => Pawn.new('black', 'F7'),
  'G7' => Pawn.new('black', 'G7'),
  'H7' => Pawn.new('black', 'H7'),
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
  'G5' => Queen.new('black', 'G5'),
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
  'B3' => Rook.new('black', 'B3'),
  'C3' => '*',
  'D3' => '*',
  'E3' => '*',
  'F3' => '*',
  'G3' => '*',
  'H3' => '*',
  'A2' => '*',
  'B2' => '*',
  'C2' => '*',
  'D2' => '*',
  'E2' => '*',
  'F2' => Pawn.new('white', 'F2'),
  'G2' => Pawn.new('white', 'G2'),
  'H2' => Pawn.new('white', 'H2'),
  'A1' => '*',
  'B1' => '*',
  'C1' => '*',
  'D1' => '*',
  'E1' => '*',
  'F1' => Rook.new('white', 'F1'),
  'G1' => King.new('white', 'G1'),
  'H1' => '*'
}

stalemate_grid = {
  'A8' => '*',
  'B8' => '*',
  'C8' => '*',
  'D8' => '*',
  'E8' => '*',
  'F8' => '*',
  'G8' => '*',
  'H8' => '*',
  'A7' => '*',
  'B7' => '*',
  'C7' => '*',
  'D7' => '*',
  'E7' => '*',
  'F7' => '*',
  'G7' => King.new('black', 'G7'),
  'H7' => '*',
  'A6' => '*',
  'B6' => '*',
  'C6' => '*',
  'D6' => '*',
  'E6' => '*',
  'F6' => '*',
  'G6' => '*',
  'H6' => '*',
  'A5' => '*',
  'B5' => Pawn.new('black', 'B5'),
  'C5' => '*',
  'D5' => '*',
  'E5' => Pawn.new('black', 'E5'),
  'F5' => '*',
  'G5' => '*',
  'H5' => Pawn.new('black', 'H5'),
  'A4' => '*',
  'B4' => Pawn.new('white', 'B4'),
  'C4' => '*',
  'D4' => '*',
  'E4' => Pawn.new('white', 'E4'),
  'F4' => Knight.new('black', 'F4'),
  'G4' => '*',
  'H4' => Pawn.new('white', 'H4'),
  'A3' => '*',
  'B3' => '*',
  'C3' => '*',
  'D3' => '*',
  'E3' => '*',
  'F3' => Pawn.new('white', 'F3'),
  'G3' => Queen.new('black', 'G3'),
  'H3' => '*',
  'A2' => '*',
  'B2' => '*',
  'C2' => '*',
  'D2' => '*',
  'E2' => Rook.new('black', 'E2'),
  'F2' => '*',
  'G2' => '*',
  'H2' => '*',
  'A1' => '*',
  'B1' => '*',
  'C1' => '*',
  'D1' => '*',
  'E1' => '*',
  'F1' => '*',
  'G1' => '*',
  'H1' => King.new('white', 'H1')
}

describe King do
  describe '#symbol_selector' do
    it 'sets @symbol as ♔ if @color is white' do
      king = King.new('white', 'A1')
      expect(king.symbol).to eql('♔')
    end

    it 'sets @symbol as ♚ if @color is black' do
      king = King.new('black', 'A1')
      expect(king.symbol).to eql('♚')
    end
  end

  describe '#all_moves' do
    it 'correctly returns all moves if not on edge of clear board' do
      king = King.new('white', 'C5')
      result = king.all_moves(king.position, blank_grid)
      expect(result.include?('C6')).to eql(true)
      expect(result.include?('D6')).to eql(true)
      expect(result.include?('D5')).to eql(true)
      expect(result.include?('D4')).to eql(true)
      expect(result.include?('C4')).to eql(true)
      expect(result.include?('B4')).to eql(true)
      expect(result.include?('B5')).to eql(true)
      expect(result.include?('B6')).to eql(true)
      expect(result.length).to eql(8)
    end

    it 'correctly returns all moves if in corner of clear board' do
      king = King.new('white', 'H8')
      result = king.all_moves(king.position, blank_grid)
      expect(result.include?('H7')).to eql(true)
      expect(result.include?('F8')).to eql(true)
      expect(result.include?('G7')).to eql(true)
      expect(result.include?('G8')).to eql(true)
      expect(result.length).to eql(4)
    end

    it 'correctly returns castling moves if on first rank and @move_count is 0' do
      king = King.new('white', 'D1')
      result = king.all_moves(king.position, blank_grid)
      expect(result.include?('B1')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.length).to eql(7)
    end

    it 'does not return castling moves if on first rank and @move_count is greater than 0' do
      king = King.new('white', 'D1')
      king.move_count = 1
      result = king.all_moves(king.position, blank_grid)
      expect(result.include?('B1')).to eql(false)
      expect(result.include?('F1')).to eql(false)
      expect(result.length).to eql(5)
    end

    it 'correctly returns all moves if on occupied board' do
      king = King.new('white', 'D5')
      result = king.all_moves(king.position, movement_test_grid)
      expect(result.include?('D6')).to eql(false)
      expect(result.include?('C4')).to eql(true)
      expect(result.include?('C5')).to eql(true)
      expect(result.include?('C6')).to eql(true)
      expect(result.include?('E6')).to eql(true)
      expect(result.include?('E5')).to eql(true)
      expect(result.include?('E4')).to eql(true)
      expect(result.include?('D4')).to eql(true)
      expect(result.length).to eql(7)
    end

    it 'correctly returns castling moves if on first rank and @castled is false and board is occupied' do
      king = King.new('white', 'D1')
      result = king.all_moves(king.position, blank_grid)
      expect(result.include?('B1')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.length).to eql(7)
    end
  end
end

describe Rook do
  describe '#symbol_selector' do
    it 'sets @symbol as ♖ if @color is white' do
      rook = Rook.new('white', 'A1')
      expect(rook.symbol).to eql('♖')
    end

    it 'sets @symbol as ♜ if @color is black' do
      rook = Rook.new('black', 'A1')
      expect(rook.symbol).to eql('♜')
    end
  end

  describe '#all_moves' do
    it 'correctly returns all moves on blank board' do
      rook = Rook.new('black', 'F4')
      result = rook.all_moves(rook.position, blank_grid)
      expect(result.include?('F8')).to eql(true)
      expect(result.include?('F7')).to eql(true)
      expect(result.include?('F6')).to eql(true)
      expect(result.include?('F5')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.include?('F3')).to eql(true)
      expect(result.include?('F2')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.include?('A4')).to eql(true)
      expect(result.include?('B4')).to eql(true)
      expect(result.include?('C4')).to eql(true)
      expect(result.include?('D4')).to eql(true)
      expect(result.include?('E4')).to eql(true)
      expect(result.include?('G4')).to eql(true)
      expect(result.include?('H4')).to eql(true)
      expect(result.length).to eql(14)
    end

    it 'correctly returns all moves when other chess pieces are on movement path' do
      rook = Rook.new('black', 'F4')
      result = rook.all_moves(rook.position, movement_test_grid)
      expect(result.include?('F8')).to eql(false)
      expect(result.include?('F7')).to eql(false)
      expect(result.include?('F6')).to eql(true)
      expect(result.include?('F5')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.include?('F3')).to eql(true)
      expect(result.include?('F2')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.include?('A4')).to eql(false)
      expect(result.include?('B4')).to eql(false)
      expect(result.include?('C4')).to eql(false)
      expect(result.include?('D4')).to eql(true)
      expect(result.include?('E4')).to eql(true)
      expect(result.include?('G4')).to eql(true)
      expect(result.include?('H4')).to eql(true)
      expect(result.length).to eql(9)
    end
  end
end

describe Bishop do
  describe '#symbol_selector' do
    it 'sets @symbol as ♗ if @color is white' do
      bishop = Bishop.new('white', 'A1')
      expect(bishop.symbol).to eql('♗')
    end

    it 'sets @symbol as ♝ if @color is black' do
      bishop = Bishop.new('black', 'A1')
      expect(bishop.symbol).to eql('♝')
    end
  end

  describe '#all_moves' do
    it 'correctly returns all moves on blank board' do
      bishop = Bishop.new('black', 'F4')
      result = bishop.all_moves(bishop.position, blank_grid)
      expect(result.include?('G5')).to eql(true)
      expect(result.include?('H6')).to eql(true)
      expect(result.include?('G3')).to eql(true)
      expect(result.include?('H2')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.include?('E3')).to eql(true)
      expect(result.include?('D2')).to eql(true)
      expect(result.include?('C1')).to eql(true)
      expect(result.include?('E5')).to eql(true)
      expect(result.include?('D6')).to eql(true)
      expect(result.include?('C7')).to eql(true)
      expect(result.include?('B8')).to eql(true)
      expect(result.length).to eql(11)
    end

    it 'correctly returns all moves when other chess pieces are on movement path' do
      bishop = Bishop.new('black', 'F4')
      result = bishop.all_moves(bishop.position, movement_test_grid)
      expect(result.include?('G5')).to eql(true)
      expect(result.include?('H6')).to eql(true)
      expect(result.include?('G3')).to eql(true)
      expect(result.include?('H2')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.include?('E3')).to eql(true)
      expect(result.include?('D2')).to eql(false)
      expect(result.include?('C1')).to eql(false)
      expect(result.include?('E5')).to eql(true)
      expect(result.include?('D6')).to eql(true)
      expect(result.include?('C7')).to eql(false)
      expect(result.include?('B8')).to eql(false)
      expect(result.length).to eql(7)
    end
  end
end

describe Queen do
  describe '#symbol_selector' do
    it 'sets @symbol as ♕ if @color is white' do
      queen = Queen.new('white', 'A1')
      expect(queen.symbol).to eql('♕')
    end

    it 'sets @symbol as ♛ if @color is black' do
      queen = Queen.new('black', 'A1')
      expect(queen.symbol).to eql('♛')
    end
  end

  describe '#all_moves' do
    it 'correctly returns all moves on blank board' do
      queen = Queen.new('black', 'F4')
      result = queen.all_moves(queen.position, blank_grid)
      expect(result.include?('G5')).to eql(true)
      expect(result.include?('H6')).to eql(true)
      expect(result.include?('G3')).to eql(true)
      expect(result.include?('H2')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.include?('E3')).to eql(true)
      expect(result.include?('D2')).to eql(true)
      expect(result.include?('C1')).to eql(true)
      expect(result.include?('E5')).to eql(true)
      expect(result.include?('D6')).to eql(true)
      expect(result.include?('C7')).to eql(true)
      expect(result.include?('B8')).to eql(true)
      expect(result.include?('F8')).to eql(true)
      expect(result.include?('F7')).to eql(true)
      expect(result.include?('F6')).to eql(true)
      expect(result.include?('F5')).to eql(true)
      expect(result.include?('F3')).to eql(true)
      expect(result.include?('F2')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.include?('A4')).to eql(true)
      expect(result.include?('B4')).to eql(true)
      expect(result.include?('C4')).to eql(true)
      expect(result.include?('D4')).to eql(true)
      expect(result.include?('E4')).to eql(true)
      expect(result.include?('G4')).to eql(true)
      expect(result.include?('H4')).to eql(true)
      expect(result.length).to eql(25)
    end

    it 'correctly returns all moves when other chess pieces are on movement path' do
      queen = Queen.new('black', 'F4')
      result = queen.all_moves(queen.position, movement_test_grid)
      expect(result.include?('F8')).to eql(false)
      expect(result.include?('F7')).to eql(false)
      expect(result.include?('F6')).to eql(true)
      expect(result.include?('F5')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.include?('F3')).to eql(true)
      expect(result.include?('F2')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.include?('A4')).to eql(false)
      expect(result.include?('B4')).to eql(false)
      expect(result.include?('C4')).to eql(false)
      expect(result.include?('D4')).to eql(true)
      expect(result.include?('E4')).to eql(true)
      expect(result.include?('G4')).to eql(true)
      expect(result.include?('H4')).to eql(true)
      expect(result.include?('G5')).to eql(true)
      expect(result.include?('H6')).to eql(true)
      expect(result.include?('G3')).to eql(true)
      expect(result.include?('H2')).to eql(true)
      expect(result.include?('E3')).to eql(true)
      expect(result.include?('D2')).to eql(false)
      expect(result.include?('C1')).to eql(false)
      expect(result.include?('E5')).to eql(true)
      expect(result.include?('D6')).to eql(true)
      expect(result.include?('C7')).to eql(false)
      expect(result.include?('B8')).to eql(false)
      expect(result.length).to eql(16)
    end
  end
end

describe Knight do
  describe '#symbol_selector' do
    it 'sets @symbol as ♘ if @color is white' do
      knight = Knight.new('white', 'A1')
      expect(knight.symbol).to eql('♘')
    end

    it 'sets @symbol as ♞ if @color is black' do
      knight = Knight.new('black', 'A1')
      expect(knight.symbol).to eql('♞')
    end
  end

  describe '#all_moves' do
    it 'correctly returns all moves on blank board' do
      knight = Knight.new('black', 'F4')
      result = knight.all_moves(knight.position, blank_grid)
      expect(result.include?('E6')).to eql(true)
      expect(result.include?('G6')).to eql(true)
      expect(result.include?('H5')).to eql(true)
      expect(result.include?('H3')).to eql(true)
      expect(result.include?('G2')).to eql(true)
      expect(result.include?('E2')).to eql(true)
      expect(result.include?('D3')).to eql(true)
      expect(result.include?('D5')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.length).to eql(8)
    end

    it 'correctly returns all moves if on occupied board' do
      knight = Knight.new('black', 'C4')
      result = knight.all_moves(knight.position, movement_test_grid)
      expect(result.include?('B6')).to eql(true)
      expect(result.include?('D6')).to eql(true)
      expect(result.include?('E5')).to eql(true)
      expect(result.include?('E3')).to eql(true)
      expect(result.include?('D2')).to eql(false)
      expect(result.include?('B2')).to eql(true)
      expect(result.include?('A3')).to eql(true)
      expect(result.include?('A5')).to eql(true)
      expect(result.include?('C4')).to eql(false)
      expect(result.length).to eql(7)
    end

    it 'correctly returns all moves if on edge of blank board' do
      knight = Knight.new('black', 'B1')
      result = knight.all_moves(knight.position, blank_grid)
      expect(result.include?('A3')).to eql(true)
      expect(result.include?('C3')).to eql(true)
      expect(result.include?('D2')).to eql(true)
      expect(result.length).to eql(3)
    end
  end
end

describe Pawn do
  describe '#symbol_selector' do
    it 'sets @symbol as ♙ if @color is white' do
      pawn = Pawn.new('white', 'A1')
      expect(pawn.symbol).to eql('♙')
    end

    it 'sets @symbol as ♟︎ if @color is black' do
      pawn = Pawn.new('black', 'A1')
      expect(pawn.symbol).to eql('♟︎')
    end
  end

  describe '#start' do
    it 'correctly returns top when pawn is initialized on row 7' do
      pawn = Pawn.new('white', 'A7')
      expect(pawn.start).to eql('top')
    end

    it 'correctly returns bottom when pawn is initialized on row 2' do
      pawn = Pawn.new('white', 'A2')
      expect(pawn.start).to eql('bottom')
    end
  end

  describe '#all_moves' do
    it 'correctly returns all moves on blank board if in starting position on bottom' do
      pawn = Pawn.new('black', 'D2')
      result = pawn.all_moves(pawn.position, blank_grid)
      expect(result.include?('D3')).to eql(true)
      expect(result.include?('D4')).to eql(true)
      expect(result.length).to eql(2)
    end

    it 'correctly returns all moves on blank board if in starting position on top' do
      pawn = Pawn.new('black', 'D7')
      result = pawn.all_moves(pawn.position, blank_grid)
      expect(result.include?('D6')).to eql(true)
      expect(result.include?('D5')).to eql(true)
      expect(result.length).to eql(2)
    end

    it 'correctly returns all moves on occupied board if in starting position on bottom' do
      pawn = Pawn.new('black', 'F2')
      result = pawn.all_moves(pawn.position, pawn_test_grid)
      expect(result.include?('F3')).to eql(true)
      expect(result.include?('F4')).to eql(false)
      expect(result.include?('G3')).to eql(false)
      expect(result.include?('E3')).to eql(true)
      expect(result.length).to eql(2)
    end

    it 'correctly returns all moves on occupied board if in starting position on top' do
      pawn = Pawn.new('black', 'F7')
      result = pawn.all_moves(pawn.position, pawn_test_grid)
      expect(result.include?('F6')).to eql(true)
      expect(result.include?('F5')).to eql(false)
      expect(result.include?('G6')).to eql(false)
      expect(result.include?('E6')).to eql(true)
      expect(result.length).to eql(2)
    end
  end
end

describe Board do
  # describe '#check' do
  #   it 'returns true if current player is in check' do
  #     board = Board.new('a', 'b')
  #     board.grid = check_grid
  #     board.current_player = 'black'
  #     result = board.check('A5', 'A6')
  #     expect(result).to eql(true)
  #   end

  #   it 'returns false if current player is not in check' do
  #     board = Board.new('a', 'b')
  #     board.grid = check_grid
  #     board.current_player = 'black'
  #     result = board.check('C8', 'B8')
  #     expect(result).to eql(false)
  #   end
  # end

  # describe '#checkmate' do
  #   it 'returns true if the current player is in checkmate' do
  #     board = Board.new('a', 'b')
  #     board.grid = checkmate_grid
  #     board.current_player = 'black'
  #     result = board.checkmate
  #     expect(result).to eql(true)
  #   end

  #   it 'returns false if the current player is not in checkmate' do
  #     board = Board.new('a', 'b')
  #     board.grid = check_grid
  #     board.current_player = 'black'
  #     result = board.checkmate
  #     expect(result).to eql(false)
  #   end

  #   it 'returns false if the current player is not in checkmate but is in stalemate' do
  #     board = Board.new('a', 'b')
  #     board.grid = stalemate_grid
  #     result = board.checkmate
  #     expect(result).to eql(false)
  #   end
  # end

  describe '#stalemate' do
    it 'returns true if the current player is in stalemate' do
      board = Board.new('a', 'b')
      board.grid = stalemate_grid
      board.grid['B5'].start = 'top'
      board.grid['E5'].start = 'top'
      board.grid['H5'].start = 'top'
      board.grid['B4'].start = 'bottom'
      board.grid['E4'].start = 'bottom'
      board.grid['H4'].start = 'bottom'
      board.grid['F3'].start = 'bottom'
      board.grid['B5'].move_count = 5
      board.grid['E5'].move_count = 5
      board.grid['H5'].move_count = 5
      board.grid['B4'].move_count = 5
      board.grid['E4'].move_count = 5
      board.grid['H4'].move_count = 5
      board.grid['F3'].move_count = 5
      board.grid['H1'].move_count = 5
      result = board.stalemate
      expect(result).to eql(true)
    end

    it 'returns false if the current player is not in stalemate' do
      board = Board.new('a', 'b')
      board.grid = check_grid
      result = board.stalemate
      expect(result).to eql(false)
    end
  end
end
