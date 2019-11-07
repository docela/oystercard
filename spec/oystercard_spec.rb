require 'oystercard'

describe Oystercard do
  it 'oystercard has a balance of 0 by default' do
    oystercard = Oystercard.new
    expect(:balance).to eq(0)
  end
end