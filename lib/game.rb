# frozen_string_literal: true

require_relative 'player'
# Contains all the game logic including: sequence, verification and result display
class Game
  attr_reader :secret_word, :player

  def initialize(player_name)
    @secret_word = SecretWord.new
    @player = Player.new(player_name)
  end

  def play
    until game_end?
      # show info
      letter = player.guess
      case secret_word.contains? letter
      when true
        save_guess letter
      else # when false
        player.tries_left = -1
      end
    end
  end

  private

  def save_guess(letter)
    player.add_at_guesses letter
  rescue ArgumentError => e
    puts "#{e}\nTry Again!".colorize :red
  end

  def game_end?
    player.tries_left.zero? || won?
  end

  def won?
    player.guessed_letters.all? { |char| secret_word.contains? char }
  end
end
