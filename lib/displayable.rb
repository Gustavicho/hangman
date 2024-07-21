# frozen_string_literal: true

require 'colorize'

# Contains mensages to show on terminal: error msgs, greatings mgs & instructions
module Displayable
  def inpt_type_error
    'The input only handle letters'.colorize :red
  end

  def inpt_size_error
    'The input must contains ONE char length'.colorize :red
  end

  def insert_here
    'Insert one letter that you think is correct: '.colorize :blue
  end
end
