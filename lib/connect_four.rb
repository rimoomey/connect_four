# frozen_string_literal: true

# ConnectFour implementation
class ConnectFour
  attr_reader :display, :players, :pieces, :win_state

  def initialize(display, players, pieces, win_state = 0)
    @display = display
    @players = players
    @pieces = pieces
    @win_state = win_state
  end
end
