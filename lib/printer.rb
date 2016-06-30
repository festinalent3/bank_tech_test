class Printer

  def initialize
  end

  def statement(account)
    @account = account
    update_account_info
    format_statement
  end

  private

  def update_account_info
    @balance = @account.balance
    @history = @account.history.reverse
  end

  def format_statement
    string = fit("date") + pipes + fit("credit") + pipes + fit("debit") + pipes + fit("balance") + "\n"
    @history.each_with_index do | object, i |
      string += format_date(object) + pipes + format_credit(object) + pipes + format_debit(object) + pipes + format_balance(i)
    end
    string
  end

  def fit(string)
    string.rjust(10)
  end

  def pipes
    "||".rjust(5)
  end

  def format_date(object)
    fit(object.date.strftime("%d/%m/%Y"))
  end

  def format_credit(object)
    return fit('%.2f' % object.value) if object.type == :credit
    fit("")
  end

  def format_debit(object)
    return fit('%.2f' % object.value.abs) if object.type == :debit
    fit("")
  end

  def format_balance(n)
    @balance = @balance - @history[n-1].value unless n < 1
    fit("#{'%.2f' % (@balance) }") + "\n"
  end

end
