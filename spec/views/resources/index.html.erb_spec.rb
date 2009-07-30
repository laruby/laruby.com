require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/resources/index.html.erb" do
  include ResourcesHelper

  before(:each) do
    assigns[:resources] = [
      stub_model(Resource,
        :link => "value for link",
        :description => "value for description",
        :submitted_by => 1
      ),
      stub_model(Resource,
        :link => "value for link",
        :description => "value for description",
        :submitted_by => 1
      )
    ]
  end

  it "renders a list of resources" do
    render
    response.should have_tag("tr>td", "value for link".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
