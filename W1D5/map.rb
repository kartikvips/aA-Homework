class Map

  def initialize(len = 0)
    @maps = Array.new(len) {Array.new(2)}
  end

  def assign(key,value)
    look = lookup(key)
    if look
      maps[look][1] = value
    else
      maps << [key, value]
    end
    maps
  end

  def lookup(key)
    maps.each_with_index {|val, idx| return idx if val[0]==key}
    nil
  end

  def remove(key)
    look = lookup(key)
    maps.delete_at(look) if look
    maps
  end

  def show
    p maps
  end

  def inspect
    maps
  end

  private
  attr_reader :maps

end
