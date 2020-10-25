# frozen_string_literal: true

require_relative 'main'
print "input string count\n"
a = gets.to_i
result = []
a.times do |i|
  str = gets
  result.push("#{i + 1}. #{foo(str)}\n")
end

print "\n\n"
result.map do |str|
  print str
end


