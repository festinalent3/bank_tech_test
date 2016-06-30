require 'printer'

describe Printer do
  let(:transaction1) { double(:transaction, value: 1000, type: :credit, date: Time.local(2012,1,10))}
  let(:transaction2) { double(:transaction, value: 2000, type: :credit, date: Time.local(2012,1,13))}
  let(:transaction3) { double(:neg_transaction, value: -500, type: :debit, date: Time.local(2012,1,14))}

  let(:balance)  { 2500 }

  let(:history) { [transaction1, transaction2, transaction3]}
  let(:account) { double(:account, history: history, balance: balance)}

  let(:subject) { described_class.new}

  describe '#statement' do
    it 'prints a table with the account history' do
      table = subject.statement(account)
      print table

      expect(table).to include( transaction1.value.to_s)
      expect(table).to include( transaction2.value.to_s)
      neg_value = transaction3.value * -1
      expect(table).to include( neg_value.to_s )

      expect(table).to include(transaction2.date.strftime("%d/%m/%Y"))

      expect(table).to include( balance.to_s)

    end
  end

end
