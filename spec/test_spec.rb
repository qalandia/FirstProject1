require_relative 'spec_helper'

  @bros = ["chrome", "firefox"]
# loop through browsers and execute the test on each of them
  @bros.each do |bro|

  describe "Test Script - #{bro}" do
    include TestHelper # module in test_helper.rb file
    include MenuPage # module in menu_page.rb file

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

    it "execute shell script" do
      system("dir")
    end

=begin
  it "Left Menu - Home Page menu items" do
    login("anwar", "@", "#{@url1}",".com", "passwordx")

    @browser.page_source.should include("/api/image/#{@url1}")

    @browser.find_element(:xpath, "#{@home}").should be_true
    @browser.find_element(:xpath, "#{@demo1}").should be_true
    @browser.find_element(:xpath, "#{@demo2}").should be_true
    @browser.find_element(:xpath, "#{@config}").should be_true
    @browser.find_element(:xpath, "#{@logout}").should be_true
  end

  it "Left Menu - Home Page menu items" do

    login("anwar", "@", "#{@url1}",".com", "passwordx")

    @browser.page_source.should include("/api/image/#{@url1}")

    @browser.find_element(:xpath, "#{@home}").should be_true
    @browser.find_element(:xpath, "#{@demo1}").should be_true
    @browser.find_element(:xpath, "#{@demo2}").should be_true
    @browser.find_element(:xpath, "#{@config}").should be_true
    @browser.find_element(:xpath, "#{@logout}").should be_true

  end
=end
  end

end