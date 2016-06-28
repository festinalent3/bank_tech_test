class Transaction

  def initialize(value)
    @value = value
    @time = Time.now
    @type = value > 0 ? :credit : :debit
  end

  def getValue
    @value
  end

  def getTime
    @time
  end

  def getType
    @type
  end

end
