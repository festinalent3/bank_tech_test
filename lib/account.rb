class Account

  MAX_DEPOSIT = 10000

  def initialize
    @balance = 0
  end

  def getBalance
    return @balance
  end

  def deposit(sum)
    @balance += sum unless sum > MAX_DEPOSIT
  end

  def withdraw(sum)
    @balance -= sum unless (@balance - sum) < 0
  end

end
