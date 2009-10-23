begin
  LARUBY_EMAIL = Configuration.find_by_name("mail_user_name").value
  config_options = {
    :user_name => LARUBY_EMAIL,
    :password => Configuration.find_by_name("mail_password").value
  }
  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true,
  }.merge(config_options) # Configuration options override default options
rescue
  # bad rails no mail!!
end
