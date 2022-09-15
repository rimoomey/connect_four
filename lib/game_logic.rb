# frozen_string_literal: true

# logic which calculates the winner of a game of connect four
module GameLogic
  def winner
    winner = analyze_rows
    return winner unless winner.zero?

    winner = analyze_columns
    return winner unless winner.zero?

    winner = analyze_diagonals
    return winner unless winner.zero?

    winner
  end

  def column_full?(column_number)
    column(column_number).each do |space|
      return false if space.zero?
    end
    true
  end

  def drop_piece(player, column_number)
    return if column_full?(column_number)

    column(column_number).each_with_index do |space, i|
      if space.zero?
        @pieces[@pieces.size - (i + 1)][column_number] = player
        break
      end
    end
  end

  private

  def win_in_line?(line, count1 = 0, count2 = 0)
    line.each do |el|
      break if count1 >= 4 || count2 >= 4

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
    return 1 if count1 >= 4
    return -1 if count2 >= 4

    0
  end

  def analyze_rows
    outcome = 0
    5.times do |row|
      outcome = win_in_line?(@pieces[row])
      return outcome unless outcome.zero?
    end
    outcome
  end

  def analyze_columns
    outcome = 0
    6.times do |column_number|
      outcome = win_in_line?(column(column_number))
      return outcome unless outcome.zero?
    end
    outcome
  end

  def column(number)
    [@pieces[5][number], @pieces[4][number],
     @pieces[3][number], @pieces[2][number],
     @pieces[1][number], @pieces[0][number]]
  end

  def analyze_diagonals
    outcome = 0
    5.times do |diagonal_number|
      down_diag = downward_diagonals[diagonal_number]
      up_diag = upward_diagonals[diagonal_number]

      outcome = win_in_line?(down_diag)
      return outcome unless outcome.zero?

      outcome = win_in_line?(up_diag)
      return outcome unless outcome.zero?
    end
    outcome
  end

  def downward_diagonals
    [[@pieces[2][0], @pieces[3][1], @pieces[4][2], @pieces[5][3]],
     [@pieces[1][0], @pieces[2][1], @pieces[3][2], @pieces[4][3], @pieces[5][4]],
     [@pieces[0][0], @pieces[1][1], @pieces[2][2], @pieces[3][3], @pieces[4][4], @pieces[5][5]],
     [@pieces[0][1], @pieces[1][2], @pieces[2][3], @pieces[3][4], @pieces[4][5], @pieces[5][6]],
     [@pieces[0][2], @pieces[1][3], @pieces[2][4], @pieces[3][5], @pieces[4][6]],
     [@pieces[0][3], @pieces[1][4], @pieces[2][5], @pieces[3][6]]]
  end

  def upward_diagonals
    [[@pieces[0][3], @pieces[1][2], @pieces[2][1], @pieces[3][0]],
     [@pieces[0][4], @pieces[1][3], @pieces[2][2], @pieces[3][1], @pieces[4][0]],
     [@pieces[0][5], @pieces[1][4], @pieces[2][3], @pieces[3][2], @pieces[4][1], @pieces[5][0]],
     [@pieces[0][6], @pieces[1][5], @pieces[2][4], @pieces[3][3], @pieces[4][2], @pieces[5][1]],
     [@pieces[1][6], @pieces[2][5], @pieces[3][4], @pieces[4][3], @pieces[5][0]],
     [@pieces[2][6], @pieces[3][5], @pieces[4][4], @pieces[3][5]]]
  end
end
