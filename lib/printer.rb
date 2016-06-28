class Printer

  def initialize(to_print, balance)
    @to_print = to_print.reverse
    @duplicate = @to_print.dup
    @balance = balance
  end

  def print_table
    n = 0
    puts "   date  " + "   ||   " + "credit" + "    ||   " + "debit" + "    ||   " + "balance"
    @to_print.each do | object |
      puts print_date(object) + "  ||  " + print_credit(object) + "  ||  " + print_debit(object) + "  ||  " + print_balance(n)
      n += 1
    end
  end

  def print_date(object)
    object.time.strftime("%d/%m/%Y")
  end

  def print_credit(object)
    return " " + ('%.2f' % object.value) + " " if object.type == :credit
    "         "
  end

  def print_debit(object)
    return " " + ('%.2f' % object.value.abs) + " " if object.type == :debit
    "        "
  end

  def print_balance(n)
     @balance -= @duplicate[n-1].value unless n == 0
    " " + "#{'%.2f' % @balance}" + " "
  end

end
