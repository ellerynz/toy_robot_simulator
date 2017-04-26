require 'minitest/autorun'
require_relative '../../lib/commands/command'
require_relative '../../lib/commands/right'
require_relative '../../lib/robot'

class RightTest < Minitest::Test

  def test_should_change_the_direction_of_the_robot_to_the_right
    robot = Robot.new
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

end
