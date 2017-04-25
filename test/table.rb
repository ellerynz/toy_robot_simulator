require 'minitest/autorun'
require_relative '../lib/table'

class TableTest < Minitest::Test

  def test_coordinates_are_within_a_table
    table = Table.new(max_x: 5, max_y: 5)

    assert table.within_table?(4, 4)
    assert table.within_table?(0, 5)
    refute table.within_table?(6, 6)
    refute table.within_table?(-1, -1)
  end

end
