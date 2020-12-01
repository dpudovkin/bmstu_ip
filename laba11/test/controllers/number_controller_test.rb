require 'test_helper'

class NumberControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get number_input_url
    assert_response :success
  end

  test "should get view" do
    get number_view_url
    assert_response :success
  end

  test 'correct data: should get array' do
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

  test 'incorrect data: should get -1' do
    get number_view_url, params: {number: 'hdryhdd'}
    assert_equal assigns[:result], -1
  end

  test 'no friends number: should get 0' do
    get number_view_url, params: {number:'50'}
    assert_equal assigns[:result], 0
  end

  test 'should cache result in db' do
    before = Number.count
    get number_view_url, params: { number: 998 }
    after = Number.count
    assert_equal before + 1, after
  end

  test 'should get equal results' do
    get number_view_url, params: { number: 5, format: 'json' }
    first = JSON.parse @response.body
    get number_view_url, params: { number: 100, format: 'json' }
    second = JSON.parse @response.body

    assert_equal first, second

    get number_view_url, params: { number: 400, format: 'json' }
    first = JSON.parse @response.body
    get number_view_url, params: { number: 600, format: 'json' }
    second = JSON.parse @response.body

    assert_equal first, second
  end


  test 'should get different results' do

    get number_view_url, params: { number: "sfsa", format: 'json' }
    first = JSON.parse @response.body
    get number_view_url, params: { number: 100, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second


    get number_view_url, params: { number: 1005, format: 'json' }
    first = JSON.parse @response.body
    get number_view_url, params: { number: 1500, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second

  end


end
