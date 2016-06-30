class Printer

  def self.create(account)
    @instance = Printer.new(account)
  end

  def self.instance
    @instance
  end

  def statement
    update_account_info
    format_statement
  end

  private

  def initialize(account)
    @account = account
  end

  def update_account_info
    @balance = @account.balance
    @to_print = @account.history.reverse
  end

  def format_statement
    string = "   date  " + "   ||   " + "credit" + "    ||   " + "debit" + "    ||   " + "balance" + "\n"
    @to_print.each_with_index do | object, i |
      string += format_date(object) + "  ||  " + format_credit(object) + "  ||  " + format_debit(object) + "  ||  " + format_balance(i)
    end
    string
  end

  def format_date(object)
    object.date.strftime("%d/%m/%Y")
  end

  def format_credit(object)
    return " " + ('%.2f' % object.value) + " " if object.type == :credit
    "         "
  end

  def format_debit(object)
    return " " + ('%.2f' % object.value.abs) + " " if object.type == :debit
    "        "
  end

  def format_balance(n)
    @balance = @balance - @to_print[n-1].value unless n < 1
    " " + "#{'%.2f' % (@balance) }" + " " + + "\n"
  end

end
