require 'account'

describe Account do
  let(:account) { Account.new }

  it 'initializes with a balance of 0' do
    expect(account.getBalance).to eq 0
  end

end
