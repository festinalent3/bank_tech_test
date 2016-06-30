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
    if n > -1
      @balance = @balance - @to_print[n].getValue if @to_print[n].getType == :credit
      @balance = @balance + @to_print[n].getValue if @to_print[n].getType == :debit
    end
    " " + "#{'%.2f' % (@balance) }" + " "
  end

end
