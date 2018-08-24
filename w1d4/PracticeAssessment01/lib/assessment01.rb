require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    i = 0
    if accumulator == nil
      accumulator = self.first
    i += 1
    end

    while i < length
      accumulator = yield(accumulator, self[i])
      i += 1
    end

    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).none? {|i| num % i == 0}
end

def primes(num)
  result = []

  i = 2
  while result.length < num
    result << i if is_prime?(i)
  i += 1
  end

  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  facs = factorials_rec(num - 1)
  facs << facs.last * (num - 1)

  facs
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    result = Hash.new { |hash, key| hash[key] = []}

    self.each_with_index do |el, i|
      result[el] << i
    end

    result.select {|key,value| value.count > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []

      self.length.times do |startp|
        (2..(length - startp)).each do |endp|
          substr = self[startp...(endp + startp)]
          result << substr if substr == substr.reverse
        end
      end

    result
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y}
    return [] if self.empty?
    return self if self.length == 1
    half = self.length / 2

    left = self.take(half).merge_sort(&prc)
    right = self.drop(half).merge_sort(&prc)

    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first,right.first)
        when -1
          result << left.shift
        when 0
          result << left.shift
        when 1
          result << right.shift
      end
    end

    result.concat(left)
    result.concat(right)
    result
  end
end
