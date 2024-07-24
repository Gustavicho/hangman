# frozen_string_literal: true

require_relative 'displayable'

# Contains all methods to get the input from the user adn contains all that needs to play: secret_word, hist
class Player
  attr_reader :name, :guessed_letters, :tries_left

  include Displayable

  def initialize(name)
    @name = name
    @tries_left = 8
    @guessed_letters = []
  end

  # get a input from the player
  # only letter & ONE char long
  # or the player will be in a infinite loop
  def guess
    loop do
      print guess_txt
      letter = $stdin.gets.chomp
      return letter if valid? letter

      puts guess_error
    end
  end

  # remove one from tries
  # use when the player gets the letter wrong
  def minus_one
    @tries_left -= 1
  end

  # add a letter in the gue'ssed_letters
  # BUT, raise a ArgumentError if the current letter has already been added
  def add_at_guesses(letter)
    raise ArgumentError, 'ERROR: This letter has already been used' if letter_used? letter

    @guessed_letters << letter
  end

  private

  # check if the input is a char and a letter
  # to only get CHAR's
  def valid?(input)
    input.size == 1 && input.between?('a', 'z')
  end

  # check if the letter already exist
  # to avoid repeat letter
  def letter_used?(letter)
    @guessed_letters.include? letter
  end
end
