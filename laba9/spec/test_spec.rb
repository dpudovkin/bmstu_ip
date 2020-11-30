# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'test' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'no number' do
    @driver.get('http://localhost:3000/number/input')
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('100')
    @driver.find_element(:id, 'number').send_keys(:enter)
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:id, 'result').text == "Дружественных чисел нет" }
    @driver.find_element(:css, 'html').click
    expect(@driver.find_element(:id, 'result').text).to eq('Дружественных чисел нет')
    sleep 1
  end
  it 'incorrect data' do
    @driver.get('http://localhost:3000/number/input')
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('sflhb')
    @driver.find_element(:id, 'number').send_keys(:enter)
    @driver.find_element(:css, 'html').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:id, 'result').text == "Некорректные данные" }
    sleep 1
  end

  it 'for n=1000' do
    @driver.get('http://localhost:3000/number/input')
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('1000')
    @driver.find_element(:id, 'number_form').click
    @driver.find_element(:name, 'commit').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, 'caption').text == "Результат" }
    expect(@driver.find_element(:css, 'td:nth-child(1)').text).to eq('220')
    expect(@driver.find_element(:css, 'td:nth-child(2)').text).to eq('284')
    sleep 1
  end

  it 'for n=3000' do
    @driver.get('http://localhost:3000/number/input')
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('3000')
    @driver.find_element(:id, 'number').send_keys(:enter)
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, 'caption').text == "Результат" }
    expect(@driver.find_element(:css, 'tr:nth-child(3) > td:nth-child(1)').text).to eq('2620')
    expect(@driver.find_element(:css, 'tr:nth-child(3) > td:nth-child(2)').text).to eq('2924')
    expect(@driver.find_element(:css, 'tr:nth-child(2) > td:nth-child(2)').text).to eq('1210')
    expect(@driver.find_element(:css, 'tr:nth-child(2) > td:nth-child(1)').text).to eq('1184')
    sleep 1
  end
end