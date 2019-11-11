require "./lib/oystercard"

describe Oystercard do
  it "oystercard has a balance of 0 by default" do
    expect(subject.balance).to eq 0
  end

  it "increases the balance on the card" do
    expect { subject.top_up(15) }.to change { subject.balance }.to(15)
  end

  it "raises an error if the top up value will exceed the limit" do
    expect { subject.top_up(91) > Oystercard::Maximum_Amount }.to raise_error(RuntimeError)
  end

  # it "deducts the travel fare" do
  #   subject.balance = 30
  #   expect { subject.deduct(15) }.to change { subject.balance }.to(15)
  # end

  it "ensures the default to not be on a journey" do
    expect(subject).not_to be_in_journey
  end

  it "card touches in" do
    subject.balance = Oystercard::Minimum_Amount
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "card touches out" do
    subject.balance >= Oystercard::Minimum_Amount
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "raises an error if the balance is less than the minimum fare" do
    subject.balance < Oystercard::Minimum_Amount
    expect { subject.touch_in }.to raise_error "Your current balance is less than £1! Top up now to travel."
  end

  it 'deducts the fare' do
    subject.top_up(30)
    subject.touch_in
    expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::Minimum_Fare)
  end
end