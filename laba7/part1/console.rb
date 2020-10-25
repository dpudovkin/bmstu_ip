# frozen_string_literal: true

require_relative 'main.rb'
f = File.open('f.txt', 'w+')
g = File.open('g.txt', 'w+')
foo(f, g)
print "\nFile f:\n"
f.seek(File::SEEK_SET)
f.each { |line| print line }
print "\nFile g:\n"
g.seek(File::SEEK_SET)
g.each { |line| print line }
f.close
g.close
