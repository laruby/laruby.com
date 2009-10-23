ActionMailer::Base.smtp_settings = {
    :tls => true,
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "laruby.com",
    :authentication => :plain,
    :user_name => ENV['EMAIL_USERNAME'],
    :password => ENV['EMAIL_PASSWORD'] 
  }
