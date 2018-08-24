require 'byebug'
def range(start, last)
  return [] if last < start
  [start] + range(start + 1, last)
end

def recursion_sum(array)
  return nil if array.empty?
  return array[0] if array.length == 1

  array[0] + recursion_sum(array[1..-1])
end

def itteration_sum(array)
  array.inject(:+)
end

def exponent_one(b,n)
  #return b if n == 1
  return 1 if n == 0

  b * exponent_one(b, n - 1)
end

def exponent_two(b, n)
  return b if n == 1
  return 1 if n == 0

  if n.even?
    p n
    exponent_two(b, n / 2) * exponent_two(b, n / 2)
  else
    p n
    b * exponent_two(b, (n - 1) / 2) * exponent_two(b, (n - 1) / 2)
  end
end
#
# def divisors(n)
#   small_div = []
#   big_div = []
#   for i in (1..Math.sqrt(n))
#     if n % i == 0
#       small_div << i
#       big_div.unshift(n/i)
#     end
#   end
#   small_div + big_div
# end

class Array

  def deep_dup
    return self if self.none? {|el| el.is_a?(Array)}
    ret = []
    self.each do |el|
      if el.is_a?(Array)
        ret << el.deep_dup
      else
        ret << el.dup
      end
    end
    ret
  end

  # def deep_dup_checker(duped_array)
  #   i = 0
  #   self.none? do |el|
  #     p el.object_id == duped_array[i].object_id
  #     i += 1
  #   end
  # end

end


def fib(n)
  return [0] if n == 0
  return [1] if n == 1
  fib(n - 1) + [fib(n - 1).last + fib(n - 2).last]
end

def iterative_fib(n)
  return [1] if n == 1
  ret = [1,1]

  until ret.length >= n
    ret << ret[-1] + ret[-2]
  end
  ret
end

def bsearch(arr, target)
    half = arr.length / 2
    return half if arr[half] == target
    return nil if arr.length == 1
    half
    if arr[half] < target
      is_nil = bsearch(arr[half..-1], target)
      return is_nil if is_nil.nil?
      half + is_nil
    else
      bsearch(arr[0...half], target)
    end
end

class Array

  def merge_helper!(other_half)
    ret = []
    until self.empty? || other_half.empty?
      if self.first < other_half.first
        ret << self.shift
      else
        ret << other_half.shift
      end
    end
    ret + self + other_half
  end

  def merge_sort
    return self if self.length <= 1
    left = self[0...(self.length/2)]
    right = self[(self.length/2..-1)]
    puts "Left = #{left} Right = #{right}"
    left.merge_sort.merge_helper!(right.merge_sort)
  end

  def subsets
    return [[]] if self.empty?
    subs = self[0...(-1)].subsets
    # p "subs is #{subs}"
    subs_with_other = subs.dup
    subs_with_other.map! do |el|
      # p el
      thing = el.dup #this works but thing = el.deep_dup doesn't
      thing << self[-1]
    end
    # p "subs_with_other is #{subs_with_other}"
    # p "subs is #{subs}"
    subs + subs_with_other
  end

end
