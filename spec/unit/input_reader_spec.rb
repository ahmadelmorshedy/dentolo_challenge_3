require 'spec_helper'

describe InputReader do
  it 'reads several input lines until stop word and transform them to array' do
    # stubbing stdin the normal way works for only one line
    # so we should write in stdin by replacing it

    # replace stdin and write in it
    io = StringIO.new
    for i in 1..9 do
      io.puts 'STR' + i.to_s
    end
    io.puts "REPORT"
    io.rewind 
    $stdin = io

    # call stdin_read method
    lines_arr = InputReader.stdin_read('REPORT')
    # revert $stdin back to STDIN
    $stdin = STDIN
    # continue the test
    expect(lines_arr.length).to eq 10
    expect(lines_arr.first).to eq 'STR1'
    expect(lines_arr[5]).to eq 'STR6'
    expect(lines_arr.last).to eq 'REPORT'
  end
end