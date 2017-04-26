require_relative 'determine_direction'

class Robot

  attr_reader :direction

  def initialize
    @position = nil
    @direction = :north
  end

  def direction=(new_direction)
    if DetermineDirection::DIRECTIONS.include?(new_direction)
      @direction = new_direction
    end
  end

end
