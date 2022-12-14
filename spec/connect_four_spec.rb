# frozen_string_literal: true

require_relative '../lib/connect_four'

describe ConnectFour do
  subject(:test_game) { ConnectFour.new('I am a display', %w[player1 player2], %w[piece1 piece2]) }

  describe '#initialize' do
    context 'when no win_state is supplied' do
      it 'has supplied display' do
        expect(test_game.display).to eq('I am a display')
      end
      it 'has supplied player list' do
        expect(test_game.players).to eql(%w[player1 player2])
      end
      it 'has supplied piece list' do
        expect(test_game.pieces).to eql(%w[piece1 piece2])
      end
      it 'has a zero for win_state' do
        expect(test_game.win_state).to eq(0)
      end
    end

    context 'when a win_state is supplied' do
      before do
        @win_state_given = ConnectFour.new('I am a display', %w[player1 player2], %w[piece1 piece2], 1)
      end

      it 'has the supplied win_state' do
        expect(@win_state_given.win_state).to be(1)
      end
    end
  end

  describe '#print_row' do
    context 'when a row of zeroes is given' do
      it 'returns "| | | | | | | |"' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [1, 0, 0, 0, 0, 0, 0],
                  [-1, 1, 0, 0, 0, 0, 0],
                  [1, -1, 1, 0, 0, 0, 0],
                  [1, -1, -1, 1, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        output = game.print_row(0)
        expect(output).to eql("| | | | | | | |")
      end
    end

    context 'when a row of mixed pieces is given' do
      it 'returns the correct output' do
        pieces = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [1, 0, 0, 0, 0, 0, 0],
                  [-1, 1, 0, 0, 0, 0, 0],
                  [1, -1, 1, 0, 0, 0, 0],
                  [1, -1, -1, 1, 0, 0, 0]]
        game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
        output = game.print_row(5)
        expect(output).to eql("|\u25cb|\u25cf|\u25cf|\u25cb| | | |")
      end
    end
  end

  describe '#print_board' do
    it 'prints the entire board' do
      pieces = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [1, 0, 0, 0, 0, 0, 0],
                [-1, 1, 0, 0, 0, 0, 0],
                [1, -1, 1, 0, 0, 0, 0],
                [1, -1, -1, 1, 0, 0, 0]]
      game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
      output = game.print_board
      expect(output).to eql("| | | | | | | |\n"\
                            "| | | | | | | |\n"\
                            "|\u25cb| | | | | | |\n"\
                            "|\u25cf|\u25cb| | | | | |\n"\
                            "|\u25cb|\u25cf|\u25cb| | | | |\n"\
                            "|\u25cb|\u25cf|\u25cf|\u25cb| | | |")
    end
  end

  describe '#play' do
    subject(:game_play) { ConnectFour.new(display, %w[player1 player2]) }

    let(:display) { instance_double(PlayerIO) }

    context 'when the first player wins' do
      before do
        allow(game_play.display).to receive(:show)
        allow(game_play.display).to receive(:collect).and_return('y', '1', '3', '1', '3', '1', '3', '1')
      end
      it 'congratulates the first player' do
        expect(game_play.play).to eql('Congratulations, player1! You win!')
      end
    end

    context 'when the second player wins' do
      before do
        allow(game_play.display).to receive(:show)
        allow(game_play.display).to receive(:collect).and_return('y', '-1', '3', '-1', '3', '2', '3', '-1', '3')
      end
      it 'congratulates the second player' do
        expect(game_play.play).to eql('Congratulations, player2! You win!')
      end
    end
  end

  describe '#display_board' do
    # sends message to Display and makes no state changes -- requires no test
  end
end
