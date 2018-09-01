# frozen_string_literal: true

require 'matrix'

module Calculators
  class Base
    def initialize(array)
      @array = array
    end

    def matrix
      @matrix ||= Matrix.build(size + 1, size + 1) do |row, col|
        if row.zero? && col.zero?
          nil
        elsif row.zero?
          @array[col - 1]
        elsif col.zero?
          @array[row - 1]
        else
          calculate(@array[row - 1], @array[col - 1])
        end
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
