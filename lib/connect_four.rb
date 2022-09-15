# frozen_string_literal: true

require_relative 'game_logic'
require_relative 'player_io'

# ConnectFour implementation
class ConnectFour
  include GameLogic
  attr_reader :display, :players, :pieces, :win_state

  def initialize(display, players, pieces = default_pieces, win_state = 0)
    @display = display
    @players = players
    @pieces = pieces
    @win_state = win_state
  end

  def display_board
    output = ''
    (@pieces.size - 1).times do |i|
      output += "#{display_row(i)}\n"
    end
    output += display_row(@pieces.size - 1)
    display.show(output)
  end

  def display_row(row_number)
    output = '|'
    @pieces[row_number].each do |el|
      case el
      when 1
        output += "\u25cb"
      when -1
        output += "\u25cf"
      else
        output += ' '
      end
      output += '|'
    end
    output
  end

  private

  def default_pieces
    [[0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0]]
  end
end

pieces = [[0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0, 0],
          [-1, 1, 0, 0, 0, 0, 0],
          [1, -1, 1, 0, 0, 0, 0],
          [1, -1, -1, 1, 0, 0, 0]]
game = ConnectFour.new(PlayerIO.new, %w[player1 player2], pieces)
game.display_board
