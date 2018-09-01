# frozen_string_literal: true

describe Formatters::CLI do
  subject { Formatters::CLI.new(matrix) }

  let(:array) { [2, 3, 5, 7, 11] }
  let(:matrix) { Calculators::Multiplication.new(array).matrix }

  describe '#initialize' do
    it 'should assign @matrix' do
      expect(
        subject.instance_variable_get('@matrix')
      ).to match(matrix)
    end
  end

  describe '#format' do
    it 'should create a terminal table' do
      expect(subject.format).to be_a(Terminal::Table)
    end

    it 'should create a terminal table with 6 rows' do
      expect(subject.format.rows.count).to eq(array.size + 1)
    end

    it 'should create a terminal table with 6 columns' do
      expect(subject.format.rows.count).to eq(array.size + 1)
    end

    it 'should create a terminal table with correct title' do
      expect(subject.format.title).to eq('Primes Multiplications')
    end
  end
end
