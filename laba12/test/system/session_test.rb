require 'application_system_test_case'


class SessionsTest < ApplicationSystemTestCase

  def before_setup
    super
    @email = 'a@mail.ru'
    @password = 'sleJ4Ksn3dm'
  end

  test 'should not login user with invalid credentials' do
    visit login_url

    fill_in 'Email', with: 'invalidmail'
    fill_in 'Password', with: @password
    click_on 'Login'
    assert_text 'Email or password is invalid'
    sleep 1
  end

  test 'should create new user, log in witt new credentials and calculate' do
    visit signup_url

    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    fill_in  'Password confirmation', with: @password
    click_on 'Create User'

    assert User.find_by_email(@email)
    sleep 2

    click_on 'Log in'
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_on 'Login'

    fill_in id: 'number', with: 1000
    click_on 'Рассчитать'
    assert_text 'Результат'

    sleep 1

  end

  test 'should no calculate without login' do
    visit logout_url

    visit number_input_url
    assert_no_current_path number_input_url
    assert_current_path login_path

    visit number_view_url
    assert_no_current_path number_view_url
    assert_current_path login_path
    sleep 1
  end









end
