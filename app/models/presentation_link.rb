class PresentationLink < ActiveRecord::Base
  belongs_to :presentation
  
  validates_presence_of :link, :on => :create, :message => "can't be blank"
end
