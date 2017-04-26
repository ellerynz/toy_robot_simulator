class Move < Command

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def execute
    next_pos = next_position
    if @table.within_table?(*next_pos)
      @robot.position = next_pos
    end
  end

  private

  def next_position
    case @robot.direction
    when :north
      [@robot.position[0], @robot.position[1] + 1]
    when :east
      [@robot.position[0] + 1, @robot.position[1]]
    when :south
      [@robot.position[0], @robot.position[1] - 1]
    when :west
      [@robot.position[0] - 1, @robot.position[1]]
    end
  end

end
