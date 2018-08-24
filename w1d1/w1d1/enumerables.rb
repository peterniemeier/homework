
require 'byebug'

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i +=1
    end
    self
  end

  def my_select(&prc)
    array = []
    self.my_each { |el| array << prc.call(el) }
    return array
  end

  def my_reject(&prc)
    array = []
    self.my_each { |el| array << el if prc.call(el) == false }
    array
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
      false
  end

  def my_all?(&prc)
    self.my_each { |el| return false if prc.call(el) == false}
      true
  end

  def my_flatten
    result = []

    i = 0
    until self[i] == nil
      debugger
      if self[i].is_a?(Array)
        num = self[i].my_flatten
        result.concat(num)
      else
        result << self[i]
      end
      i +=1
    end

    result
    # result = []
    # i = 0
    # while i < self.length
    #   debugger
    #   j = 0
    #   if self[i].is_a?(Array)
    #   while j < self[i].length
    #     result << self[i][j]
    #   j += 1
    #   end
    #   else
    #   result << self[i]
    #   end
    # i += 1
    # end
    # result
  end

  def my_zip(*args)
    result = Array.new (self.length) {Array.new}

    [self,*args].each do |el|
      el.each_index do |idx|
          result[idx] << el[idx]
      end
    end
    result
  end

  def my_rotate(n=1)
    rotations = n % self.length
    p rotations
    rotations.times do
      self << self.shift
    end

      return self
  end

  def my_join(n='')
    space = ''
    self.each_with_index do |el,i|
      if i == self.length - 1
        space += el
      else
        space += el + n
      end
    end
    space
  end

  def my_reverse
    empty_arr = []
    (0...self.length).each do |i|
      empty_arr.unshift(self[i])
    end

  empty_arr
  end

  def factors(num)
    (1..num).select { |i| num % i == 0}
  end
end
