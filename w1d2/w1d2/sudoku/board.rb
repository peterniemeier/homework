
require_relative 'tile.rb'
require 'colorized_string'
require 'colorize'

class Board
  def initialize
    
    @grid = Array.new(9) {Array.new(9)}
  end
  def from_file(file)
    numbers = File.readlines(file).map(&:chomp)
    numbers.each_with_index do |row, idx|
      row.split('').each_with_index do |el, i|
        @grid[idx][i] = Tile.new(el)
        @grid[idx][i].color = :red unless @grid[idx][i].value == "0"
      end
    end
  end
  
  def [](pos)
    x,y = pos
    @grid[x][y]
  end
  
  def []=(pos, num)
    x,y = pos
    @grid[x][y] = num
  end
  
  def render
    @grid.each do |row|
      row.each do |num|
      print "#{num.value.colorize(num.color)}"
      end
      print "\n"
    end
  end
  
  def play
    if move_valid?(get_move)
      
    end
  end
  
  def get_move
    print "Please provide a coordinate"
    coords = gets.chomp.split(",")
    coords.map!(&:to_i)
    
    print "Please provide a number"
    number = gets.chomp.to_i
    [coords,number]
  end
  
  def move_valid?(move)
    position = move[0]
    if self[position].color == :red
      return "Number already provided"
    else
      self[position] = move[1]
    end
end

if __FILE__ == $PROGRAM_NAME
Board.new
Board.play
end