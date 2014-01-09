require_relative 'spec_helper'

describe 'Auto_Theme' do

  it 'Login with valid user and password'  do
    @driver.find_element(:id, 'email').clear
    @driver.find_element(:id, 'email').send_keys ("#{@email}")
    @driver.find_element(:xpath, '/html/body/div/form/input[2]').clear
    @driver.find_element(:xpath, '/html/body/div/form/input[2]').send_keys 'xxxxxx'
    @driver.find_element(:id, 'loginButton').click
    @driver.title.should == 'App'
    expect(@driver.title.include?('App')).to be_truthy
  end

  it 'Login with invalid user and password'  do
    @driver.find_element(:id, 'email').clear
    sleep 2
    @driver.find_element(:id, 'email').send_keys ("#{@email}")
    @driver.find_element(:xpath, '/html/body/div/form/input[2]').clear
    @driver.find_element(:xpath, '/html/body/div/form/input[2]').send_keys 'xxxxxxwww'
    @driver.find_element(:id, 'loginButton').click
    @driver.title.should == 'App'
    expect(@driver.title.include?('App')).to be_falsey
  end

end