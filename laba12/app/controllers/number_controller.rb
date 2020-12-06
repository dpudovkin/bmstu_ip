# frozen_string_literal: true

# controller for calculate result
class NumberController < ApplicationController

  def input; end

  def dividers_sum_with_number(number)
    [number, 1.upto(number - 1).select { |v| (number % v).zero? }.sum]
  end

  # @param [Object] num
  def friends_number(num)
    mas = 1.upto(num).map { |i| dividers_sum_with_number(i) }
    mas.permutation(2).each_with_object([]) do |v, result|
      next unless (v[0][0] == v[1][1]) && (v[0][1] == v[1][0]) && (v[0][0] != v[1][0])

      pair = [v[0][0], v[1][0]]
      result << pair unless result.include?([v[1][0], v[0][0]])
    end
  end

  # @return [Integer, Enumerator]
  def view
    n = params[:number].to_i
    @result = if n.zero?
                -1 # incorrect input
              else
                res = friends_number(n)
                if res.length.zero?
                  0 # no friends numbers
                else
                  res # correct data: successful complete
                end
              end
  end


end
