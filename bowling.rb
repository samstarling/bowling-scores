class Game
  
  def add_frame frame
    #
  end
  
  def get_score
    0
  end
  
end

class Frame
  
  def initialize a, b
    @a = a
    @b = b
    if get_score > 10 or get_score < 0
      raise "Invalid score"
    end
  end
  
  def get_score
    @a + @b
  end
  
end