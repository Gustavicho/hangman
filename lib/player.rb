# frozen_string_literal: true

require_relative 'displayable'

# Contains all methods to get the input from the user
class Player
  attr_reader :hist, :name

  def initialize
    @name = nil
    @hist = []
  end

  def chose_name
    loop do
      print insert_name
      name = gets.chomp
      break if name.between? 3, 15

      puts name_size_error
    end
    @name = name
  end

  def guess
    loop do
      print insert_here
      play = gets.chomp.downcase

      return play if valid?(play)

      puts inpt_size_error if play.size != 1
      puts inpt_type_error unless play.between?('a', 'z')
    end
  end

  def save_in_hist(letter)
    @hist << letter
  end

  private

  include Displayable

  def valid?(input)
    input.size == 1 && input.between?('a', 'z')
  end
end
