# frozen_string_literal: true

require_relative 'main.rb'

d = Sym.new('d')
d.print
print "\nClass Sym\n"
print "Value - #{d.value}\n"
s = FontSym.new('s', 'Roboto')
s.print
print "\nClass FontSym\n"
print "Value - #{s.value}\n"
print "Code - #{s.code}\n"
print "Font - #{s.font}\n"
