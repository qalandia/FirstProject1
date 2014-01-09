require 'rubygems'
require 'json'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-expectations'
require_relative '../pages/abstract_page'
require_relative '../pages/menu_page'

#Explicitly enable both syntaxes
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end


# The default base URL for running from command line or continuous build process
$BASE_URL = "http://localhost:8080"

# This is the helper for your tests, every test file will include all the operation
# defined here.
module TestHelper

  def browser
    @browser
  end

  def driver
    @browser
  end

  def	page_text
    @browser.find_element(:tag_name => "body").text
  end

  def assert_link_present_with_text(link_text)
    the_link = @browser.find_element(:link, link_text)
    raise ("can't find the link containing text: #{link_text}") unless the_link
  end

  def login(user1, user2, user3, user4, password)
    @browser.find_element(:id, 'email').send_keys (user1 + user2 + user3 + user4)
    @browser.find_element(:xpath, '/html/body/div/form/input[2]').send_keys password
    @browser.find_element(:id, 'loginButton').click
  end

end


