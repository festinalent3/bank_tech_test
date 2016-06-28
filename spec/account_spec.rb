require 'account'

describe Account do
  let(:subject) { Account.new }
  let(:oneThousand) { 1000 }

  it 'initializes with a balance of 0' do
    expect(subject.getBalance).to eq 0
  end

  describe '#deposit' do

    it 'increases the balance of the account' do
      subject.deposit(oneThousand)
      expect(subject.getBalance).to eq oneThousand
    end

    it 'does not allow the user to deposit more than 10,000 at once' do
      subject.deposit(Account::MAX_DEPOSIT + 1)
      expect(subject.getBalance).to eq 0
    end

  end

  describe '#withdraw' do

    it 'decreases the balance of the account' do
      subject.deposit(oneThousand)
      subject.withdraw(oneThousand)
      expect(subject.getBalance).to eq 0
    end

    it 'does not allow the user to withdraw money if balance = 0' do
      subject.withdraw(oneThousand)
      expect(subject.getBalance).to eq 0
    end

    it 'does not allow the user to withdraw money if the balance would go below zero' do
      subject.withdraw(oneThousand + 1)
      expect(subject.getBalance).to eq 0
    end
  end
end
