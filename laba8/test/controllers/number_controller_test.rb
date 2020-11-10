# frozen_string_literal: true

require 'test_helper'

class NumberControllerTest < ActionDispatch::IntegrationTest

  test 'should get input' do
    get number_input_url
    assert_response :success
  end

  test 'should get view' do
    get number_view_url
    assert_response :success
  end

  test 'first functional test' do
    get number_view_url, params: {number: '300'}
    assert_res = true
    mas = [[220, 284]]
    res = assigns[:result]
    if res.length != mas.length
      assert_res
    else
      mas.each do |v1|
        v2 = [v1[1], v1[0]]
        assert_res = false unless res.include?(v1) || res.include?(v2)
      end
    end
    assert assert_res
  end

  test 'second functional test' do
    get number_view_url, params: {number: 'hdryhdd'}
    assert_equal assigns[:result], -1
  end

  test 'third functional test' do
    get number_view_url, params: {number:'50'}
    assert_equal assigns[:result], 0
  end
end
