module PopupHandlerHelper

  $PopupHandlerURL = "http://localhost:8080"

  def handle_popup(category, options = {}, &block) 
    return if category.nil?
    
    nid = nil
    case category.to_s
    when "basic_auth"
      username = URI.escape(options[:username] || options[:login])
      password = URI.escape(options[:password])
      nid = notify_popup_handler("/basic_authentication/#{username}:#{password}")
    when "file_upload"
      require 'uri'
      file_path = options[:file_path]
      escaped_file_path = URI.escape(file_path)
      nid = notify_popup_handler("/fileupload/#{escaped_file_path}") 
    when "file_download"
      require 'uri'
      file_path = options[:file_path]
      escaped_file_path = URI.escape(file_path)
      nid = notify_popup_handler("/filedownload/#{escaped_file_path}") 
    when "security"
      nid = notify_popup_handler("/security")
    when "popup", "javascript"
      nid = notify_popup_handler("/popup")   
    end
      
    # invoking 
    yield
      
    notify_popup_handler_cancel(nid) if nid
  end

  def notify_popup_handler(url, in_thread = false)
    require 'httpclient'
    begin
      res = HTTPClient.new.get("#{$PopupHandlerURL}#{url}").body
      res = res.content if res.respond_to?("content")
    rescue => e
      puts "[Error] failed to notify the execution monitor: #{e}"
      return nil
    end
  end

  def notify_popup_handler_before_basic_auth(username, password)
    require 'uri'
    username = URI.escape(username)
    password = URI.escape(password)
    notify_popup_handler("/basic_authentication/#{username}:#{password}")
  end

  def notify_popup_handler_before_cancel_basic_auth
    require 'uri'
    notify_popup_handler("/basic_authentication/")
  end

  def notify_popup_handler_before_file_upload(file_path)
    require 'uri'
    escaped_file_path = URI.escape(file_path)
    notify_popup_handler("/fileupload/#{escaped_file_path}")
  end

  def notify_popup_handler_before_security_alerts()
    notify_popup_handler("/security")
  end

  def notify_popup_handler_before_popup()
    notify_popup_handler("/popup")
  end

  def notify_popup_handler_cancel(id = nil)
    notify_popup_handler("/cancel/#{id}")
  end

end