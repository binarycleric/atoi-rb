require "benchmark/ips"
require_relative "../lib/atoi"

include Atoi

test_values = 1000.times.map(&:to_s)

Benchmark.ips do |x|
  x.report("atoi-rb") do
    test_values.each do |n|
      atoi(n)
    end
  end

  x.report("native #to_i") do
    test_values.each do |n|
      n.to_i
    end
  end

  x.compare!
end
