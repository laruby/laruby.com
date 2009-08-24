class Mailer < ActionMailer::Base
  

  def activation_instructions(user)
    subject    'LARuby Account Activation'
    recipients user.email
    from       "LA Ruby #{LARUBY_EMAIL}"
    sent_on    Time.now   
    body       :account_activation_url => activate_url(user.perishable_token)
  end
  
  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "LA Ruby #{LARUBY_EMAIL}"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

end
