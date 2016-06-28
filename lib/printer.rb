class Printer

  def initialize(to_print, balance)
    @to_print = to_print.reverse
    @duplicate = @to_print.dup
    @balance = balance
  end

  def print_table
    puts "   date  " + "   ||   " + "credit" + "    ||   " + "debit" + "    ||   " + "balance"
    @to_print.each_with_index do | object, i |
      puts print_date(object) + "  ||  " + print_credit(object) + "  ||  " + print_debit(object) + "  ||  " + print_balance(i)
    end
  end

  def print_date(object)
    object.getDate.strftime("%d/%m/%Y")
  end

  def print_credit(object)
    return " " + ('%.2f' % object.getValue) + " " if object.getType == :credit
    "         "
  end

  def print_debit(object)
    return " " + ('%.2f' % object.getValue.abs) + " " if object.getType == :debit
    "        "
  end

  def print_balance(n)
     @balance -= @duplicate[n-1].getValue unless n == 0
    " " + "#{'%.2f' % @balance}" + " "
  end

  def update(to_print, balance)
    @to_print = to_print.reverse
    @duplicate = @to_print.dup
    @balance = balance
  end

end
