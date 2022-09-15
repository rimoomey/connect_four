# frozen_string_literal: true

require_relative '../lib/game_logic'
require_relative '../lib/connect_four'

describe GameLogic do
  describe '#winner' do
    context 'when player1 has won' do
      it 'returns 1' do
        pieces = [[1, 1, 1, 1, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(1)
      end
    end

    context 'when player2 has won' do
      it 'returns -1' do
        pieces = [[-1, -1, -1, -1, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(-1)
      end
    end

    context 'when player1 has won in row 2' do
      it 'returns 1' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 1, 1, 1, 1, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(1)
      end
    end

    context 'when player2 has won vertically' do
      it 'returns -1' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, -1, 0, 0, 0, 0, 0],
                  [0, -1, 0, 0, 0, 0, 0],
                  [0, -1, 0, 0, 0, 0, 0],
                  [0, -1, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(-1)
      end
    end

    context 'when player1 has won in a diagonal' do
      it 'returns 1 for first downward diagonal option' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [1, 0, 0, 0, 0, 0, 0],
                  [0, 1, 0, 0, 0, 0, 0],
                  [0, 0, 1, 0, 0, 0, 0],
                  [0, 0, 0, 1, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(1)
      end
      it 'returns 1 for a second downward diagonal option' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 1, 0, 0, 0, 0, 0],
                  [0, 0, 1, 0, 0, 0, 0],
                  [0, 0, 0, 1, 0, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(1)
      end
      it 'returns 1 for an upward diagonal option' do
        pieces = [[0, 0, 0, 0, 0, 0, 1],
                  [0, 0, 0, 0, 0, 1, 0],
                  [0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 1, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(1)
      end
      it 'returns 1 for a second upward diagonal' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 1, 0, 0, 0],
                  [0, 0, 1, 0, 0, 0, 0],
                  [0, 1, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(1)
      end
    end

    context 'when player2 has won in a diagonal' do
      it 'returns -1 for first downward diagonal option ' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, -1, 0, 0, 0],
                  [0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, 0, 0, -1, 0],
                  [0, 0, 0, 0, 0, 0, -1]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(-1)
      end
      it 'returns -1 for a second downward diagonal option' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, -1, 0, 0, 0, 0],
                  [0, 0, 0, -1, 0, 0, 0],
                  [0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, 0, 0, -1, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(-1)
      end
      it 'returns -1 for an upward diagonal option' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, -1, 0, 0, 0],
                  [0, 0, -1, 0, 0, 0, 0],
                  [0, -1, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(-1)
      end
      it 'returns -1 for a second upward diagonal option' do
        pieces = [[0, 0, 0, -1, 0, 0, 0],
                  [0, 0, -1, 0, 0, 0, 0],
                  [0, -1, 0, 0, 0, 0, 0],
                  [-1, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(-1)
      end
    end

    context 'when player2 has won but player1 has also played' do
      it 'returns -1' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, -1, 0, 0, 0, 0, 0],
                  [0, -1, 1, 0, 0, 0, 0],
                  [0, -1, 0, 1, 0, 0, 0],
                  [0, -1, 0, 0, 1, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(-1)
      end
    end

    context 'when no one has won' do
      it 'returns 0' do
        pieces = [[0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, -1, 1, 0, 0, 0, -1],
                  [0, -1, 0, 1, 0, 0, 0],
                  [0, -1, 0, 0, 1, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(0)
      end
    end
  end

  describe '#column_full?' do
    context 'when a column is full' do
      it 'returns true' do
        pieces = [[0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.column_full?(4)).to be(true)
      end
    end
    context 'when a column is not full' do
      it 'returns false' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0],
                  [0, 0, 0, 0, -1, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.column_full?(4)).to be(false)
      end
    end
  end
end
