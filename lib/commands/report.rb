class Report < Command

  def initialize(robot)
    @robot = robot
  end

  def execute
    return unless @robot.placed?
    STDOUT.write("#{@robot.position[0]}, #{@robot.position[1]}, #{@robot.direction}\n")
  end

end
