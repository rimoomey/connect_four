# frozen_string_literal: true

# Display class for program output
class PlayerIO
  def show(output)
    puts output
  end

  def collect
    gets.chomp
  end
end
