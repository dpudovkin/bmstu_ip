# frozen_string_literal: true

def calc(eps, ref = 1.618033989)
  q = 1.5
  q = 1 + 1 / q while (q - ref).abs >= eps
  q
end

class Seq
  include Enumerable
  def each
    q = 1.5
    loop do
      yield q
      q = 1 + 1 / q
    end
  end
end

def calc_enum(eps, ref = 1.618033989)
  Seq.new.find { |i| (i - ref).abs < eps }
end
