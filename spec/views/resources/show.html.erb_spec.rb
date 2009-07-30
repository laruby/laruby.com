require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/resources/show.html.erb" do
  include ResourcesHelper
  before(:each) do
    assigns[:resource] = @resource = stub_model(Resource,
      :link => "value for link",
      :description => "value for description",
      :submitted_by => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ link/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1/)
  end
end
