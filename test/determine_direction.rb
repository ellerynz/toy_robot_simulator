require 'minitest/autorun'
require_relative '../lib/determine_direction'

class DetermineDirectionTest < Minitest::Test

  def test_should_return_and_set_the_direction_to_the_left_of_the_current_direction
    assert_equal :west, DetermineDirection.left(:north)
    assert_equal :south, DetermineDirection.left(:west)
    assert_equal :east, DetermineDirection.left(:south)
    assert_equal :north, DetermineDirection.left(:east)
  end

  def test_should_return_and_set_the_direction_to_the_right_of_the_current_direction
    assert_equal :east, DetermineDirection.right(:north)
    assert_equal :south, DetermineDirection.right(:east)
    assert_equal :west, DetermineDirection.right(:south)
    assert_equal :north, DetermineDirection.right(:west)
  end

  def test_should_accept_an_uppercase_version_of_a_compass_point
    assert_equal :north, DetermineDirection.validate_direction('NORTH')
    assert_equal :east, DetermineDirection.validate_direction('EAST')
    assert_equal :south, DetermineDirection.validate_direction('SOUTH')
    assert_equal :west, DetermineDirection.validate_direction('WEST')
  end

end
