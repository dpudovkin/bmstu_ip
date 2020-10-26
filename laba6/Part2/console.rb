# frozen_string_literal: true

require_relative 'main'

fun1 = ->(x) { Math.sin(x) }
# fun2 = ->(x) { Math.tan(x + 1)}

x1 = 0.49
h = 0.01

printf "\nResult for fun1 with lambda:\n"
differ(x1, h, &fun1).each_with_index { |val, index| printf "dy#{index + 1} = #{val}\n" }

printf "\nResult for fun2 with block:\n"
res = differ(x1, h) { |x| Math.tan(x + 1) }
res.each_with_index { |val, index| printf "dy#{index + 1} = #{val}\n" }
