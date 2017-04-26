require 'minitest/autorun'
require_relative '../../lib/commands/command'
require_relative '../../lib/commands/left'
require_relative '../../lib/robot'

class LeftTest < Minitest::Test

  def test_should_change_the_direction_of_the_robot_to_the_left
    robot = Robot.new
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

end
