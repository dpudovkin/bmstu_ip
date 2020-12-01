# frozen_string_literal: true

class NumberController < ApplicationController
  def input; end

  def view
    n = params[:number].to_i
    @result = if n <= 0
                -1 # некорректный ввод
              else
                res = friends_number(n)
                if res.length.zero?
                  0 # дружественных чисел нет
                else
                  res # успешное выполнение
                end
              end

    respond_to do |format|
      format.html
      format.json do
        render json:
                   { type: @result.class.to_s, value: @result }
      end
    end
  end


  private

  def dividers_sum_with_number(number)
    [] << number << (1..(number - 1)).to_a.select { |v| (number % v).zero? }.sum
  end

  def friends_number(n)
    mas = []
    n.times { |i| mas << dividers_sum_with_number(i + 1) }
    result = []
    mas.permutation(2).to_a.each do |v|
      next unless (v[0][0] == v[1][1]) && (v[0][1] == v[1][0]) && (v[0][0] != v[1][0])

      pair = []
      pair << v[0][0] << v[1][0]
      result << pair unless result.include?([v[1][0], v[0][0]])
    end
    result
  end



end

def friend; end
