# frozen_string_literal: true

require_relative '../frame'
require 'minitest/autorun'

class FrameTest < Minitest::Test
  def test_calculate_point
    assert_equal 3, Frame.new('1', '2').calculate_point
    assert_equal 1, Frame.new('1').calculate_point
  end

  def test_get_shots
    shots = Frame.new('1', '2').all_shots

    assert_equal 2, shots.length
    assert_equal 1, shots[0].score
    assert_equal 2, shots[1].score
  end

  def test_is_strike?
    assert_equal true, Frame.new('X').strike?
    assert_equal false, Frame.new('9', '1').strike?
  end

  def test_is_spare?
    assert_equal true, Frame.new('9', '1').spare?
    assert_equal true, Frame.new('2', '8').spare?
    assert_equal false, Frame.new('2', '7').spare?
    assert_equal false, Frame.new('X').spare?
  end
end
