# frozen_string_literal: true

def differ(x1, h, &fun)
  x2 = x1 + h
  x3 = x1 + 2 * h
  dy1 = (-3 * fun.call(x1) + 4 * fun.call(x2) - fun.call(x3)) / (2 * h)
  dy2 = (-fun.call(x1) + fun.call(x3)) / (2 * h)
  dy3 = (fun.call(x1) - 4 * fun.call(x2) + 3 * fun.call(x3)) / (2 * h)
  [] << dy1 << dy2 << dy3
end
