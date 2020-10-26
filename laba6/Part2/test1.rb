#frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

class TestDiffer < Minitest::Test
  def setup
    @arg_x = []
    @arg_h = []
    @test_count = 5
    @test_count.times { |_| @arg_x << (-5 + rand(10).to_f) }
    @test_count.times { |_| @arg_h << (rand(1..5).to_f / 1000) }
  end

  def test_func1
    func1 = ->(x) { Math.sin(x) }
    d_func1 = ->(x) { Math.cos(x) } # differentiated functions of the source program
    printf "\n\n"
    @test_count.times do |i|
      res = differ(@arg_x[i], @arg_h[i]) { |x| func1.call(x)}
      res.each_index do |index|
        assert_in_delta(res[index], d_func1.call(@arg_x[i] + @arg_h[i] * index), 0.001)
        # printf "Calculation value - #{res[index]}  Real value - #{d_func1.call(@arg_x[i] + @arg_h[i] * index)}\n"
      end
    end
  end

  def test_func2
    func2 = ->(x) { Math.tan(x + 1)}
    d_func2 = ->(x) {1 / (Math.cos(x + 1)**2)} # differentiated functions of the source program
    printf "\n\n"
    @test_count.times do |i|
      res = differ(@arg_x[i], @arg_h[i]) { |x| func2.call(x)}
      res.each_index do |index|
        assert_in_delta(res[index], d_func2.call(@arg_x[i] + @arg_h[i] * index), 0.002)
        # printf "Calculation value - #{res[index]}  Real value - #{d_func2.call(@arg_x[i] + @arg_h[i] * index)}\n"
      end
    end
  end
end
