module MenuPage

=begin
  def menu_items
    @home = "/html/body/section/nav/ul/li/a/span"
    @demo1 = "/html/body/section/nav/ul/li[2]/a/span"
    @demo2 = "/html/body/section/nav/ul/li[3]/a/span"
    @config = "/html/body/section/nav/ul/li[4]/a/span"
    @logout = "/html/body/section/nav/ul/li[5]/a/span"
  end
=end
  def home_click
    home_click = browser.find_element(:xpath => '/html/body/section/nav/ul/li/a/span').click
  end

  def home
    home = browser.find_element(:xpath => '/html/body/section/nav/ul/li/a/span')
  end

  def demo1_click
    demo1_click = browser.find_element(:xpath => '/html/body/section/nav/ul/li[2]/a/span').click
  end

  def demo1
    demo1 = browser.find_element(:xpath => '/html/body/section/nav/ul/li[2]/a/span')
  end

  def demo2_click
    demo2_click = browser.find_element(:xpath => '/html/body/section/nav/ul/li[3]/a/span').click
  end

  def demo2
    demo2 = browser.find_element(:xpath => '/html/body/section/nav/ul/li[3]/a/span')
  end

  def config_click
    config_click = browser.find_element(:xpath => '/html/body/section/nav/ul/li[4]/a/span').click
  end

  def config
    config = browser.find_element(:xpath => '/html/body/section/nav/ul/li[4]/a/span')
  end

  def logout_click
    logout_click = browser.find_element(:xpath => '/html/body/section/nav/ul/li[5]/a/span').click
  end

  def logout
    logout = browser.find_element(:xpath => '/html/body/section/nav/ul/li[5]/a/span')
  end

end