class Account

  MAX_DEPOSIT = 9999.00

  def initialize
    @balance = 0.00
    @history = []
  end

  def getBalance
    return @balance
  end

  def getHistory
    return @history
  end

  def deposit(sum)
    unless sum > MAX_DEPOSIT
      @history.push(Transaction.new(sum))
      @balance += sum
    end
  end

  def withdraw(sum)
    unless (@balance - sum) < 0
      @history.push(Transaction.new(sum * -1))
      @balance -= sum
    end
  end

end
