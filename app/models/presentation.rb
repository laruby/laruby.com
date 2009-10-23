class Presentation < ActiveRecord::Base
  belongs_to :submitter, :class_name => "User", :foreign_key => :submitted_by
  has_many :links, :class_name => 'PresentationLink'

  validates_length_of :subject, :in => 6..60

  named_scope :proposed, :conditions => {:presentation_date => nil}
  named_scope :upcoming, :conditions => ['presentation_date >= ?', Date.today]
  named_scope :past, :conditions => ['presentation_date < ?', Date.today]
end
