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
    assert_equal 139, Game.new('6390038273X9180X645').calculate_point, 'Normal path'
    assert_equal 14, Game.new('X110000000000000000').calculate_point, 'game2'
    assert_equal 30, Game.new('00XX00000000000000').calculate_point, 'game3'
    assert_equal 16, Game.new('0000000000000000X12').calculate_point,'game4'
    assert_equal 32, Game.new('19X1000000000000000').calculate_point,'game5'
    assert_equal 12, Game.new('19100000000000000000').calculate_point,'game6'
    assert_equal 13, Game.new('000000000000000000X12').calculate_point,'game7'
    assert_equal 11, Game.new('000000000000000000191').calculate_point,'game8'
    assert_equal 4, Game.new('00000000000000000013').calculate_point,'game9'
  end
end
