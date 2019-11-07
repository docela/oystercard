require './lib/oystercard'

describe Oystercard do
  it 'oystercard has a balance of 0 by default' do
    expect(subject.balance).to eq 0
  end
end