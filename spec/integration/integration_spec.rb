require 'spec_helper'

describe 'Toy Robot Application' do
  before(:each) do
    # prepare StringIO to stub $sstdin for multiple lines
    @io = StringIO.new
    $stdin = @io
    # sets test_env
    ENV['test_env'] = 'true'
    require './application.rb' #after setting test_env
  end

  after(:each) do
    $stdin = STDIN
  end

  it 'executes list of commands' do  
    # prepare io
    @io.puts "PLACE 1,2,EAST"
    @io.puts "MOVE"
    @io.puts "MOVE"
    @io.puts "LEFT"
    @io.puts "MOVE"
    @io.puts "REPORT"
    @io.rewind
    
    # run the application
    expected_output = "3,3,NORTH\n"
    
    expect{run_application}.to output(expected_output).to_stdout
  end

  it 'runs only valid commands' do
    # prepare io
    @io.puts "PLACE 0,0,NORTH"
    @io.puts "MOVE"
    @io.puts "LEFT"
    @io.puts "MOVE"
    @io.puts "MOVE"
    @io.puts "PLACE 8,8,EAST"
    @io.puts "REPORT"
    @io.rewind

    # run the application
    expected_output = "0,1,WEST\n"
    expect{run_application}.to output(expected_output).to_stdout
  end

  it "initially waits for valid PLACE command" do
    @io.puts "MOVE"
    @io.puts "LEFT"
    @io.puts "MOVE"
    @io.puts "MOVE"
    @io.puts "PLACE 8,8,EAST"
    @io.puts "REPORT"
    @io.rewind

    # run the application
    expected_output = "Out of table top - please provide a valid PLACE command\n"
    expect{run_application}.to output(expected_output).to_stdout
  end

  it "skips only invalid MOVE or PLACE command but continue to execute Next ones" do
    @io.puts "PLACE 3,0,EAST"
    @io.puts "MOVE"
    @io.puts "MOVE"
    @io.puts "PLACE 8,8,WEST"
    @io.puts "MOVE"
    @io.puts "LEFT"
    @io.puts "MOVE"
    @io.puts "MOVE"
    @io.puts "REPORT"
    @io.rewind

    # run the application
    expected_output = "4,2,NORTH\n"
    expect{run_application}.to output(expected_output).to_stdout
  end
end
