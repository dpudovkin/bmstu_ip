# frozen_string_literal: true

require 'test_helper'

class NumberTest < ActiveSupport::TestCase
  def before_setup
    super
    @result = [[220, 284]]
  end

  test 'should set and get values' do
    instance = Number.new
    instance.values = @result
    assert_equal instance.values, @result
  end

  test 'should generate json' do
    instance = Number.new
    instance.values = @result
    assert_equal instance.result, JSON.generate(@result.as_json)
  end

  test 'should save data into db' do
    instance = Number.new(num: 1001)
    instance.values = @result
    assert instance.save
    instance.delete
  end

  test 'should get error on non unique num' do
    instance = Number.new(num: 1000)
    instance.values = @result
    instance.validate
    assert_equal instance.errors[:num], ['has already been taken']
  end

  test 'should get error on non integer num' do
    instance = Number.new(num: 1000.5)
    instance.values = @result
    instance.validate
    assert_equal instance.errors[:num], ['must be an integer']
  end

  test 'should get error on non positive num' do
    instance = Number.new(num: -4)
    instance.values = @result
    instance.validate
    assert_equal instance.errors[:num], ['must be greater than 0']
  end

  test 'should get error on nil values' do
    instance = Number.new(num: 100)
    instance.validate
    assert_equal instance.errors[:result], ["can't be blank"]
  end

  test 'should get data from db' do
    instance = Number.new(num: 1001)
    instance.values = @result
    assert instance.save
    assert_equal Number.find_by(num: 1001).values, @result
  end


end
