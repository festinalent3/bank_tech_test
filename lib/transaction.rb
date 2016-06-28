class Transaction

  def initialize(value)
    @value = value
    @time = Time.now
  end

  def getValue
    @value
  end

  def getTime
    @time
  end

end
