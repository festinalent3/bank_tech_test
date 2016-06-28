class Transaction

  def initialize(value)
    @value = value
    @date = Time.now
    @type = value > 0 ? :credit : :debit
  end

  def getValue
    @value
  end

  def getDate
    @date
  end

  def getType
    @type
  end

end
