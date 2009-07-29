class Presentation < ActiveRecord::Base
  belongs_to :submitter, :class_name => "User", :foreign_key => :submitted_by
  has_many :links, :class_name => 'PresentationLink' 
  
  validates_presence_of :subject, :on => :create, :message => "can't be blank"
  
end
