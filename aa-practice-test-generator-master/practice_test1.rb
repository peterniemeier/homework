# Write a method that returns the median of elements in an array
# If the length is even, return the average of the middle two elements
class Array
  def median
    return nil if self.length == 0
    return self[0] if self.length == 1
    sorted = self.sort
    if sorted.length % 2 == 0
      (sorted[sorted.length / 2].to_f + (sorted[(sorted.length / 2) - 1]).to_f) / 2
      else
        sorted[(sorted.length / 2).floor]
    end
  end
end

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
  little = ['a', 'and', 'of', 'over', 'the']
  result = title.split(' ').map do |word, idx|
    if little.include?(word)
      word
      else word.capitalize
    end
  end
  result[0] = result[0].capitalize
  p result.join(' ')
end

class Array

  def my_each(&prc)
    if block_given?
      self.each {|el| prc.call(el)}
    end
  end

  def my_each_with_index(&prc)
    if block_given?
      self.each_with_index {|el,idx| prc.call(el,idx)}
    end
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y }
    return self if count <= 1

    midpoint = count / 2
    left = self.take(midpoint).merge_sort(&prc)
    right = self.drop(midpoint).merge_sort(&prc)

    self.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first,right.first)
      when <= 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)

    merged
  end
end
