# frozen_string_literal: true

# module for text prompt content
module Text
  def introduction
    "Welcome to Connect Four! This is a competitive game for two players.\n\n" \
      "To play, the players will take turns dropping black and white tokens into\n" \
      "the columns of the game board. An example is pictured below: \n \n" \
      "| | | | | | | |\n" \
      "| | | | | | | |\n" \
      "| | |\u25cf| | | | |\n" \
      "| | |\u25cb|\u25cf| | | |\n" \
      "| | |\u25cb|\u25cb|\u25cf| | |\n" \
      "| | |\u25cb|\u25cb|\u25cb|\u25cf| |\n\n" \
      "To win, you must place four of your tokens in a row in any direction: up and down, \n" \
      "side-to-side, or diagonally. Would you like to play? \n" \
      'Y/N: '
  end

  def outcome_of_game
    winner = ''
    if @win_state == 1
      winner = @players[0]
    elsif @win_state == -1
      winner = @players[1]
    else
      return 'It was a draw!'
    end
    "Congratulations, #{winner}! You win!"
  end

  def prompt_for_move(player, player_list)
    player_name = player == 1 ? player_list[0] : player_list[1]

    "#{player_name}, please choose a column to drop a token (1 - 7):"
  end

  def prompt_for_name(player_number)
    return 'Please enter the name of player 1: ' if player_number.zero?

    'Please enter the name of player 2'
  end

  def goodbye
    'Thanks for playing!'
  end
end
