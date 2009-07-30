require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/resources/new.html.erb" do
  include ResourcesHelper

  before(:each) do
    assigns[:resource] = stub_model(Resource,
      :new_record? => true,
      :link => "value for link",
      :description => "value for description",
      :submitted_by => 1
    )
  end

  it "renders new resource form" do
    render

    response.should have_tag("form[action=?][method=post]", resources_path) do
      with_tag("input#resource_link[name=?]", "resource[link]")
      with_tag("textarea#resource_description[name=?]", "resource[description]")
      with_tag("input#resource_submitted_by[name=?]", "resource[submitted_by]")
    end
  end
end
