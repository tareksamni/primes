# frozen_string_literal: true

module Calculators
  class Multiplication < Base
    private

    def calculate(x, y) # rubocop:disable Naming/UncommunicativeMethodParamName
      x * y
    end
  end
end
