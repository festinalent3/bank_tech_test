require_relative 'transaction'

class Account
  attr_reader :balance, :history

  MAX_DEPOSIT = 9999.00

  def initialize
    @balance = 0.00
    @history = []
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
