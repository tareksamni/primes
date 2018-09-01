# frozen_string_literal: true

describe Primes::Generator do
  subject { Primes::Generator.new }

  describe '#initialize' do
    it 'should assign @primes' do
      primes = subject.instance_variable_get('@primes')
      expect(primes).to match([2, 3, 5, 7])
    end

    it 'should assign @max_checked' do
      max_checked = subject.instance_variable_get('@max_checked')
      expect(max_checked).to eq(8)
    end
  end

  describe '#generate' do
    context 'when primes_count is less than @primes' do
      let(:primes_count) { 4 }
      it 'should not call compute_primes' do
        expect(subject).not_to receive(:compute_primes).and_call_original
        subject.generate(primes_count)
      end

      it 'should return 4 primes [2, 3, 5, 7]' do
        primes = subject.generate(primes_count)
        expect(primes).to contain_exactly(2, 3, 5, 7)
      end
    end

    context 'when primes_count is more than @primes' do
      let(:primes_count) { 5 }
      it 'should call compute_primes once' do
        expect(subject).to receive(:compute_primes).and_call_original.once
        subject.generate(primes_count)
      end

      it 'should return 5 primes [2, 3, 5, 7, 11]' do
        primes = subject.generate(primes_count)
        expect(primes).to contain_exactly(2, 3, 5, 7, 11)
      end
    end

    context 'when primes_count is 0' do
      let(:primes_count) { 0 }
      it 'should return empty array' do
        primes = subject.generate(primes_count)
        expect(primes).to be_empty
      end
    end

    context 'when primes_count is -1' do
      let(:primes_count) { -1 }
      it 'should return nil' do
        primes = subject.generate(primes_count)
        expect(primes).to be_nil
      end
    end

    context 'when primes_count is 100_000' do
      let(:primes_count) { 100_000 }
      it 'should return 100_000 primes' do
        primes = subject.generate(primes_count)
        expect(primes.count).to be(primes_count)
      end
    end
  end
end
