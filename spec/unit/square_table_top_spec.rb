require 'spec_helper'

describe SquareTableTop do
  before(:each) do
    @square_table_top = SquareTableTop.new
  end

  it 'updates the position of the toy robot' do
    expect(@square_table_top.move_robot([3, 4])).to be true
  end

  it 'does not update robot\'s position with invalid position' do
    expect(@square_table_top.move_robot([6, 4])).to be false
  end

  it 'returns the position of the robot' do
    @square_table_top.move_robot([3, 4])
    expect(@square_table_top.robot_position).to eq [3, 4]
  end

  it 'returns nil as the position of the robot if not set correctly' do
    expect(@square_table_top.robot_position).to be nil
    @square_table_top.move_robot([6, 4]) # Invalid position setting
    expect(@square_table_top.robot_position).to be nil
  end

  it 'can have custom size' do
    @square_table_top = SquareTableTop.new(15)
    expect(@square_table_top.move_robot([12, 4])).to be true
  end
end
