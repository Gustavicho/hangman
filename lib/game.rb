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
      puts letter     # -- remove --
      case secret_word.contains? letter
      when true
        save_guess letter
      else # when false
        player.minus_one
      end
    end
  end

  private

  def show_info
    puts "\nword: #{secret_word.display(player.guessed_letters)}"
    puts "Tries left: #{player.tries_left}"
    puts "Guessed letters: #{player.guessed_letters.join(', ')}"
  end

  def save_guess(letter)
    player.add_at_guesses letter
  rescue ArgumentError => e
    puts "#{e}\nTry Again!".colorize :red
  end

  def game_end?
    player.tries_left.zero? || won?
  end

  def won?
    secret_word.word.split('').all? { |c| player.guessed_letters.include? c }
  end
end
