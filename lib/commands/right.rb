class Right < Command

  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.direction = DetermineDirection.right(@robot.direction)
  end

end
