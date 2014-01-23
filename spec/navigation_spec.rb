require_relative 'spec_helper'

@bros = ["chrome", "firefox"]
# loop through browsers and execute the test on each of them
@bros.each do |bro|

  describe "Navigation - #{bro}" do
    include TestHelper # module in test_helper.rb file
    include MenuPage # module in menu_page.rb file
    include LoginPage # module in login_page.rb file

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

    it "Left Menu - Home Page - menu items" do

      login("anwar", "@", "#{@url1}", ".com", "passwordx")

      @browser.page_source.should include("/api/image/#{@url1}")
      home.should be_true
      demo1.should be_true
      demo2.should be_true
      config.should be_true
      logout.should be_true
    end

    it "Left Menu - Demo1 Page - menu items" do

      login("anwar", "@", "#{@url1}", ".com", "passwordx")

      @browser.page_source.should include("/api/image/#{@url1}")

      demo1_click
      home.should be_true
      demo1.should be_true
      demo2.should be_true
      config.should be_true
      logout.should be_true
    end

    it "Left Menu - Demo2 Page - menu items" do

      login("anwar", "@", "#{@url1}", ".com", "passwordx")

      @browser.page_source.should include("/api/image/#{@url1}")
      demo2_click
      home.should be_true
      demo1.should be_true
      demo2.should be_true
      config.should be_true
      logout.should be_true

    end

    it "Left Menu - Config Page - menu items" do

      login("anwar", "@", "#{@url1}", ".com", "passwordx")

      @browser.page_source.should include("/api/image/#{@url1}")
      config_click
      home.should be_true
      demo1.should be_true
      demo2.should be_true
      config.should be_true
      logout.should be_true

    end

    it "Left Menu - Login / Logout page" do

      login("anwar", "@", "#{@url1}", ".com", "passwordx")

      @browser.page_source.should include("/api/image/#{@url1}")
      logout_click
      @browser.find_element(:css, "img.header-image").should be_true
      #page_text is defined in spec_helper(TestHelper) module
      @browser.find_element(:css, "h2.form-signin-heading").text.should == "Please sign in"
      page_text.should include("Please sign in")
      email.should be_true
      @browser.find_element(:xpath, "//input[@type='password']").should be_true
      @browser.find_element(:css, "input[type=\"checkbox\"]").should be_true
      login_button.should be_true

    end

  end
end