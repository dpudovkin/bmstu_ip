# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

class TestFunction < Minitest::Test
  def setup
    @test_count = 10
    @arg = []
    @result = []
    @test_count.times do |i|
      @arg << rand(1000)
      @result << Math.exp(@arg[i]) / Math.tan(@arg[i]**3 - 5) + @arg[i]**2
    end
  end

  def test_1
    @test_count.times do |i|
      assert_equal(foo(@arg[i]), @result[i])
    end
  end
end
