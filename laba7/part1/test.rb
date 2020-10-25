# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main.rb'

class TestFunction < Minitest::Test
  def setup
    @max_string_size = 30
    @max_string_count = 10
    @test_count = 10
    @extra = %w[e E r t U]
  end

  def test_1
    @test_count.times do |_|
      @file_f = File.open('f.txt', 'w+')
      @file_g = File.open('g.txt', 'w+')
      @mas = (1..rand(@max_string_count)).map { |_| generate_str(rand(@max_string_size)) }
      text_g = @mas.join("\n")
      @mas.map! do |item|
        rand(5).times { |_| item.insert(rand(item.length - 1), @extra[rand(@extra.length)]) }
        item.reverse
      end
      @file_f.write(@mas.join("\n"))
      foo(@file_f, @file_g, false)
      @file_g.seek(File::SEEK_SET)
      assert_equal(text_g.strip, @file_g.read.strip)
      @file_f.close
      @file_g.close
    end
  end

  def test_2
    @file_f = File.open('f.txt', 'w+')
    @file_g = File.open('g.txt', 'w+')
    text_f="ffs\ngdEf\nUef\ndgd\nrtFs"
    text_g ="sff\nfdg\nf\dgd\nsF"
    @file_f.write text_f
    foo(@file_f, @file_g, false)
    @file_g.seek(File::SEEK_SET)
    assert_equal(text_g,@file_g.read.strip)
    @file_f.close
    @file_g.close
  end

  def generate_str(len)
    characters = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
    characters.reject! { |item| @extra.include?(item) }
    (1...len).map { characters[rand(characters.length - 1)] }.join('')
  end
end
