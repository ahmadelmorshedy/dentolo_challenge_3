def run_application
  Dir[File.join(File.dirname(__FILE__), "./lib/*.rb")].each { |f| require f }

  # create new Toy Robot
  toy_robot = ToyRobot.new(SquareTableTop.new)

  # Read input
  commands = InputReader.stdin_read("REPORT")

  # pass the commands to toy_robot
  toy_robot.process_commands(commands)
end

run_application unless ENV['test_env']  