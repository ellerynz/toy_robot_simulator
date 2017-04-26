require 'minitest/autorun'
require_relative '../../lib/commands/command'
require_relative '../../lib/commands/move'
require_relative '../../lib/robot'
require_relative '../../lib/table'
require_relative '../../lib/determine_direction'

class MoveTest < Minitest::Test

  def setup
    @robot = Robot.new
    @robot.position = [0, 0]
    @robot.placed = true
    @table = Table.new(5, 5)
    @move = Move.new(@robot, @table)
  end

  def test_should_move_a_robot_when_within_table_bounds
    assert_equal [0, 0], @robot.position
    @move.execute
    assert_equal [0, 1], @robot.position
  end

  def test_should_not_move_a_robot_when_out_of_table_bounds
    @robot.position = [-1, -1]
    assert_equal [-1, -1], @robot.position
    @move.execute
    assert_equal [-1, -1], @robot.position
  end

  def test_should_not_move_a_robot_from_within_bounds_to_out_of_bounds
    @robot.direction = :south
    assert_equal [0, 0], @robot.position
    @move.execute
    assert_equal [0, 0], @robot.position
  end

  def test_should_not_move_a_robot_that_has_not_been_placed
    @robot.placed = false
    @move.execute
    assert_equal [0, 0], @robot.position
  end

end
