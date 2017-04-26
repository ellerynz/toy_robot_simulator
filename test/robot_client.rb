require 'minitest/autorun'
require_relative '../lib/robot_client'

class RobotTest < Minitest::Test

  def test_simple_instructions
    instructions = [
      'PLACE 0,0,NORTH',
      'MOVE',
      'REPORT',
    ]

    instructions2 = [
      'PLACE 0,0,NORTH',
      'LEFT',
      'REPORT',
    ]

    instructions3 = [
      'PLACE 1,2,EAST',
      'MOVE',
      'MOVE',
      'LEFT',
      'MOVE',
      'REPORT',
    ]

    assert_output("0,1,NORTH\n") { RobotClient.new.execute(instructions) }
    assert_output("0,0,WEST\n") { RobotClient.new.execute(instructions2) }
    assert_output("3,3,NORTH\n") { RobotClient.new.execute(instructions3) }
  end

  def test_should_print_a_message_for_invalid_instructions
    assert_output("Unknown instruction 'FOO'\n") { RobotClient.new.execute(['FOO']) }
  end

  def test_should_ignore_commands_when_there_is_no_place
    instructions = [
      'MOVE',
      'REPORT',
      'LEFT',
      'MOVE',
      'REPORT',
    ]

    assert_output('') { RobotClient.new.execute(instructions) }
  end

  def test_should_ignore_commands_before_the_first_place_command
    instructions = [
      'MOVE',
      'REPORT',
      'LEFT',
      'PLACE 1,2,EAST',
      'MOVE',
      'REPORT',
    ]

    assert_output("2,2,EAST\n") { RobotClient.new.execute(instructions) }
  end

  def test_should_accept_multiple_place_statements
    instructions = [
      'PLACE 1,1,EAST',
      'MOVE',
      'PLACE 1,1,WEST',
      'MOVE',
      'REPORT',
    ]

    assert_output("0,1,WEST\n") { RobotClient.new.execute(instructions) }
  end

  def test_should_not_allow_the_robot_to_go_off_table
    instructions = [
      'PLACE 0,0,SOUTH',
      'MOVE',
      'REPORT',
    ]

    assert_output("0,0,SOUTH\n") { RobotClient.new.execute(instructions) }
  end

end
