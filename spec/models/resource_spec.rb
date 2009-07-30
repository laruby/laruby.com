require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Resource do
  before(:each) do
    @valid_attributes = {
      :link => 'http://www.deadprogrammersociety.com',
      :description => "A blog with skynet controlled blimps",
      :submitted_by => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Resource.create!(@valid_attributes)
  end
  
  it "should require a link" do
	  @resource = Resource.new(@valid_attributes.except(:link))
		@resource.should have(1).errors_on(:link)
	end
end
