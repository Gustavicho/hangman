# frozen_string_literal: true

# Contains the methods to return a valid word
module DictWords
  def initialize
    # arr with all words
    @words = File.read 'dictionary.txt'
  end

  def select_word
    word = @words.sample
    select_word unless valid? word

    word
  end

  private

  def valid?(word)
    word.size.between? 5, 12
  end
end
