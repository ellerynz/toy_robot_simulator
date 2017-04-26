require 'minitest/autorun'
require_relative '../../lib/commands/command'
require_relative '../../lib/commands/place'
require_relative '../../lib/robot'
require_relative '../../lib/table'
require_relative '../../lib/determine_direction'

class PlaceTest < Minitest::Test

  def setup
    @robot = Robot.new
    @table = Table.new(5, 5)
  end

  def test_should_place_a_robot_when_given_a_valid_position
    assert_equal :north, @robot.direction
    assert @robot.position.nil?
    refute @robot.placed?

    Place.new(@robot, @table, 3, 3, :south).execute

    assert_equal :south, @robot.direction
    assert_equal [3, 3], @robot.position
    assert @robot.placed?
  end

  def test_should_not_place_a_robot_when_given_an_invalid_position
    assert_equal :north, @robot.direction
    assert @robot.position.nil?
    refute @robot.placed?

    Place.new(@robot, @table, -3, 3, :south).execute

    assert_equal :north, @robot.direction
    assert @robot.position.nil?
    refute @robot.placed?
  end

end
