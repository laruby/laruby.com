require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/configurations/show" do
  include ConfigurationsHelper
  before(:each) do
    assigns[:configuration] = @configuration = stub_model(Configuration,
      :name => "value for name",
      :value => "value for value"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ value/)
  end
end
