class Transaction
  attr_reader :value, :date

  def initialize(value)
    @value = value
    @date = Time.now
  end

  def type
    @value > 0 ? :credit : :debit
  end

end
