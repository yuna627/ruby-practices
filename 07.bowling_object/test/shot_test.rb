# frozen_string_literal: true

require_relative '../shot'
require 'minitest/autorun'

class ShotTest < Minitest::Test
  def test_initialize
    shot1 = Shot.new('X')
    shot2 = Shot.new('3')
    assert_equal 10, shot1.score
    assert_equal 3, shot2.score
  end
end
