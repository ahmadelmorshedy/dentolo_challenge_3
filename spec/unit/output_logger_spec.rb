require 'spec_helper'

describe OutputLogger do
  it 'prints to stdout' do
    expect{OutputLogger.log_output("Hello")}.to output("Hello\n").to_stdout
  end
end