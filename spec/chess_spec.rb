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
  'H1' => '*',
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
  'H1' => '*',
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

    it 'correctly returns castling moves if on first rank and @castled is false' do
      king = King.new('white', 'D1')
      result = king.all_moves(king.position, blank_grid)
      expect(result.include?('B1')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.length).to eql(7)
    end

    it 'does not return castling moves if on first rank and @castled is true' do
      king = King.new('white', 'D1')
      king.castled = true
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
end
