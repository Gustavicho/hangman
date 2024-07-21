# frozen_string_literal: true

# Contains the methods to return a valid word
module DictWords
  @@Words = File.readlines 'dictionary.txt'

  def select_word
    loop do
      word = @@Words.sample.chomp
      return word if valid? word
    end
  end

  private

  def valid?(word)
    word.size.between? 5, 12
  end
end
