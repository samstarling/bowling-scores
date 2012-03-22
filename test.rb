require 'test/unit'
require './bowling'

class BowlingTest < Test::Unit::TestCase

  def setup
    @game = BowlingGame.new
  end

  def test_a_single_gutter_ball
    @game.add_roll 0, 0
    assert_equal 0, @game.get_score
  end

end