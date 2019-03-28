require 'spec_helper'

describe TableTop do
  it 'is an abstract class' do
    expect{TableTop.new}.to raise_error(NotImplementedError)
  end
end
