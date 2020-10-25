# frozen_string_literal: true

def foo(str)
  arr = str.split(' ')
  arr.count.times { |i| arr[i - 1], arr[i] = arr[i], arr[i - 1] if i.odd? && (i < arr.count) }
  arr.join(' ')
end
