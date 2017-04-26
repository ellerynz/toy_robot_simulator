class Right < Command

  def initialize(robot)
    @robot = robot
  end

  def execute
    return unless @robot.placed?
    @robot.direction = DetermineDirection.right(@robot.direction)
  end

end
