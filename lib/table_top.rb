class TableTop
  # Abstract class
  def initialize
    raise NotImplementedError.new("#{self.class.name} is an abstract class.")
  end

  # sets robot's position
  # @param position [Array] - robot's new position
  # @retrun [Boolean] - true if position valid, false otherwise 
  # not a standard setter to make it return boolean
  def move_robot(position)
    raise NotImplementedError.new("#{self.class.name}#robot_position is an abstract method.")
  end

  # gets robot's position
  # @return [Array] - robot current position
  def robot_position
    raise NotImplementedError.new("#{self.class.name}#robot_position is an abstract method.")
  end
end