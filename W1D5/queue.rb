
class Queue
  def initialize(len = 0)
    @que = Array.new(len)
  end

  def enqueue(el)
    que.unshift(el)
  end

  def dequeue
    que.pop
  end

  def show
    p que
  end

  def inspect
    que
  end

  private
  attr_reader :que
end
