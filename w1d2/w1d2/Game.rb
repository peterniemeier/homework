require_relative 'Card.rb'
require_relative 'Board.rb'
require_relative 'HumanPlayer.rb'
require_relative 'AiPlayer.rb'

class Game  
  def initialize(board, player)
    @board = board
    @player = player
  end
  
  def play
    until over?
      sleep 1
      system("clear")
      @board.render
      guesses = 0
        while guesses < 2
          @player.make_guess(@board, @player.prompt(@board))
        guesses += 1
        end
    end
    puts @player.attempts == 100 ? "you lost" : "you win!"
  end
  
  
  def over?
    @board.grid.flatten.none? { |el| el.faceup == false } || @player.attempts == 100
  end
  
end

if __FILE__ == $PROGRAM_NAME
Game.new(Board.new, AiPlayer.new).play
end
