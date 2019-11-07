class Oystercard
  attr_accessor :balance
  Limit = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    if (value + @balance) <= Limit
      @balance += value
    else
      raise RuntimeError, "Error! The maximum value your Oystercard can hold is £90."
    end
  end

  def deduct(fare)
    @balance -= fare
  end
end
