class AiPlayer
  def self.setup_guesses
    hash = {}
    (1..8).each do |num|
      hash[num] = []
    end
    hash
  end
  
  attr_reader :attempts
  
  def initialize
    @attempts = 0
    @prior_guess = nil
    @guesses = AiPlayer.setup_guesses
    @matches = []
  end
  
  def prompt(board)
    
    repeats = @guesses.select { |k, v| v.length > 1 }
    repeats.select! { |k, v| v.none? { |pos| board[pos].faceup == true } }
    @matches << repeats.first[1] if !repeats.empty?
    # @matches = repeats.first[1] if !repeats.empty?
    if !@matches.empty?
      pos = @matches[0]
      @matches.pop
    else
      while true
        row = (0..3).to_a.sample
        col = (0..3).to_a.sample
        pos = [row, col]
        break pos unless board[pos].computer_seen == true
      end
    end
  end
  
  def make_guess(board, pos)
    if @prior_guess != nil && (@prior_guess.value == board.reveal(pos))
      @guesses[board[pos].value] << pos
      board[pos].computer_seen = true
      board.render
    elsif @prior_guess != nil && @prior_guess.value
      @guesses[board[pos].value] << pos
      board[pos].computer_seen = true
      @attempts += 1
      board.render
      @prior_guess.faceup = false
      board[pos].faceup = false
      @prior_guess = nil
    else
      @guesses[board[pos].value] << pos
      board[pos].computer_seen = true
      board.reveal(pos)
      @prior_guess = board[pos]
      board.render
    end
  end
end