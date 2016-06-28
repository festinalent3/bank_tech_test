require 'account'

describe Account do
  let(:subject) { Account.new }
  let(:oneThousand) { 1000 }

  it 'initializes with a balance of 0' do
    expect(subject.getBalance).to eq 0
  end

  it 'allows the user to deposit money' do
    subject.deposit(oneThousand)
    expect(subject.getBalance).to eq oneThousand
  end

  it 'does not allow the user to deposit more than 10,000 at once' do
    subject.deposit(Account::MAX_DEPOSIT)
    expect(subject.getBalance).to eq oneThousand
  end

end
