# frozen_string_literal: true

module GameLogic
  def winner
    winner = 0

    (0..5).each do |row|
      winner = win?(@pieces[row])
      return winner unless winner.zero?
    end
    0
  end

  def win?(row, count1 = 0, count2 = 0)
    row.each do |el|
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
