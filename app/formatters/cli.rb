# frozen_string_literal: true

require 'terminal-table'

module Formatters
  class CLI
    def initialize(matrix)
      @matrix = matrix
    end

    def format
      Terminal::Table.new(title: 'Primes Multiplications', rows: @matrix.to_a)
    end
  end
end
