# frozen_string_literal: true
require './lib/chess'

describe King do
  describe '#symbol_selector' do
    it 'sets @symbol as ♔ if @color is white' do
      king = King.new('white', [0, 0])
      expect(king.symbol).to eql('♔')
    end

    it 'sets @symbol as ♚ if @color is black' do
      king = King.new('black', [0, 0])
      expect(king.symbol).to eql('♚')
    end
  end
end

describe Rook do
  describe '#symbol_selector' do
    it 'sets @symbol as ♖ if @color is white' do
      rook = Rook.new('white', [0, 0])
      expect(rook.symbol).to eql('♖')
    end

    it 'sets @symbol as ♜ if @color is black' do
      rook = Rook.new('black', [0, 0])
      expect(rook.symbol).to eql('♜')
    end
  end
end

describe Bishop do
  describe '#symbol_selector' do
    it 'sets @symbol as ♗ if @color is white' do
      bishop = Bishop.new('white', [0, 0])
      expect(bishop.symbol).to eql('♗')
    end

    it 'sets @symbol as ♝ if @color is black' do
      bishop = Bishop.new('black', [0, 0])
      expect(bishop.symbol).to eql('♝')
    end
  end
end

describe Queen do
  describe '#symbol_selector' do
    it 'sets @symbol as ♕ if @color is white' do
      queen = Queen.new('white', [0, 0])
      expect(queen.symbol).to eql('♕')
    end

    it 'sets @symbol as ♛ if @color is black' do
      queen = Queen.new('black', [0, 0])
      expect(queen.symbol).to eql('♛')
    end
  end
end

describe Knight do
  describe '#symbol_selector' do
    it 'sets @symbol as ♘ if @color is white' do
      knight = Knight.new('white', [0, 0])
      expect(knight.symbol).to eql('♘')
    end

    it 'sets @symbol as ♞ if @color is black' do
      knight = Knight.new('black', [0, 0])
      expect(knight.symbol).to eql('♞')
    end
  end
end

describe Pawn do
  describe '#symbol_selector' do
    it 'sets @symbol as ♙ if @color is white' do
      pawn = Pawn.new('white', [0, 0])
      expect(pawn.symbol).to eql('♙')
    end

    it 'sets @symbol as ♟︎ if @color is black' do
      pawn = Pawn.new('black', [0, 0])
      expect(pawn.symbol).to eql('♟︎')
    end
  end
end