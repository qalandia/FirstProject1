module LoginPage

  def email
    email = browser.find_element(:id => 'email')
  end

  def password
    password = browser.find_element(:xpath => '/html/body/div/form/input[2]')
  end

  def login_button
    login_button = browser.find_element(:css => "h2.form-signin-heading")
  end

  def login_button_click
    login_button_click = browser.find_element(:css => "h2.form-signin-heading").click
  end

end