class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn  #this method is calling on the show_sequence name
    show_sequence
    require_sequence
    unless @game_over 
      round_success_message #until game is over, it is not over so it will increment by one everytime
      self.sequence_length += 1
    end
    
  end

  def show_sequence #method name
    self.add_random_color
  end

  def require_sequence

  end

  def add_random_color
    @seq << COLORS.sample #takes a random color and shovels it in to sequence
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
