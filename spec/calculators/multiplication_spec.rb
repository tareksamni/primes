# frozen_string_literal: true

describe Calculators::Multiplication do
  subject { Calculators::Multiplication.new(array) }

  let(:array) { [2, 3, 5, 7, 11] }
  let(:size) { array.size }

  describe '#initialize' do
    it 'should assign @array' do
      expect(
        subject.instance_variable_get('@array')
      ).to match(array)
    end
  end

  describe '#matrix' do
    it 'should return a matrix' do
      expect(
        subject.matrix
      ).to be_a(Matrix)
    end

    it 'should calculate size^2 multiplications and cache it' do
      expect(
        subject
      ).to receive(:calculate).exactly(size * size).times
      subject.matrix
      subject.matrix # won't calculate again, already cached
    end

    it 'should return a matrix with 5 rows' do
      expect(
        subject.matrix.row_size
      ).to be(size)
    end

    it 'should return a matrix with 5 columns' do
      expect(
        subject.matrix.column_size
      ).to be(size)
    end
  end

  describe '#calculate' do
    it 'should multiple 0 * 1000 and return 0' do
      expect(
        subject.send(:calculate, 0, 1_000)
      ).to be(0)
    end

    it 'should multiple 1 * 1000 and return 1_000' do
      expect(
        subject.send(:calculate, 1, 1_000)
      ).to be(1_000)
    end

    it 'should multiple 10 * 10 and return 100' do
      expect(
        subject.send(:calculate, 10, 10)
      ).to be(100)
    end

    it 'should multiple -10 * 10 and return -100' do
      expect(
        subject.send(:calculate, -1, 100)
      ).to be(-100)
    end

    it 'should multiple 0.5 * 10 and return 5' do
      expect(
        subject.send(:calculate, 0.5, 10)
      ).to be(5.0)
    end
  end
end
