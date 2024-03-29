class Oystercard
  attr_accessor :balance, :in_journey, :entry_station
  Minimum_Amount = 1
  Maximum_Amount = 90
  Minimum_Fare = 2

  def initialize
    @balance = 0
  end

  def top_up(value)
    if (value + @balance) <= Maximum_Amount
      @balance += value
    else
      raise RuntimeError, "The maximum value your Oystercard can hold is £90."
    end
  end
 
  private def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    fail "Your current balance is less than £1! Top up now to travel." if @balance < Minimum_Amount
    @entry_station = station
    puts "You have just touched in and are in the station."
  end

  def touch_out
    @balance -= Minimum_Fare
    puts "You have just touched out and have left the station."
  end
end
