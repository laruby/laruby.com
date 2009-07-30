require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Presentation do
  before(:each) do
    @valid_attributes = {
      :subject => 'Sinatra'
    }
  end

  it "should create a new instance given valid attributes" do
    Presentation.create!(@valid_attributes)
  end
  
  it "should require a subject" do
	  @presentation = Presentation.new(@valid_attributes.except(:link))
		@presentation.should have(1).errors_on(:link)
	end
end
