# frozen_string_literal: true
require './lib/chess'

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
    it 'correctly returns all moves if not on edge of board' do
      king = King.new('white', 'C5')
      result = king.all_moves
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

    it 'correctly returns all moves if in corner of board' do
      king = King.new('white', 'H8')
      result = king.all_moves
      expect(result.include?('H7')).to eql(true)
      expect(result.include?('G7')).to eql(true)
      expect(result.include?('G8')).to eql(true)
      expect(result.length).to eql(4)
    end

    it 'correctly returns castling moves if on first rank and @castled is false' do
      king = King.new('white', 'D1')
      result = king.all_moves
      expect(result.include?('B1')).to eql(true)
      expect(result.include?('F1')).to eql(true)
      expect(result.length).to eql(7)
    end

    it 'does not return castling moves if on first rank and @castled is true' do
      king = King.new('white', 'D1')
      king.castled = true
      result = king.all_moves
      expect(result.include?('B1')).to eql(false)
      expect(result.include?('F1')).to eql(false)
      expect(result.length).to eql(5)
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
    it 'correctly returns all moves' do
      rook = Rook.new('black', 'F4')
      result = rook.all_moves
      expect(result.include?('F8')).to eql(true)
      expect(result.include?('F7')).to eql(true)
      expect(result.include?('F6')).to eql(true)
      expect(result.include?('F5')).to eql(true)
      expect(result.include?('F4')).to eql(true)
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
      expect(result.length).to eql(15)
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