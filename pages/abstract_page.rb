# This is the parent page for all page objects, for operations across all pages, define here
class AbstractPage

  # If want to use utility methods such as fail_safe { }, uncomment the line below 
  # 
  #include RWebSpecUtils

  def initialize(driver, text = "")
    @browser = driver
    raise "Page text '#{text}' not found on #{self.class.name}" unless browser.page_source.include?(text)	
  end
  
  def browser
    @browser
  end
  
end
