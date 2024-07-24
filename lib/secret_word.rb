# frozen_string_literal: true

# The secret word of the game
class SecretWord
  attr_reader :word

  def initialize
    @words = File.readlines 'dictionary.txt'
  end

  # get a random word from the massive list of words
  def random_word
    loop do
      word = @words.sample.chomp
      if valid? word
        @word = word
        break
      end
    end
  end

  # check if the letter have the current letter
  def contains?(letter)
    @word.include? letter
  end

  # check which letters match & return a string where is correct and where not
  # need to pass which letters were guessed
  def display(guessed_letters)
    @word.split('').map { |char| guessed_letters.include?(char) ? char : '_' }.join(' ')
  end

  private

  # check if the word is not too long neither too short
  def valid?(word)
    word.size.between? 5, 12
  end
end
