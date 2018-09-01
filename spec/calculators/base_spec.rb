# frozen_string_literal: true

describe Calculators::Base do
  subject { Calculators::Base.new(array) }

  let(:array) { [2, 3, 5, 7, 11] }

  describe '#calculate' do
    it 'should raise NotImplementedError' do
      expect { subject.send(:calculate, 5, 5) }.to(
        raise_error(NotImplementedError)
      )
    end
  end
end
