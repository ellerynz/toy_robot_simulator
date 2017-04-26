class DetermineDirection

  DIRECTIONS = [:north, :east, :south, :west]

  def self.left(current_direction)
    DIRECTIONS[DIRECTIONS.index(current_direction) - 1]
  end

  def self.right(current_direction)
    current_position = DIRECTIONS.index(current_direction)
    if current_position + 1 == DIRECTIONS.length
      DIRECTIONS[0]
    else
      DIRECTIONS[current_position + 1]
    end
  end

  def self.validate_direction(direction)
    direction = direction.to_s.downcase.to_sym
    if DIRECTIONS.include?(direction)
      direction
    else
      :north
    end
  end

end
