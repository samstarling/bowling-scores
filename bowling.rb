class Game
  
  attr_accessor :frames
  
  def initialize
    @frames = Array.new
  end
  
  def add_frame frame
    @frames << frame
  end
  
  def get_score
    score = 0
    @frames.each { |frame| score += frame.get_score }
    score
  end
  
end

class Frame
  
  def initialize a, b
    @a, @b = a, b
    if get_score > 10 or get_score < 0
      raise "Invalid score"
    end
  end
  
  def get_score
    @a + @b
  end
  
  def is_strike
    @a == 10
  end
  
  def is_spare
    !is_strike and @a + @b == 10
  end
  
end