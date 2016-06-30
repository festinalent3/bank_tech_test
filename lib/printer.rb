class Printer

  def self.create(account)
    @instance = Printer.new(account)
  end

  def self.instance
    @instance
  end

  def statement
    update_account_info
    puts "   date  " + "   ||   " + "credit" + "    ||   " + "debit" + "    ||   " + "balance"
    @to_print.each_with_index do | object, i |
      puts print_date(object) + "  ||  " + print_credit(object) + "  ||  " + print_debit(object) + "  ||  " + print_balance(i-1)
    end
  end

  private

  def initialize(account)
    @account = account
  end

  def update_account_info
    @balance = @account.getBalance
    @to_print = @account.getHistory.reverse
  end

  def print_date(object)
    object.date.strftime("%d/%m/%Y")
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
    if n > -1
      @balance = @balance - @to_print[n].value if @to_print[n].type == :credit
      @balance = @balance + @to_print[n].value if @to_print[n].type == :debit
    end
    " " + "#{'%.2f' % (@balance) }" + " "
  end

end
