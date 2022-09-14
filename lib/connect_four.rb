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

# puts ConnectFour.new(1,1,1,1).row_win?([-1,-1,-1,-1,0,0,0])
