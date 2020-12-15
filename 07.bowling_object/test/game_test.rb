# frozen_string_literal: true

require_relative '../game'
require 'minitest/autorun'

class GameTest < Minitest::Test
  def test_calculate_frame_point
    game1 = Game.new('6390038273X9180X645')
    assert_equal 9, game1.calculate_frame_point(0), 'Frame 0s score should be 9'
    assert_equal 17, game1.calculate_frame_point(3), 'Frame 3s score should be 17 because of spare'
    assert_equal 20, game1.calculate_frame_point(5), 'Frame 5s score should be 20 becasue of strike'
    assert_equal 15, game1.calculate_frame_point(9), 'Frame 9s score should be 17 because of last frame'
  end

  def test_calculate_point
    game1 = Game.new('6390038273X9180X645')
    assert_equal 139, game1.calculate_point, 'Normal path'

    game2 = Game.new('X110000000000000000')
    assert_equal 14, game2.calculate_point

    game3 = Game.new('00XX00000000000000')
    assert_equal 30, game3.calculate_point

    game4 = Game.new('0000000000000000X12')
    assert_equal 16, game4.calculate_point

    game5 = Game.new('19X1000000000000000')
    assert_equal 32, game5.calculate_point

    game6 = Game.new('19100000000000000000')
    assert_equal 12, game6.calculate_point

    game7 = Game.new('000000000000000000X12')
    assert_equal 13, game7.calculate_point

    game8 = Game.new('000000000000000000191')
    assert_equal 11, game8.calculate_point

    game9 = Game.new('00000000000000000013')
    assert_equal 4, game9.calculate_point
  end
end
