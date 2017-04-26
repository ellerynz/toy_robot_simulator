require 'minitest/autorun'
require_relative '../../lib/commands/command'
require_relative '../../lib/commands/left'
require_relative '../../lib/robot'

class LeftTest < Minitest::Test

  def test_should_change_the_direction_of_the_robot_to_the_left
    robot = Robot.new
    robot.placed = true
    left_command = Left.new(robot)
    assert_equal :north, robot.direction

    left_command.execute
    assert_equal :west, robot.direction

    left_command.execute
    assert_equal :south, robot.direction

    left_command.execute
    assert_equal :east, robot.direction

    left_command.execute
    assert_equal :north, robot.direction
  end

  def test_should_make_no_changes_when_the_robot_has_not_been_placed
    robot = Robot.new
    refute robot.placed?

    left_command = Left.new(robot)
    assert_equal :north, robot.direction

    left_command.execute
    assert_equal :north, robot.direction
  end

end
