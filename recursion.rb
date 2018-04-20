
def sum_to(num)
  return nil if num<0
  return 1 if num == 1
  num + sum_to(num-1) if num > 1
end

def add_numbers(nums_array)
  return nil if nums_array.length == 0
  return nums_array.pop if nums_array.length == 1
  nums_array.pop + add_numbers(nums_array)
end

def gamma_fn(num)
  return nil if num == 0
  return 1 if num == 1
  (num - 1) * gamma_fn(n-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.length==0
  return true if flavors.pop == favorite
  ice_cream_shop(flavors, favorite)
end

def reverse(string)
  return "" if string == ""
  string[string.length-1] + reverse(string[0...string.length-1])
end

p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false

p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil

p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""
