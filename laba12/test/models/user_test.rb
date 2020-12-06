require 'test_helper'

class UserTest < ActiveSupport::TestCase


  def before_setup
    super
    @email = 'a@mail.ru'
    @password = 'sleJ4Ksn3dm'
  end

  test 'should set and get values' do
    instance = User.new
    instance.email = @email
    assert_equal instance.email, @email
  end

  test 'should save data into db' do
    instance = User.new
    instance.email = @email
    instance.password_digest = @password
    assert instance.save
    instance.delete
  end

  test 'should get error on nil password' do
    instance = User.new(email: @email)
    instance.validate
    assert_equal instance.errors[:password], ["can't be blank"]
  end

  test 'should get error on non unique email' do
    instance = User.new(email: 'test1@mail.ru')
    instance.validate
    assert_equal instance.errors[:email], ['has already been taken']
  end

end
