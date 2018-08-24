
class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    @stack << el
  end

  def pop
    # removes one element from the stack
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @stack.first
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue.last
  end
end

class Map < Array

  def initialize
    @result = []
  end

  def set(key, value)

    pair = @result.index { |k| k[0] == key }
    if pair
      @result[pair][1] = value
    else
      @result.push([key, value])
    end
  end

  def get(key)
    @result.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    val = get(k)
    @result.reject! { |pair| pair[0] == key }
    val
  end

  def show
    deep_dup(@result)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
