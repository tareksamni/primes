# frozen_string_literal: true

module Primes
  class Generator
    def initialize
      @primes = [2, 3, 5, 7]
      @max_checked = @primes.last + 1
    end

    def generate(count = 10)
      compute_primes while @primes.size < count
      @primes.slice(0, count)
    end

    private

    # Ported from:
    # https://github.com/ruby/prime/blob/master/lib/prime.rb#L434
    def compute_primes
      max_segment_size = 1_000
      max_cached_prime = @primes.last
      @max_checked = max_cached_prime + 1 if max_cached_prime > @max_checked

      segment_min = @max_checked
      segment_max = [segment_min + max_segment_size, max_cached_prime * 2].min
      root = Integer.sqrt(segment_max)

      segment = ((segment_min + 1)..segment_max).step(2).to_a

      (1..Float::INFINITY).each do |sieving|
        prime = @primes[sieving]
        break if prime > root
        composite_index = (-(segment_min + 1 + prime) / 2) % prime
        while composite_index < segment.size
          segment[composite_index] = nil
          composite_index += prime
        end
      end

      @primes.concat(segment.compact!)

      @max_checked = segment_max
    end
  end
end
