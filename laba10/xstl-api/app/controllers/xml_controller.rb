# frozen_string_literal: true

class XmlController < ApplicationController
  before_action :parse_param, only: :index

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

  def index
    data = if @number.zero?
             { message: "Неверный параметр запроса (n = #{@number})" }
           else
             res = friends_number(@number)
             if res.length.zero?
               { message: "Дружественных числе в промежутке от 1 до n не сущесвует (n = #{@number})" }
             else
               res # успешное выполнение
             end
           end

    respond_to do |format|
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end

  protected

  def parse_param
    @number = params[:number].to_i
  end
end
