class Place < Command

  def initialize(robot, table, x, y, direction)
    @robot = robot
    @table = table
    @x = x
    @y = y
    @direction = direction
  end

  def execute
    if @table.within_table?(@x.to_i, @y.to_i)
      @robot.position = [@x.to_i, @y.to_i]
      @robot.direction = @direction
      @robot.placed = true
    end
  end

end
