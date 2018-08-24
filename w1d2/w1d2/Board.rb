
require_relative 'Card.rb'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(4) {Array.new(4)}
    populate
  end
  
  def [](pos)
    x,y = pos
    @grid[x][y]
  end
  
  def []=(pos, value)
    x,y = pos
    @grid[x][y] = value
  end  
  
  def populate
    temp = (1..8).to_a
    temp2 = (temp + temp).shuffle
    @grid.each do |row|
      row.map! do |el|
      el = Card.new(temp2.pop)
      end
    end
  end
  
  def render
    @grid.each do |row|
      row.each do |el|
        if el.faceup == true
          print " #{el.value} "
        else
          print " X "
        end
      end
      print "\n"
    end
  end
  
  def won?
    
  end
  
  def reveal(pos)
    # debugger
    self[pos].faceup = true
    self[pos].value
  end
  
end