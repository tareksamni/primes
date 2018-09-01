# frozen_string_literal: true

require 'Matrix'

module Calculators
  class Base
    def initialize(array)
      @array = array
    end

    def matrix
      @matrix ||= Matrix.build(size, size) do |row, col|
        calculate(@array[row], @array[col])
      end
    end

    private

    def calculate(_, _) # rubocop:disable Naming/UncommunicativeMethodParamName
      raise(NotImplementedError)
    end

    def size
      @array.size
    end
  end
end
