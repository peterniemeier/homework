class Array

  def my_rotate(num=1)
    rotations = num % self.length
    result = self.dup

    rotations.times do |num|
      result << result.shift
    end
    result
  end

end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []

    self.each_with_index do |el, i|
      next if i == self.length - 1
      self.each_with_index do |ele, j|
        next if j == 0
        result << [i,j] if el + ele == 0
      end
    end
    result
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each.none? { |i| num % i == 0}
end

def primes(num)
  return [] if num == 0
  result =  []
  i = 2
  until result.length == num
  if is_prime?(i)
    result << i
  end
  i += 1
  end
  result
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    words = []
    (0...self.length).each do |first|
        (first...self.length).each do |last|
          word = self[(first)..last]
          if dictionary.include?(word)
            words << word unless words.include?(word)
          end
        end
      end
    words.uniq
  end
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
  alphabet = ("a".."z").to_a
  result = ''

  str.each_char do |ch|
    if ch == ' '
     result << ' '
     next
    end
   oldidx = alphabet.index(ch)
   newidx = (oldidx + shift) % alphabet.length
   result << alphabet[newidx]
  end
  result
end

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
  littlewords = ['a','and','of','over','the']
  title = title.downcase

  words = title.split(' ')
  result = []
  words.each do |word|
    if littlewords.include?(word)
      result << word
    else
      result << word.capitalize
    end
  end
  result[0] = result[0].capitalize
  result.join(' ')
end
