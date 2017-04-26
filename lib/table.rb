# Determines whether a coordinate is within the table
class Table

  def initialize(min_x: 0, min_y: 0, max_x:, max_y:)
    @min_x = min_x
    @min_y = min_y
    @max_x = max_x
    @max_y = max_y
  end

  def within_table?(x, y)
    @min_x <= x &&
      @min_y <= y &&
      @max_x > x &&
      @max_y > y
  end

end
