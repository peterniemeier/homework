class HumanPlayer
  attr_reader :attempts
  
  def initialize
    @prior_guess = nil
    @attempts = 0
  end
  
  def make_guess(board, pos)
    if @prior_guess != nil && (@prior_guess.value == board.reveal(pos))
      board.render
    elsif @prior_guess != nil && @prior_guess.value
      @attempts += 1
      board.render
      @prior_guess.faceup = false
      board[pos].faceup = false
      @prior_guess = nil
    else 
      board.reveal(pos)
      @prior_guess = board[pos]
      board.render
    end
  end

  def prompt(board)
    while true
      print "Please enter coordinate: "
      pos = gets.chomp
      pos_toi = pos.split(",")
      pos_toi.map!(&:to_i)
      if valid_pos?(pos_toi, board)
        return pos_toi
      end
    end
  end
  
  def valid_pos?(pos, board)
    return false if board[pos].nil?
    board[pos].faceup == false
  end
end