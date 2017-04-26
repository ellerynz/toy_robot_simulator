require_relative 'determine_direction'

class Robot

  attr_reader :direction
  attr_accessor :position, :placed

  def initialize
    @position = nil
    @direction = :north
    @placed = false
  end

  # Used to determine if the robot is on the board
  def placed?
    !!@placed
  end

  def direction=(new_direction)
    if DetermineDirection::DIRECTIONS.include?(new_direction)
      @direction = new_direction
    end
  end

end
