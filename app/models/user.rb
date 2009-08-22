class User < ActiveRecord::Base
	acts_as_authentic
	
	def admin?
	  role == 1
	end
	
	def active?
	  active
	end
	
	def activate!
     self.active = true
     save
   end
  
  def deliver_activation_instructions
    reset_perishable_token!
    Mailer.deliver_activation_instructions(self)
  end
  
  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end
	
	def validate_meetup(email, password)
	  #prepare for a shitty soltuion!!
	  require 'mechanize'

    agent = WWW::Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    page = agent.get("http://meetup.com/login/")
    form = page.forms.first
    form.field_with(:name => "email").value = email
    form.field_with(:name => "password").value = password
    results = agent.submit(form)    
    return nil if (results.uri.to_s == "http://meetup.com/login/")
    id = results.body.match(/"id":(\d+)/)
    if id.nil?
      return nil
    else
      return id[1]
    end
  end

end
