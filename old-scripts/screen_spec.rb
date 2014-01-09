require 'selenium-webdriver'
require 'rspec-expectations'
require 'rspec'


    def setup
    @driver = Selenium::WebDriver.for(:remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :chrome)
    @base_url = 'http://localhost:8080/'
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

def teardown
  @driver.quit
end

=begin describe 'Autotheme' do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://localhost:8080/'
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    #@screen_shot = rand(1..999999999999)
    #puts @screen_shot
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

 # rescue StandardError => error
=end
        def run
          setup

          teardown
        end

      run {

          #@base_url = 'http://localhost:8080/'
          it 'Login with valid user and password' do
            @driver.get 'http://www.google.com'
            @driver.find_element(:id, 'email').clear
            @driver.find_element(:id, 'email').send_keys ("xlajdhasljf@iejlsejf.com")
            @driver.find_element(:xpath, '/html/body/div/form/input[2]').clear
            @driver.find_element(:xpath, '/html/body/div/form/input[2]').send_keys 'xxxxxx'
            @driver.find_element(:id, 'loginButton').click
            @driver.title.should == 'Google'
            }
        end
