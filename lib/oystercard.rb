class Oystercard
  attr_accessor :balance, :in_journey
  Maximum_Amount = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    if (value + @balance) <= Maximum_Amount
      @balance += value
    else
      raise RuntimeError, "Error! The maximum value your Oystercard can hold is £90."
    end
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
    puts "You have just touched in and are in the station."
  end

  def touch_out
    @in_journey = false
    puts "You have just touched out and have left the station."
  end
end
