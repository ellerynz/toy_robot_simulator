require_relative 'robot'
require_relative 'table'
require_relative 'commands/command'
require_relative 'commands/composite_command'
require_relative 'commands/place'
require_relative 'commands/move'
require_relative 'commands/left'
require_relative 'commands/right'
require_relative 'commands/report'

class RobotClient

  def initialize
    @robot = Robot.new
    @table = Table.new
    @composite_command = CompositeCommand.new
  end

  def execute(instructions)
    instructions.each do |instruction|
      process_instruction(instruction)
    end
    @composite_command.execute
  end

  private

  def process_instruction(instruction)
    case instruction
    when 'PLACE'
      @composite_command.add_command(Place.new(@robot, @table))
    when 'MOVE'
      @composite_command.add_command(Move.new(@robot, @table))
    when 'LEFT'
      @composite_command.add_command(Left.new(@robot))
    when 'RIGHT'
      @composite_command.add_command(Right.new(@robot))
    when 'REPORT'
      @composite_command.add_command(Report.new(@robot))
    else
      "Invalid command: #{instruction}"
    end
  end

end
