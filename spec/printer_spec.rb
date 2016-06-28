require 'printer'

describe Printer do
  let(:transaction1) { double(:transaction, value: 1000, type: :credit, time: Time.local(2012,1,10))}
  let(:transaction2) { double(:transaction, value: 2000, type: :credit, time: Time.local(2012,1,13))}
  let(:transaction3) { double(:neg_transaction, value: -500, type: :debit, time: Time.local(2012,1,14))}
  let(:balance)  { 2500 }

  let(:history) { [transaction1, transaction2, transaction3]}
  let(:subject) { described_class.new(history, balance) }

  describe '#print_date' do
    it 'formates the date correctly' do
      expect(subject.print_date(transaction1)).to eq '10/01/2012'
    end
  end

  describe '#print_credit' do
    it 'prints the positive value if the transaction is of type credit' do
      expect(subject.print_credit(transaction1)).to eq ' 1000.00 '
    end

    it 'does not print the value if the transaction is of type debit' do
      expect(subject.print_credit(transaction3)).to eq "         "
    end
  end

  describe '#print_debit' do
    it 'prints the negative value as positive if the transaction is of type debit' do
      expect(subject.print_debit(transaction3)).to eq ' 500.00 '
    end

    it 'does not print the value if the transaction is of type credit' do
      expect(subject.print_debit(transaction1)).to eq "        "
    end
  end

  describe '#print_balance' do
    it 'prints the correct balance' do
      n = 0
      expect(subject.print_balance(n)).to eq " 2500.00 "

      n = 2
      expect(subject.print_balance(n)).to eq " 500.00 "
    end
  end

  describe '#print_table' do
    it 'example of table output above' do
      subject.print_table
    end
  end

end
