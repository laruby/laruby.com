require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ConfigurationsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "configurations", :action => "index").should == "/configurations"
    end

    it "maps #new" do
      route_for(:controller => "configurations", :action => "new").should == "/configurations/new"
    end

    it "maps #show" do
      route_for(:controller => "configurations", :action => "show", :id => "1").should == "/configurations/1"
    end

    it "maps #edit" do
      route_for(:controller => "configurations", :action => "edit", :id => "1").should == "/configurations/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "configurations", :action => "create").should == {:path => "/configurations", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "configurations", :action => "update", :id => "1").should == {:path =>"/configurations/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "configurations", :action => "destroy", :id => "1").should == {:path =>"/configurations/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/configurations").should == {:controller => "configurations", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/configurations/new").should == {:controller => "configurations", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/configurations").should == {:controller => "configurations", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/configurations/1").should == {:controller => "configurations", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/configurations/1/edit").should == {:controller => "configurations", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/configurations/1").should == {:controller => "configurations", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/configurations/1").should == {:controller => "configurations", :action => "destroy", :id => "1"}
    end
  end
end
