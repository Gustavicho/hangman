# frozen_string_literal: true

require_relative 'displayable'

# Contains all methods to get the input from the user
class Player
  def guess
    loop do
      print insert_here
      play = gets.chomp.downcase

      return play if valid?(play)

      puts inpt_size_error if play.size != 1
      puts inpt_type_error unless play.between?('a', 'z')
    end
  end

  private

  include Displayable

  def valid?(input)
    input.size == 1 && input.between?('a', 'z')
  end
end
