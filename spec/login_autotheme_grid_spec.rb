require_relative 'spec_helper'

@bros = ["chrome", "firefox"]
# loop through browsers and execute the test on each of them
@bros.each do |bro|

describe "User Authentication - #{bro}" do
  include TestHelper # module in test_helper.rb file
  include MenuPage # module in menu_page.rb file
  include LoginPage

  before(:all) do
    #@browser = Selenium::WebDriver.for(browser_type)
    @browser = $browser = Selenium::WebDriver.for(:remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :"#{bro}")
    @site_url = 'localhost'
    @base_url = "http://#{@site_url}:8080"
    @url1 = rand(1..999999)
    puts @url1
    @browser.manage.timeouts.implicit_wait = 10
    @verification_errors = []
    @accept_next_alert = true
    #menu_items #method in menu_page.rb file
  end

  before(:each) do
    @browser.get(@base_url + '/')
  end

  after(:all) do
    @browser.quit
  end

  def login(user1, user2, user3, user4, password_text)
    email.send_keys (user1 + user2 + user3 + user4)
    password.send_keys password_text
    login_button_click
  end

  it 'Login with valid user and password' do

    login("anwar", "@", "#{@url1}", ".com", "passwordx")

    @browser.title.should == 'App'
    @browser.current_url.should == "http://#{@site_url}:8080/#{@url1}#/page:Home"
    @browser.current_url.should match(/#{@url1}/)
    @browser.current_url.should include("#{@url1}")
    @browser.current_url.should include("#/page:Home")
    @browser.current_url.should_not include("xyz")
    puts "\ncurrent URL => #{@browser.current_url}"
    @browser.save_screenshot ("screenshot/#{@url1}.png")
  end

  it 'Login with invalid user and invalid password' do
    login("anwarxyz", "@", "#{@url1}", ".com", "passwordxyz")
    @browser.title.should_not == 'App'
  end

  it 'Login with valid user and invalid password' do
    login("anwarxyz", "@", "#{@url1}", ".com", "xyz")
    @browser.title.should_not == 'App'
  end

end
end