require_relative 'player'


class Ghost
  attr_reader :record, :losses, :alphabet, :fragment, :player1, :player2, :current_player, :previous_player
  def initialize(player1,player2)
    @losses = {player1 => nil, player2 => nil}
    @alphabet = ('a'..'z').to_a
    @fragment = ''
    @dictionary = {}
    File.foreach('dictionary.txt') do |line|
      word = line.chomp
      @dictionary[word] = word
    end
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @current_player = player1
    @previous_player = player2
  end

  def check_fragment(fragment)

    if @dictionary.key?(@fragment)
      game_over(@current_player)
    end
    next_player!
  end

  def play_round
    take_turn(@current_player)
  end

  def take_turn(player)

    valid = false
    until valid == true
      valid = true
      puts "#{current_player} :"
      puts "Choose a letter to add to fragment: "
      letter = gets.chomp
      if valid_play?(letter)
        update_fragment(letter)
        check_fragment(@fragment)
        puts "Game continues!"
        valid = false
      else
        puts "Invalid play! Try again!"
        puts "Game continues!"
        valid = false
      end
    end
  end

  def next_player!
    @current_player,@previous_player = @previous_player,@current_player
  end

  def update_fragment(letter)
    @fragment += letter
  end

  def valid_play?(letter) #in alphabet and a word could start with fragment
    p part = @fragment + letter
    @alphabet.include?(letter) && word_part?(part)
  end

  def word_part?(part)
    @dictionary.keys.any? {|k| k.start_with?(part)}
  end

  def game_over(player)
    @fragment = ''
    puts "That was a word! #{player} becomes a Ghost!"
    record(player)
    next_player!
  end

  def record(player)
    if losses[player].nil?
      losses[player] = 1
    else
      losses[player] += 1
    end
    display_standings
  end

  def display_standings
    g = "GHOST"
    if @losses[@player1.name]
      p1_word = g.slice(0..@losses[@player1.name] - 1)
      if p1_word == "GHOST"
        puts "#{@player1.name} totally lost!"
        puts "NEW GAME!"
        Ghost.new("Jimmy","Bimmy").play_round
      end
    else
      p1_word = "healthy"
    end
    if @losses[@player2.name]
     p2_word = g.slice(0..@losses[@player2.name] - 1)
     if p2_word == "GHOST"
       puts "#{@player2.name} totally lost!"
       puts "NEW GAME!"
       Ghost.new("Jimmy","Bimmy").play_round
     end
    else
      p2_word = "healthy"
    end

    puts "#{@player1.name} : #{p1_word}, #{@player2.name} : #{p2_word}"
  end

end

if $PROGRAM_NAME == __FILE__
  Ghost.new("Jimmy","Bimmy").play_round
end
