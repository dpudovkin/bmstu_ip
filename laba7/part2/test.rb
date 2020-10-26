# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main.rb'

# TestFunction class is responsible for testing
class TestFunction < Minitest::Test
  def setup; end

  def test_1
    d_char = Sym.new('d')
    s_char = FontSym.new('s', 'Robot')
    assert_instance_of(Sym, d_char)
    assert_instance_of(FontSym, s_char)
    assert_kind_of(Sym, d_char)
    assert_kind_of(Sym, s_char)
  end
end
