require 'rspec'
require 'rspec-expectations'
require 'selenium-webdriver'
#require 'ruby_debug'

#https://www.relishapp.com/rspec/rspec-core/docs/upgrade

=begin
RSpec.configure do |c|
  c.filter_run :focus => true
  #c.run_all_when_everything_filtered = true
end
=end

#Disable expect syntax
=begin
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
  config.mock_with :rspec do |c|
    c.syntax = :should
  end
end
=end
#Explicitly enable both syntaxes
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
=begin
  config.before(:each) do
    # Create fixtures
    @driver = Selenium::WebDriver.for(:remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :firefox)
    @site_url = 'localhost'
    @base_url = "http://#{@site_url}:8080"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @accept_next_alert = true
    @domain = rand(1..999999999999)
    #@screen_shot = "screenshot-#{Time.now.strftime('%m%d%Y-%H%M%S')}.png"
    #puts @screen_shot
    @email1 = 'anwar'
    @email2 = '@'
    @email3 = "#{@domain}"
    @email4 = '.com'
    @email = @email1 + @email2 + @email3 + @email4
    @driver.get(@base_url + '/')
    sleep 2
  end

  config.after(:each) do
      @driver.quit
      @verification_errors.should == []
  end

end

=begin
RSpec.configure do |config|

    config.after(:each) do
    if example.exception != nil
    @driver.save_screenshot "screenshot/#{Time.now.strftime("failshot__%d_%m_%Y__%H_%M_%S")}.png"
    end
    @driver.quit
    @verification_errors.should == []
    end

=end