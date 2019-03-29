module InputReader
  def self.stdin_read(stop_word = "REPORT")
    $/ = stop_word  
    user_input = $stdin.gets.split("\n")
  end
end