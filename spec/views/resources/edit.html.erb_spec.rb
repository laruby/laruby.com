require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/resources/edit.html.erb" do
  include ResourcesHelper

  before(:each) do
    assigns[:resource] = @resource = stub_model(Resource,
      :new_record? => false,
      :link => "value for link",
      :description => "value for description",
      :submitted_by => 1
    )
  end

  it "renders the edit resource form" do
    render

    response.should have_tag("form[action=#{resource_path(@resource)}][method=post]") do
      with_tag('input#resource_link[name=?]', "resource[link]")
      with_tag('textarea#resource_description[name=?]', "resource[description]")
      with_tag('input#resource_submitted_by[name=?]', "resource[submitted_by]")
    end
  end
end
