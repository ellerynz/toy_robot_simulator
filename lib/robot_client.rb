require_relative 'robot'
require_relative 'table'
require_relative 'determine_direction'
require_relative 'commands/command'
require_relative 'commands/composite_command'
require_relative 'commands/place'
require_relative 'commands/move'
require_relative 'commands/left'
require_relative 'commands/right'
require_relative 'commands/report'
require_relative 'commands/null_command'

class RobotClient

  def initialize
    @robot = Robot.new
    @table = Table.new(5, 5)
    @composite_command = CompositeCommand.new
  end

  def execute(instructions)
    instructions.each do |instruction|
      @composite_command.add_command(process_instruction(instruction))
    end
    @composite_command.execute
  end

  private

  # Returns the command for an instruction
  def process_instruction(instruction)
    instruction_parts = instruction.split(' ')

    case instruction_parts.first
    when 'PLACE'
      coordinates = instruction_parts.last.split(',')
      Place.new(@robot, @table, *coordinates)
    when 'MOVE'
      Move.new(@robot, @table)
    when 'LEFT'
      Left.new(@robot)
    when 'RIGHT'
      Right.new(@robot)
    when 'REPORT'
      Report.new(@robot)
    else
      NullCommand.new(instruction)
    end
  end

end
