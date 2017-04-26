class Place < Command

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def execute(x, y, direction)
    if @table.within_table?(x.to_i, y.to_i)
      @robot.position = [x.to_i, y.to_i]
      @robot.direction = direction
      @robot.placed = true
    end
  end

end
