require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/configurations/edit.html.erb" do
  include ConfigurationsHelper

  before(:each) do
    assigns[:configuration] = @configuration = stub_model(Configuration,
      :new_record? => false,
      :name => "value for name",
      :value => "value for value"
    )
  end

  it "renders the edit configuration form" do
    render

    response.should have_tag("form[action=#{configuration_path(@configuration)}][method=post]") do
      with_tag('input#configuration_name[name=?]', "configuration[name]")
      with_tag('input#configuration_value[name=?]', "configuration[value]")
    end
  end
end
