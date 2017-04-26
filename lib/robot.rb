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
    @direction = DetermineDirection.validate_direction(new_direction)
  end

end
