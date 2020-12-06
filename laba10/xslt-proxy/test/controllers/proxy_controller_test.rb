# frozen_string_literal: true

require 'test_helper'


class ProxyControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get proxy_input_url
    assert_response :success
  end

  test 'should get output' do
    get proxy_output_url
    assert_response :success
  end

  test 'should get message about incorrect data' do
    get "#{proxy_output_url}?number=&side=server"
    out = 'Неверный параметр запроса (n = 0)'
    result = assigns[:hash]['hash']['message']
    assert_equal result, out
  end

  test 'should get message about there are no friendly numbers' do
    [10, 50, 100, 190].each do |n|
      get "#{proxy_output_url}?number=#{n}&side=server"
      out = "Дружественных числе в промежутке от 1 до n не сущесвует (n = #{n})"
      result = assigns[:hash]['hash']['message']
      assert_equal result, out
    end
  end

  test 'should get result' do
    n=1000
    get "#{proxy_output_url}?number=#{n}&side=server"
    out = [220,284]
    result = assigns[:hash]['arrays'][0].map(&:to_i)
    assert_equal result, out

    n = 3000
    get "#{proxy_output_url}?number=#{n}&side=server"
    out = [220,284,1184, 1210, 2620 ,2924]
    result = assigns[:hash]['arrays'].flatten.map(&:to_i)
    assert_equal result, out

  end

end
