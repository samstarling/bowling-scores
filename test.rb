require 'test/unit'
require './bowling'

class FrameTest < Test::Unit::TestCase

  def test_a_single_gutter_ball
    frame = Frame.new 0, 0
    assert_equal 0, frame.get_score 
  end
  
  def test_a_first_half_score_is_counted
    frame = Frame.new 3, 0
    assert_equal 3, frame.get_score 
  end
  
  def test_a_second_half_score_is_counted
    frame = Frame.new 0, 5
    assert_equal 5, frame.get_score 
  end
  
  def test_both_halves_of_frame_are_added
    frame = Frame.new 2, 1
    assert_equal 3, frame.get_score
  end
  
  def test_a_score_above_max_is_rejected
    assert_raise RuntimeError do
      Frame.new 10, 1
    end
  end
  
  def test_a_score_below_min_is_rejected
    assert_raise RuntimeError do
      Frame.new -1, 0
    end
  end

end

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_a_single_gutter_ball
    frame = Frame.new 0, 0
    @game.add_frame frame
    assert_equal 0, @game.get_score
  end
  
  def test_a_single_point
    
  end

end