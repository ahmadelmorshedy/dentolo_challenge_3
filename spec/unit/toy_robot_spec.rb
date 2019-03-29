require 'spec_helper'

describe ToyRobot do
  before(:each) do
    @toy_robot = ToyRobot.new
  end

  it 'executes list of commands' do  
    commands = ["PLACE 1,2,EAST", 
                "MOVE", 
                "MOVE", 
                "LEFT",
                "MOVE",
                "REPORT"]
    expected_output = "3,3,NORTH\n"
    expect{@toy_robot.process_commands(commands)}.to output(expected_output).to_stdout
  end

  it 'runs only valid commands' do
    commands = ["PLACE 0,0,NORTH", 
                "MOVE",
                "LEFT",
                "MOVE",
                "MOVE",
                "PLACE 8,8,EAST",
                "REPORT"]
    expected_output = "0,1,WEST\n"
    expect{@toy_robot.process_commands(commands)}.to output(expected_output).to_stdout
  end

  it "initially waits for valid PLACE command" do
    commands = ["MOVE",
                "LEFT",
                "MOVE",
                "MOVE",
                "PLACE 8,8,EAST",
                "REPORT"]
    expected_output = "Out of table top - please provide a valid PLACE command\n"
    expect{@toy_robot.process_commands(commands)}.to output(expected_output).to_stdout
  end

  it "skips only invalid MOVE or PLACE command but continue to execute Next ones" do
    commands = ["PLACE 3,0,EAST",
                "MOVE",
                "MOVE",
                "PLACE 8,8,WEST",
                "MOVE",
                "LEFT",
                "MOVE",
                "MOVE",
                "REPORT"]
    expected_output = "4,2,NORTH\n"
    expect{@toy_robot.process_commands(commands)}.to output(expected_output).to_stdout
  end
end