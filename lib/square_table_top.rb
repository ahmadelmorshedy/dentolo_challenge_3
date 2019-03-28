# require '*.rb'
class SquareTableTop < TableTop
  # initializer
  # @param dimension [Integer] - dimension of the square
  def initialize(dimension = 5)
    @dimension = dimension
  end

  # Inherited methods from TableTop class
  
  def move_robot(position)
    # check if point valid
    if position[0].between?(0, @dimension - 1) && position[1].between?(0, @dimension - 1)
      @robot_position = position
      return true
    else
      return false
    end
  end

  def robot_position
    @robot_position
  end
end