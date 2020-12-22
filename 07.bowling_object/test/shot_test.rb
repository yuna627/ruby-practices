# frozen_string_literal: true

require_relative '../shot'
require 'minitest/autorun'

class ShotTest < Minitest::Test
  def test_initialize
    assert_equal 10, Shot.new('X').score
    assert_equal 3, Shot.new('3').score
  end
end
