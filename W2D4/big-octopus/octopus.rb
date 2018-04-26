class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) < 0
        merged << left.shift
      else
       merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end


def sluggish_octopus(array)
  len = array.length - 1
  longest1 = array[0]
  longest2 = array[0]
  (0...len).each do |idx1|
    longest1 = array[idx1]
    (0..len).each do |idx2|
      longest2 = array[idx2]
      if longest2.length <= array[idx2].length
        longest2 = array[idx2]
      end
    end
    if longest2.length > longest1.length
      longest1 = longest2
    end

  end
  longest1
end

def dominant_octopus(array)
  prc = Proc.new { |x, y| x.length <=> y.length }
  array.merge_sort(&prc)[-1]
end

def clever_octopus(array)
  longest = array[0]
  array.each do |octop|
    if octop.length > longest.length
      longest = octop
    end
  end

  longest

end

FISH = ['fish', 'fiiish', 'fiiiiish',
        'fiiiish', 'fffish', 'ffiiiiisshh',
        'fsh', 'fiiiissshhhhhh']

puts sluggish_octopus(FISH)
puts dominant_octopus(FISH)
puts clever_octopus(FISH)


def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end


tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
puts slow_dance("up", tiles_array)
puts slow_dance("right-down", tiles_array)

puts fast_dance("up", tiles_hash)
puts fast_dance("right-down", tiles_hash)
