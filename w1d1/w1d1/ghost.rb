class Game
  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @fragment = ''

    @current_player = player1
    @previous_player = player2
  end

  def get_dictionary(dictionary)
    dict_hash = {}
    # File.readlines(@dict).map do |word|
    #
    #   newword = word.chomp
    #   dict_hash[newword] = newword
    # end
    File.readlines(dictionary).each do |f|
      dict_hash[f] = f
    end

    @dict = dict_hash
  end

  if __FILE__ == $PROGRAM_NAME
    game = Game.new("a", "b")
    game.get_dictionary("dictionary.txt")
    p @dict
  end

  def play_round

  end

  def current_player

  end

  def previous_player

  end

  def next_player!
    @current_player,@previous_player = @previous_player,@current_player
  end

  def take_turn(player)
    @current_player.guess

    if valid_play?(char)
      @fragment += char
      puts "Game continues!"
      puts "#{fragment}"
      next_player!
      take_turn(@current_player)
    else
      alert_invalid_guess
      take_turn(@current_player)
    end



  end

  def valid_play?(char)
    @fragment += char

  end

end


class Player

  def initialize(name)
    @name = name
  end

  def guess
    puts "Please enter a character."
    char = gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid play! Try again!"
  end

end
