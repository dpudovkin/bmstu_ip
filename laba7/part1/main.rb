# frozen_string_literal: true

def generate_str(len)
  characters = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
  (1...len).map { characters[rand(characters.length - 1)] }.join('')
end

def foo(f, g, generate = true)
  rand(10).times { |_| f.write generate_str(rand(20)).concat("\n") } if generate
  f.seek(File::SEEK_SET)
  f.each { |line| g.write line.gsub(/[eErtU\n]/, '').reverse.concat("\n") }
end
