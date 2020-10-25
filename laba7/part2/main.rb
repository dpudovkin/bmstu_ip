# frozen_string_literal: true

class Sym
  def initialize(value)
    @value = value
  end

  attr_reader :value

  def code
    @value.ord
  end

  def print
    $stdout.print @value
  end
end

class FontSym < Sym
  def initialize(value, font)
    super value
    @font = font
    @code = @value.ord
  end

  attr_reader :code

  attr_reader :font
end
