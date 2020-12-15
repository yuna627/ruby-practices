# frozen_string_literal: true

require_relative '../frame'
require 'minitest/autorun'

class FrameTest < Minitest::Test
  def test_calculate_point
    frame1 = Frame.new('1', '2')
    assert_equal 3, frame1.calculate_point

    frame2 = Frame.new('1')
    assert_equal 1, frame2.calculate_point
  end

  def test_get_shots
    frame1 = Frame.new('1', '2')
    shots = frame1.all_shots

    assert_equal 2, shots.length
    assert_equal 1, shots[0].score
    assert_equal 2, shots[1].score
  end

  def test_is_strike?
    frame1 = Frame.new('X')
    frame2 = Frame.new('9', '1')
    assert_equal true, frame1.strike?
    assert_equal false, frame2.strike?
  end

  def test_is_spare?
    frame1 = Frame.new('9', '1')
    frame2 = Frame.new('2', '8')
    frame3 = Frame.new('2', '7')
    frame4 = Frame.new('X')
    assert_equal true, frame1.spare?
    assert_equal true, frame2.spare?
    assert_equal false, frame3.spare?
    assert_equal false, frame4.spare?
  end
end
