require 'minitest/autorun'
require_relative '../../lib/commands/command'
require_relative '../../lib/commands/right'
require_relative '../../lib/robot'

class RightTest < Minitest::Test

  def test_should_change_the_direction_of_the_robot_to_the_right
    robot = Robot.new
    robot.placed = true
    right_command = Right.new(robot)
    assert_equal :north, robot.direction

    right_command.execute
    assert_equal :east, robot.direction

    right_command.execute
    assert_equal :south, robot.direction

    right_command.execute
    assert_equal :west, robot.direction

    right_command.execute
    assert_equal :north, robot.direction
  end

  def test_should_make_no_changes_when_the_robot_has_not_been_placed
    robot = Robot.new
    refute robot.placed?

    right_command = Right.new(robot)
    assert_equal :north, robot.direction

    right_command.execute
    assert_equal :north, robot.direction
  end

end
