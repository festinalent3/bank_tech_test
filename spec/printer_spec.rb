require 'printer'

describe Printer do
  let(:transaction1) { double(:transaction, value: 1000, type: :credit, time: Time.local(2012,1,10))}
  let(:transaction2) { double(:transaction, value: 2000, type: :credit, time: Time.local(2012,1,13))}
  let(:transaction3) { double(:neg_transaction, value: -500, type: :debit, time: Time.local(2012,1,14))}

  let(:history) { [transaction1, transaction2, transaction3]}
  let(:subject) { described_class.new(history) }

  it 'formates the date correctly' do
    expect(subject.print_date(transaction1)).to eq '10/01/2012'
  end


  it 'prints the positive value if the transaction is of type credit' do
    expect(subject.print_credit(transaction1)).to eq '1000'
  end

  it 'prints the negative value as positive if the transaction is of type debit' do
    expect(subject.print_debit(transaction3)).to eq '500'
  end

end
