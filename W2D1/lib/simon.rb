class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(length = 1)
    @sequence_length = length
    @game_over = false
    @seq = []
  end

  def play

  end

  def take_turn
    until game_over
      show_sequence
      input = require_sequence
      round_success_message if input == seq
  end

  def show_sequence

  end

  def require_sequence

  end

  def add_random_color
    seq.push(COLORS.sample)
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game

  end
end
