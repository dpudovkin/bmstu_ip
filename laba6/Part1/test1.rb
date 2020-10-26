# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

class TestCalculation < Minitest::Test
  def setup
    @arg = []
    @test_count = 10
    @test_count.times { |_| @arg << rand(1..100).to_f / 100_000 }
  end

  def test_1
    @test_count.times { |i| assert_equal(calc(@arg[i]), calc_enum(@arg[i])) }
  end
end
