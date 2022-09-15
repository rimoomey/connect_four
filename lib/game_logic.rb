# frozen_string_literal: true

module GameLogic
  def winner
    winner = 0

    winner = analyze_rows
    return winner unless winner.zero?

    (0..6).each do |column_number|
      column = [@pieces[0][column_number], @pieces[1][column_number],
                @pieces[2][column_number], @pieces[3][column_number],
                @pieces[4][column_number], @pieces[5][column_number]]
      winner = win_in_line?(column)
      return winner unless winner.zero?
    end

    (0..5).each do |diagonal_number|
      left_diagonal = []
      right_diagonal = []
      case diagonal_number
      when 0
        left_diagonal = [@pieces[2][0], @pieces[3][1],
                         @pieces[4][2], @pieces[5][3]]
        right_diagonal = [@pieces[0][3], @pieces[1][2],
                          @pieces[2][1], @pieces[3][0]]
      when 1
        left_diagonal = [@pieces[1][0], @pieces[2][1],
                         @pieces[3][2], @pieces[4][3],
                         @pieces[5][4]]
        right_diagonal = [@pieces[0][4], @pieces[1][3],
                          @pieces[2][2], @pieces[3][1],
                          @pieces[4][0]]
      when 2
        left_diagonal = [@pieces[0][0], @pieces[1][1],
                         @pieces[2][2], @pieces[3][3],
                         @pieces[4][4], @pieces[5][5]]
        right_diagonal = [@pieces[0][5], @pieces[1][4],
                          @pieces[2][3], @pieces[3][2],
                          @pieces[4][1], @pieces[5][0]]
      when 3
        left_diagonal = [@pieces[0][1], @pieces[1][2],
                         @pieces[2][3], @pieces[3][4],
                         @pieces[4][5], @pieces[5][6]]
        right_diagonal = [@pieces[0][6], @pieces[1][5],
                          @pieces[2][4], @pieces[3][3],
                          @pieces[4][2], @pieces[5][1]]
      when 4
        left_diagonal = [@pieces[0][2], @pieces[1][3],
                         @pieces[2][4], @pieces[3][5],
                         @pieces[4][6]]
        right_diagonal = [@pieces[1][6], @pieces[2][5],
                          @pieces[3][4], @pieces[4][3],
                          @pieces[5][0]]
      when 5
        left_diagonal = [@pieces[0][3], @pieces[1][4],
                         @pieces[2][5], @pieces[3][6]]
        right_diagonal = [@pieces[2][6], @pieces[3][5],
                          @pieces[4][4], @pieces[3][5]]
      end

      winner = win_in_line?(left_diagonal)
      return winner unless winner.zero?

      winner = win_in_line?(right_diagonal)
      return winner unless winner.zero?
    end
    0
  end

  private

  def win_in_line?(line, count1 = 0, count2 = 0)
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
end
