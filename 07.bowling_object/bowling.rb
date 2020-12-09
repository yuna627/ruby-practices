#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  attr_reader :scores, :frames

  def initialize(score)
    @frames = []
    @frame = []

    create_frames(score.split(''))
  end

  def create_frames(scores)
    scores.each do |s|
      @frame << s
      if @frames.size < 10 && (@frame.size >= 2 || s == 'X')
        @frames << Frame.new(@frame[0], @frame[1])
        @frame.clear
      elsif @frames.size == 10
        @frames.last.add_third_shot(s)
      end
    end
  end

  def calculate_point
    point = 0
    10.times do |frame_num|
      point += calculate_frame_point(frame_num)
    end
    point
  end

  def calculate_frame_point(frame_num)
    current_frame = @frames[frame_num]
    point = current_frame.calculate_point

    next_frame = @frames[frame_num + 1]
    after_next_frame = @frames[frame_num + 2]

    left_shots = []
    left_shots += next_frame.all_shots if next_frame
    left_shots += after_next_frame.all_shots if after_next_frame

    if current_frame.strike?
      point += left_shots[0].score if left_shots[0]
      point += left_shots[1].score if left_shots[1]
    elsif current_frame.spare?
      point += left_shots[0].score if left_shots[0]
    end
    point
  end
end

class Frame
  attr_reader :first_shot, :second_shot, :third_shot

  def initialize(first_shot, second_shot = nil)
    @first_shot = Shot.new(first_shot)
    @second_shot = second_shot.nil? ? nil : Shot.new(second_shot)
  end

  def add_third_shot(third_shot)
    @third_shot = Shot.new(third_shot)
  end

  def calculate_point
    point = first_shot.score
    point += second_shot.score if second_shot
    point += third_shot.score if third_shot
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

class Shot
  attr_reader :shot, :score

  def initialize(score)
    @score = score == 'X' ? 10 : score.to_i
  end
end
