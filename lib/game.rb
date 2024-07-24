# frozen_string_literal: true

require_relative 'player'
require_relative 'secret_word'
# Contains all the game logic including: sequence, verification and result display
class Game
  attr_reader :secret_word, :player

  def initialize(player_name)
    @secret_word = SecretWord.new
    @player = Player.new(player_name)
    @secret_word.random_word
  end

  def play
    until game_end?
      show_info
      letter = player.guess
      begin
        player.add_at_guesses letter
        player.minus_one unless secret_word.contains? letter
      rescue ArgumentError => e
        puts "#{e}\nTry Again!".colorize :red
      end
    end

    show_result
  end

  private

  def show_info
    puts "\nword: #{secret_word.display(player.guessed_letters)}"
    puts "Tries left: #{player.tries_left}"
    puts "Guessed letters: #{player.guessed_letters.join(', ')}"
  end

  def show_result
    if won?
      puts "Congratulation!! You guessed the secret word!\n The word was: #{secret_word.word}".colorize :green
    else
      puts "Sorry... more lucky next time! The word was: #{secret_word.word}"
    end
  end

  def game_end?
    player.tries_left.zero? || won?
  end

  def won?
    secret_word.word.split('').all? { |c| player.guessed_letters.include? c }
  end
end
