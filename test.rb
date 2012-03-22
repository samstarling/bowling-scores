require 'test/unit'
require './bowling'

class FrameTest < Test::Unit::TestCase

  def test_single_gutter_ball
    frame = Frame.new 0, 0
    assert_equal 0, frame.get_score 
  end
  
  def test_first_half_score_is_counted
    frame = Frame.new 3, 0
    assert_equal 3, frame.get_score 
  end
  
  def test_second_half_score_is_counted
    frame = Frame.new 0, 5
    assert_equal 5, frame.get_score 
  end
  
  def test_both_halves_are_added
    frame = Frame.new 2, 1
    assert_equal 3, frame.get_score
  end
  
  def test_score_above_max_is_rejected
    assert_raise RuntimeError do
      Frame.new 10, 1
    end
  end
  
  def test_score_below_min_is_rejected
    assert_raise RuntimeError do
      Frame.new -1, 0
    end
  end
  
  def test_strike_is_recognised
    frame = Frame.new 10, 0
    assert frame.is_strike
    assert_equal false, frame.is_spare
  end

end

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end
  
  def test_frames_are_stored
    @game.add_frame Frame.new 0, 0
    assert_equal 1, @game.frames.size
  end

  def test_single_frame_gutter
    @game.add_frame Frame.new 0, 0
    assert_equal 0, @game.get_score
  end
  
  def test_single_frame
    @game.add_frame Frame.new 3, 0
    assert_equal 3, @game.get_score
  end
  
  def test_two_frames
    @game.add_frame Frame.new 1, 2
    @game.add_frame Frame.new 3, 4
    assert_equal 2, @game.frames.size
    assert_equal 10, @game.get_score
  end

  def test_strike_affects_next_frame
    @game.add_frame Frame.new 10, 0
    @game.add_frame Frame.new 3, 6
    assert_equal 28, @game.get_score
  end
  
  def test_spare_affects_next_frame
    @game.add_frame Frame.new 7, 3
    @game.add_frame Frame.new 4, 2
    assert_equal 20, @game.get_score
  end

end