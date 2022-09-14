# frozen_string_literal: true

require_relative 'game_logic'

# ConnectFour implementation
class ConnectFour
  include GameLogic
  attr_reader :display, :players, :pieces, :win_state

  def initialize(display, players, pieces, win_state = 0)
    @display = display
    @players = players
    @pieces = pieces
    @win_state = win_state
  end
end

pieces = [[0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0, 0],
          [0, 1, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0, 0]]
game = ConnectFour.new('dummy display', %w[player1 player2], pieces)
puts game.winner
