class Left < Command

  def initialize(robot)
    @robot = robot
  end

  def execute
    return unless @robot.placed?
    @robot.direction = DetermineDirection.left(@robot.direction)
  end

end
