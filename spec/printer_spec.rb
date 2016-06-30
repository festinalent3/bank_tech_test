require 'printer'

describe Printer do
  let(:transaction1) { double(:transaction, value: 1000, type: :credit, date: Time.local(2012,1,10))}
  let(:transaction2) { double(:transaction, value: 2000, type: :credit, date: Time.local(2012,1,13))}
  let(:transaction3) { double(:neg_transaction, value: 500, type: :debit, date: Time.local(2012,1,14))}

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
