# frozen_string_literal: true

require_relative 'game_logic'
require_relative 'player_io'
require_relative 'text'

# ConnectFour implementation
class ConnectFour
  include GameLogic
  include Text
  attr_reader :display, :players, :pieces, :win_state

  def initialize(display, players = [], pieces = default_pieces, win_state = 0)
    @display = display
    @players = players
    @pieces = pieces
    @win_state = win_state
  end

  def display_board
    output = print_board
    display.show(output)
  end

  def play
    display.show(introduction)
    wish_to_play = display.collect

    game_play_loop if wish_to_play.downcase == 'y'

    display.show(outcome_of_game)
    outcome_of_game
  end

  def player_names
    2.times do |num|
      display.show(prompt_for_name(num))
      players.push(display.collect)
    end
  end

  def print_board
    output = ''
    (@pieces.size - 1).times do |i|
      output += "#{print_row(i)}\n"
    end
    output += print_row(@pieces.size - 1)
    output
  end

  def print_row(row_number)
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

  def game_play_loop
    player_names
    display_board
    count = 0
    while @win_state.zero?
      current_player = count.even? ? 1 : -1
      display.show(prompt_for_move(current_player, @players))
      column = (display.collect.to_i - 1)
      drop_piece(current_player, column)
      display_board

      count += 1

      @win_state = winner
    end
  end

  def default_pieces
    [[0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0]]
  end
end
