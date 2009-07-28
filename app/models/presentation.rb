class Presentation < ActiveRecord::Base
  belongs_to :submitter, :class_name => "User", :foreign_key => :submitted_by 
  
  validates_presence_of :subject, :on => :create, :message => "can't be blank"
  
end
