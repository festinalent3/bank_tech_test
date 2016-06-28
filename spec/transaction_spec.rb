require 'transaction'

describe Transaction do
  let(:oneThousand) { 1000 }
  let(:subject) { described_class.new(oneThousand) }

  describe '#initialize' do
    it 'can initialize with a given positive value' do
      expect(subject.getValue).to eq oneThousand
    end

    it 'can initialize with a given negative value' do
      negative_subject = Transaction.new(oneThousand * -1)
      expect(negative_subject.getValue).to eq oneThousand * -1
    end

    it 'saves the current time' do
      mocked_time = Time.local(2012,1,10)
      allow(Time).to receive(:now).and_return(mocked_time)
      expect(subject.getTime).to eq mocked_time
    end
  end
end
