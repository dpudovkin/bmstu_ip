# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main.rb'

class TestFunction < Minitest::Test
  def setup; end

  def test_1
    d = Sym.new('d')
    s = FontSym.new('s', 'Robot')
    assert_instance_of(Sym, d)
    assert_instance_of(FontSym, s)
    assert_kind_of(Sym, d)
    assert_kind_of(Sym, s)
  end
end
