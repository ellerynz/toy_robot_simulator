class Report < Command

  def initialize(robot)
    @robot = robot
  end

  def execute
    return unless @robot.placed?
    print "#{@robot.position[0]},#{@robot.position[1]},#{@robot.direction.upcase}\n"
  end

end
