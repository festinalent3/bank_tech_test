require 'printer'

describe Printer do
  let(:transaction1) { double(:transaction, getValue: 1000, getType: :credit, getDate: Time.local(2012,1,10))}
  let(:transaction2) { double(:transaction, getValue: 2000, getType: :credit, getDate: Time.local(2012,1,13))}
  let(:transaction3) { double(:neg_transaction, getValue: 500, getType: :debit, getDate: Time.local(2012,1,14))}

  let(:balance)  { 2500 }

  let(:history) { [transaction1, transaction2, transaction3]}
  let(:account) { double(:account, getHistory: history, getBalance: balance)}

  describe '#statement' do
    it 'example of table output' do
      Printer.create(account)
      Printer.instance.statement
    end
  end

end
