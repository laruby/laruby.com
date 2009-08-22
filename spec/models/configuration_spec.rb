require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Configuration do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :value => "value for value"
    }
  end

  it "should create a new instance given valid attributes" do
    Configuration.create!(@valid_attributes)
  end
end
