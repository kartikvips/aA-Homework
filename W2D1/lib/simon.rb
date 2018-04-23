class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(length = 1)
    @sequence_length = length
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn

    end
    game_over_message
    reset_game
  end

  def take_turn
      show_sequence
      @input = require_sequence
      round_success_message

      add_random_color unless game_over
      @sequence_length += 1 unless game_over
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    puts "Enter sequence in lower case with commas!"
    input_arr = []
    begin
      input = gets.strip
      input_arr = input.split(",").map(&:strip)
      raise "Error" unless input_arr.all? {|word| COLORS.include?(word)}
    rescue
      puts "Re-enter sequence. Forget commas?"
      retry
    end
    input_arr
  end

  def add_random_color
    @seq.push(COLORS.sample)
  end

  def round_success_message
    if @input == seq
      puts "Congrats! Lets make it harder!"
    end
  end

  def game_over_message
    if @input != seq
      puts "You guessed WRONG! GG!"
      @game_over = true
      reset_game
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
