# frozen_string_literal: true

module GameLogic
  def winner
    winner = 0

    (0..5).each do |row|
      winner = win?(@pieces[row])
      return winner unless winner.zero?
    end

    (0..6).each do |column_number|
      column = [@pieces[0][column_number], @pieces[1][column_number],
                @pieces[2][column_number], @pieces[3][column_number],
                @pieces[4][column_number], @pieces[5][column_number]]
      winner = win?(column)
      return winner unless winner.zero?
    end
    0
  end

  def win?(line, count1 = 0, count2 = 0)
    line.each do |el|
      return 1 if count1 >= 4
      return -1 if count2 >= 4

      case el
      when 1
        count1 += 1
      when -1
        count2 += 1
      else
        count1 = 0
        count2 = 0
      end
    end
    0
  end
end
