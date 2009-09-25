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
	  @presentation = Presentation.new(@valid_attributes.except(:subject))
		@presentation.should have(1).errors_on(:subject)
	end
	
	describe "named scopes" do
	
	  before :each do
	    @proposed = Presentation.create(@valid_attributes)
	    @upcoming = Presentation.create(@valid_attributes.merge(:presentation_date => Date.tomorrow))
	    @past = Presentation.create(@valid_attributes.merge(:presentation_date => Date.yesterday))
    end
	
  	it "should find proposed presentations" do
  	  Presentation.proposed.should == [@proposed]
    end

  	it "should find upcoming presentations" do
  	  Presentation.upcoming.should == [@upcoming]	  
    end

  	it "should find past presentations" do
  	  Presentation.past.should == [@past]
    end

  end
end
