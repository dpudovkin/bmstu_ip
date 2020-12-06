# frozen_string_literal: true

# main controller: calculate result
class XmlController < ApplicationController
  before_action :parse_param, only: :index

  def input; end

  def dividers_sum_with_number(number)
    [number, 1.upto(number - 1).select { |v| (number % v).zero? }.sum]
  end

  # @param [Object] num
  # @return [Enumerator]
  def friends_number(num)
    mas = 1.upto(num).map { |i| dividers_sum_with_number(i) }
    mas.permutation(2).each_with_object([]) do |v, result|
      next unless (v[0][0] == v[1][1]) && (v[0][1] == v[1][0]) && (v[0][0] != v[1][0])

      pair = [v[0][0], v[1][0]]
      result << pair unless result.include?([v[1][0], v[0][0]])
    end
  end

  def index
    data = if @number.zero?
             { message: "Неверный параметр запроса (n = #{@number})" }
           else
             res = friends_number(@number)
             if res.length.zero?
               { message: "Дружественных числе в промежутке от 1 до n не сущесвует (n = #{@number})" }
             else
               res
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
