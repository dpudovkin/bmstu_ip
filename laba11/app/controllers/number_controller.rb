# frozen_string_literal: true

class NumberController < ApplicationController
  def input; end



  def view
    n = params[:number].to_i
    if (res = Number.find_by_num(n))
      @result = res.values
    else
      if n <= 0
        @result = -1 # некорректный ввод
      else
        res = friends_number(n)
        @result = if res.length.zero?
                    0 # дружественных чисел нет
                  else
                    res # успешное выполнение
                  end
      record = Number.create(num: n)
      record.values = @result
      record.save
      end
    end
    respond_to do |format|
      format.json { render json: JSON.generate(@result) }
    end
  end

  def cached_results
    result = Number.all.map { |el| { number: el.num, result: el.values } }
    respond_to do |format|
      format.xml { render xml: result.to_xml }
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
