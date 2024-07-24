# frozen_string_literal: true

require 'colorize'

# Contains mensages to show on terminal: error msgs, greatings mgs & instructions
module Displayable
  def guess_error
    'The input only handle letters and ONE char long'.colorize :red
  end

  def name_error
    'The name must have 3 to 15 letters'.colorize :red
  end

  def guess_txt
    'Insert one letter that you think is correct: '.colorize :blue
  end

  def name_txt
    'Insert a name here: '.colorize :yellow
  end
end
