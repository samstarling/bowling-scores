class Game
  
  attr_accessor :frames
  
  def initialize
    @frames = Array.new
  end
  
  def add_frame frame
    @frames.unshift frame
  end  
  
  def get_score
    score = 0
    @frames.each_with_index do |frame, index|
      score += frame.get_score
      if index + 1 < @frames.size
        if @frames[index + 1].is_strike
          score += frame.get_score
        elsif @frames[index + 1].is_spare
          score += frame.a
        end
      end
    end
    score
  end
  
end

class Frame
  
  attr_accessor :a, :b
  
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
  
  def to_s
    "[#{@a}, #{@b}]"
  end
  
end