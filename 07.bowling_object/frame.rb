#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'shot'

class Frame
  def initialize(first_shot, second_shot = nil, third_shot = nil)
    @first_shot = Shot.new(first_shot)
    @second_shot = second_shot.nil? ? nil : Shot.new(second_shot)
    @third_shot = third_shot.nil? ? nil : Shot.new(third_shot)
  end

  def calculate_point
    point = @first_shot.score
    point += @second_shot.score if @second_shot
    point += @third_shot.score if @third_shot
    point
  end

  def all_shots
    shots = []
    shots << @first_shot
    shots << @second_shot if @second_shot
    shots << @third_shot if @third_shot
    shots
  end

  def strike?
    @first_shot.score == 10
  end

  def spare?
    !strike? && (@first_shot.score + @second_shot.score) == 10
  end
end
