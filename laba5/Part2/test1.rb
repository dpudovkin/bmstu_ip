# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

class TestString < Minitest::Test
  def setup
    @arg = []
    @result = []
    @test_count = 10
    @test_count.times do |_|
      arr = gen_words
      @arg.push(arr.join(' '))
      arr.count.times { |i| arr[i - 1], arr[i] = arr[i], arr[i - 1] if i.odd? && (i < arr.count) }
      @result.push(arr.join(' '))
    end
  end

  def gen_words
    word_count = rand(2..30)
    mas = []
    word_count.times do |_|
      mas.push((2...rand(4)+10).map { ('a'..'z').to_a[rand(26)] }.join)
    end
    mas
  end

  def test_1
    @test_count.times do |i|
      assert_equal(foo(@arg[i]), @result[i])
    end
  end
end
