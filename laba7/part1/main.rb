# frozen_string_literal: true

def generate_str(len)
  characters = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
  (1...len).map { characters[rand(characters.length - 1)] }.join('')
end

def foo(file_f, file_g, generate = true)
  rand(2..11).times { |_| file_f.write generate_str(rand(20)).concat("\n") } if generate
  file_f.seek(File::SEEK_SET)
  file_f.reverse_each { |line| file_g.write line.gsub(/[eErtU\n]/, '').concat("\n") }
end
