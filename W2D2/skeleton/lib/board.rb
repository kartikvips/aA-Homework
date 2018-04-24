class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    @name_hash = {name1 => 6, name2 => 13}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |idx|
      @cups[idx] = [:stone, :stone, :stone, :stone]
    end
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos < 15 && start_pos > 0
  end

  def make_move(start_pos, current_player_name)
    return nil if cups[start_pos] == []
    skip = @name_hash[current_player_name] == 6 ? 13 : 6
    start = start_pos
    num = cups[start]
    until cups[start_pos].size == 0
      start = (start + 1) % 14
      @cups[start] << @cups[start_pos].pop unless start == skip
    end
    render
    next_turn(start)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].size == 1
      :switch
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = (0..5).all? { |idx| cups[idx].empty? }
    side2 = (7..12).all? { |idx| cups[idx].empty? }
    side1 || side2
  end

  def winner
    six = [:stone, :stone, :stone, :stone, :stone, :stone]
    return :draw if cups[6] == six && cups[13] == six
    if cups[6] == six
      return @name_hash.keys[0]
    elsif cups[13] == six
      return @name_hash.keys[1]
    end

  end
end
