require 'byebug'

def factors(num)
  (1..num).select { |i| num % i == 0}
end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new {|x, y| x <=> y}
    sorted = false

    until sorted
      sorted = true

      i = 0
      while i < self.length
        if self[i+1] == nil
          break
        end

        if prc.call(self[i], self[i+1]) > 0
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        # else
        #   sorted = true
        end

        i += 1
      end
    end

    self
    end

  #   state = true
  #
  #   while state
  #     state = false
  #     i = 0
  #     while i < self.length
  #       if i == self.length - 1
  #         state = true
  #
  #         next
  #       end
  #
  #
  #       j = i + 1
  #       if self[i] > self[j]
  #         self[i],self[j] = self[j],self[i]
  #         state = true
  #       end
  #
  #     i += 1
  #     end
  #
  #   end
  #   self
  # end
end
