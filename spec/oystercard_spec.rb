require './lib/oystercard'

describe Oystercard do
  it 'oystercard has a balance of 0 by default' do
    expect(subject.balance).to eq 0
  end

  it 'increases the balance on the card' do
    expect { subject.top_up(15) }.to change { subject.balance }.from(0).to(15)
  end
end