require_relative 'spec_helper'

describe "User Authentication" do
  include TestHelper # module in test_helper.rb file
  include MenuPage # module in menu_page.rb file

  before(:all) do
    #@browser = Selenium::WebDriver.for(browser_type)
    @browser = $browser = Selenium::WebDriver.for(:remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :chrome)
    @site_url = 'localhost'
    @base_url = "http://#{@site_url}:8080"
    @url1 = rand(1..999999)
    puts @url1
    @browser.manage.timeouts.implicit_wait = 10
    @verification_errors = []
    @accept_next_alert = true
    menu_items #method in menu_page.rb file
  end

  before(:each) do
    @browser.get(@base_url + '/')
  end

  after(:all) do
    @browser.quit
  end

  def login(user1, user2, user3, user4, password)
    @browser.find_element(:id, 'email').send_keys (user1 + user2 + user3 + user4)
    @browser.find_element(:xpath, '/html/body/div/form/input[2]').send_keys password
    @browser.find_element(:id, 'loginButton').click
  end

  it "Left Menu - Home Page - menu items" do
    login("anwar", "@", "#{@url1}",".com", "passwordx")

    @browser.page_source.should include("/api/image/#{@url1}")

    @browser.find_element(:xpath, "#{@home}").should be_true
    @browser.find_element(:xpath, "#{@demo1}").should be_true
    @browser.find_element(:xpath, "#{@demo2}").should be_true
    @browser.find_element(:xpath, "#{@config}").should be_true
    @browser.find_element(:xpath, "#{@logout}").should be_true
  end

  it "Left Menu - Demo1 Page - menu items" do

    login("anwar", "@", "#{@url1}",".com", "passwordx")

    @browser.page_source.should include("/api/image/#{@url1}")
    @browser.find_element(:xpath, "#{@demo1}").click
    @browser.find_element(:xpath, "#{@home}").should be_true
    @browser.find_element(:xpath, "#{@demo1}").should be_true
    @browser.find_element(:xpath, "#{@demo2}").should be_true
    @browser.find_element(:xpath, "#{@config}").should be_true
    @browser.find_element(:xpath, "#{@logout}").should be_true

  end

  it "Left Menu - Demo2 Page - menu items" do

    login("anwar", "@", "#{@url1}",".com", "passwordx")

    @browser.page_source.should include("/api/image/#{@url1}")
    @browser.find_element(:xpath, "#{@demo2}").click
    @browser.find_element(:xpath, "#{@home}").should be_true
    @browser.find_element(:xpath, "#{@demo1}").should be_true
    @browser.find_element(:xpath, "#{@demo2}").should be_true
    @browser.find_element(:xpath, "#{@config}").should be_true
    @browser.find_element(:xpath, "#{@logout}").should be_true

  end

  it "Left Menu - Config Page - menu items" do

    login("anwar", "@", "#{@url1}",".com", "passwordx")

    @browser.page_source.should include("/api/image/#{@url1}")
    @browser.find_element(:xpath, "#{@config}").click
    @browser.find_element(:xpath, "#{@home}").should be_true
    @browser.find_element(:xpath, "#{@demo1}").should be_true
    @browser.find_element(:xpath, "#{@demo2}").should be_true
    @browser.find_element(:xpath, "#{@config}").should be_true
    @browser.find_element(:xpath, "#{@logout}").should be_true

  end

  it "Left Menu - Login / Logout page" do

    login("anwar", "@", "#{@url1}",".com", "passwordx")

    @browser.page_source.should include("/api/image/#{@url1}")
    @browser.find_element(:xpath, "#{@logout}").click
    @browser.find_element(:css, "img.header-image").should be_true
    @browser.find_element(:css, "h2.form-signin-heading").text.should == "Please sign in"
    @browser.find_element(:id, "email").should be_true
    @browser.find_element(:xpath, "//input[@type='password']").should be_true
    @browser.find_element(:css, "input[type=\"checkbox\"]").should be_true
    @browser.find_element(:id, "loginButton").should be_true

  end

  end