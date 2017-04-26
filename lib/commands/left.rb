class Left < Command

  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.direction = DetermineDirection.left(@robot.direction)
  end

end
