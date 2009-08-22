require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/configurations/index.html.erb" do
  include ConfigurationsHelper

  before(:each) do
    assigns[:configurations] = [
      stub_model(Configuration,
        :name => "value for name",
        :value => "value for value"
      ),
      stub_model(Configuration,
        :name => "value for name",
        :value => "value for value"
      )
    ]
  end

  it "renders a list of configurations" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for value".to_s, 2)
  end
end
