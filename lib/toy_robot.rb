class ToyRobot
  def initialize(table_top = SquareTableTop.new)
    @table_top = table_top
  end

  # process commands sequence
  # @param commands_arr [Array] - array of commands
  def process_commands(commands_arr)
    # process given commands array
    # should outputs REPORT command to stdout
    commands_arr.each do |command_str|
      command = command_str.split().first
      case command
      when "PLACE"
        place command_str
      when "MOVE"
        move if @toy_place
      when "REPORT"
        report
      else
        rotate(command) if @toy_place
      end
    end
  end

  private

  # places the robot into the given position
  # @param place [String] - the place to go to
  def place(place)
    # extract position x & y
    place_options = place.gsub("PLACE ", "").split(",")
    place_robot([place_options[0].to_i, place_options[1].to_i], 
                  place_options[2])
  end

  # similar to plcae, but with refined options
  # called by place & move
  # @param new_place [Array] - Array of [x, y] position to move to
  # @param direction [String] - new direction
  def place_robot(new_place, direction)
    if @table_top.move_robot(new_place)
      @toy_place = new_place
      @toy_direction = direction
    end
  end

  # Moves robot one step toward it's direction
  def move
    case @toy_direction
    when "NORTH"
      new_place = [@toy_place[0], @toy_place[1] + 1]
    when "EAST"
      new_place = [@toy_place[0] + 1, @toy_place[1]]
    when "SOUTH"
      new_place = [@toy_place[0], @toy_place[1] - 1]
    when "WEST"
      new_place = [@toy_place[0] - 1, @toy_place[1]]
    end
    place_robot(new_place, @toy_direction)
  end

  # Reports robot's current place and direction
  def report
    if @toy_place
      report_str = @toy_place[0].to_s + ","
      report_str += @toy_place[1].to_s + ","
      report_str += @toy_direction
    else
      report_str = "Out of table top - "
      report_str += "please provide a valid PLACE command"
    end
    OutputLogger.log_output report_str
  end

  # Rotates robot's by given direction 90 degrees
  # @param direction [String] - it's either LEFT or RIGHT 
  def rotate(direction)
    case @toy_direction
    when "NORTH"
      @toy_direction = (direction == 'RIGHT')? 'EAST' : 'WEST'
    when "EAST"
      @toy_direction = (direction == 'RIGHT')? 'SOUTH' : 'NORTH'
    when "SOUTH"
      @toy_direction = (direction == 'RIGHT')? 'WEST' : 'EAST'
    when "WEST"
      @toy_direction = (direction == 'RIGHT')? 'NORTH' : 'SOUTH'
    end
  end
end