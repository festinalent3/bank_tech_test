require 'transaction'

describe Transaction do
  let(:oneThousand) { 1000 }
  let(:subject) { described_class.new(oneThousand) }
  let(:neg_subject) { described_class.new(oneThousand * -1) }


  describe '#initialize' do

    it 'can initialize with a given positive value' do
      expect(subject.getValue).to eq oneThousand
    end

    it 'can initialize with a given negative value' do
      expect(neg_subject.getValue).to eq oneThousand * -1
    end

    it 'saves the current time' do
      mocked_date = Time.local(2012,1,10)
      allow(Time).to receive(:now).and_return(mocked_date)
      expect(subject.getDate).to eq mocked_date
    end


    it 'sets a credit or debit type to itself' do
      expect(subject.getType).to eq :credit
      expect(neg_subject.getType).to eq :debit
    end

  end

end
