require 'minitest/autorun'
require_relative '../lib/table'

class TableTest < Minitest::Test

  def test_coordinates_are_within_a_table
    table = Table.new(5, 5)

    assert table.within_table?(4, 4)
    assert table.within_table?(0, 4)
    refute table.within_table?(6, 6)
    refute table.within_table?(-1, -1)
  end

end
