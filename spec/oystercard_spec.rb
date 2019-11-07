require './lib/oystercard'

describe Oystercard do
  it 'oystercard has a balance of 0 by default' do
    expect(subject.balance).to eq 0
  end

  it 'increases the balance on the card' do
    expect { subject.top_up(15) }.to change { subject.balance }.to(15)
  end

  it 'raises an error if the top up value will exceed the limit' do
    expect { subject.top_up(91) > Oystercard::Limit }.to raise_error(RuntimeError)
  end

  it 'deducts the travel fare' do
    subject.balance = 30
    expect { subject.deduct(15) }.to change { subject.balance }.to(15)
  end
end