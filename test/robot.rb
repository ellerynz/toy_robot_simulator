require 'minitest/autorun'
require_relative '../lib/robot'

class RobotTest < Minitest::Test

  def test_should_set_a_new_direction
    robot = Robot.new
    assert_equal :north, robot.direction

    robot.direction = :south
    assert_equal :south, robot.direction
  end

  def test_should_not_set_an_invalid_direction
    robot = Robot.new
    assert_equal :north, robot.direction

    robot.direction = :not_a_direction
    assert_equal :north, robot.direction
  end

end
