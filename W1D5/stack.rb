
class Stack

  def initialize
    @the_stack = []
  end

  def add(el)
    the_stack.push(el)
  end

  def remove
    the_stack.pop 
  end

  def show
    p the_stack
  end

  def inspect
    the_stack.to_s
  end

  private
  attr_reader :the_stack

end
