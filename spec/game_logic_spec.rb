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
      xit 'returns -1' do
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
      xit 'returns 1' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 1, 0, 0, 0, 0, 0],
                  [0, 0, 1, 0, 0, 0, 0],
                  [0, 0, 0, 1, 0, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        expect(game.winner).to eq(1)
      end
    end

    context 'when player2 has won and player1 has also played' do
      xit 'returns 1' do
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
      xit 'returns 0' do
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
end
