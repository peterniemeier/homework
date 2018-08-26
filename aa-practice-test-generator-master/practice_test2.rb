# Write a method that returns the factors of a number in ascending order.

def factors(num)
  if prime?(num)
    return [1,num]
  end
  result = []

  i = 1

  while i <= num
    if num % i == 0
      result << i
    end
  i += 1
  end
  result
end

class Array

  def my_reverse
    result = []
    self.each { |el| result.unshift(el)}
    result
  end

end

def prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
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
  little = ['a','and','of','over','the']
  words = title.split(' ')
  words = words.map do |word|
    if little.include?(word)
      word.downcase
      else
      word.capitalize

    end
  end

  words[0] = words[0].capitalize
  words.join(' ')
end
