class Card
  attr_accessor :faceup, :value, :computer_seen
  
  def initialize(value)
    @value = value
    @faceup = false
    @computer_seen = false
  end
end