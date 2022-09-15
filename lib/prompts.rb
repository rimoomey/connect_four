# frozen_string_literal: true

# module for text prompt content
module Text
  def introduction
    "Welcome to Connect Four! This is a competitive game for two players.\n" \
    "To play, the players will take turns drop black and white tokens into\n" \
    "The columns of the game board, pictured below: \n \n" \
    "| | | | | | | |\n"\
    "| | | | | | | |\n"\
    "| | | | | | | |\n"\
    "| | | | | | | |\n"\
    "| | | | | | | |\n"\
    "| | | | | | | |\n"\
    "To win, you must place four of your tokens in a row in any direction: up and down, \n" \
    "side-to-side, or diagonally. Would you like to play? \n"
    "Y/N: "
  end
end