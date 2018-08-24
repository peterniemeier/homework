class Array

  def my_reverse
    result = []
      self.each {|el| result.unshift(el)}
    result
  end

end

class Array

  def my_rotate(num=1)
    rotations = num % self.length
    result = self.dup

    rotations.times { |el| result << result.shift }
    result
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each.none? {|i| num % i == 0 }
end

def primes(num)
  result = []
  if num == 0
    return result
  end
  i = 2
  until result.length == num
    if is_prime?(i)
      result << i
    end
    i += 1
  end
  result
end

# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def pig_latinify(sentence)
  words = sentence.split(' ').map do |word|
    translate(word)
  end
  words.join(' ')
end

def translate(word)
  vowels = %w(a e i o u)
  if vowels.include?(word[0])
    "#{word}ay"
    else
      check = 0
      until vowels.include?(word[check])
      check += 1
      end
    check += 1 if word[check - 1] == 'q'
    "#{word[check..-1]}#{word[0...check]}ay"
  end
end

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
end

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alphabet = ('a'..'z').to_a

  result = ''

  str.each_char do |char|
    if char == ' '
    result << char
    next
    end
    old_idx = letters.index(char)
    new_idx = (old_idx + shift) % letters.count
    result << letters[new_idx]
  end
  result
end

class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)

  end

end

class Array

  def my_select(&prc)

  end

end

class Array

  def my_each(&prc)

  end

  def my_each_with_index(&prc)

  end

end

class Array

  def my_all?(&prc)

  end

end
