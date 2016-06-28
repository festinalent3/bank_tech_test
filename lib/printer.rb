class Printer

  def initialize(to_print)
    @to_print = to_print
  end

  def print_date(object)
    object.time.strftime("%d/%m/%Y")
  end

  def print_credit(object)
    return object.value.to_s if object.type == :credit
    ""
  end

  def print_debit(object)
    return (object.value.abs).to_s if object.type == :debit
    ""
  end

end
