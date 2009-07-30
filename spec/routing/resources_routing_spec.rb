require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ResourcesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "resources", :action => "index").should == "/resources"
    end

    it "maps #new" do
      route_for(:controller => "resources", :action => "new").should == "/resources/new"
    end

    it "maps #show" do
      route_for(:controller => "resources", :action => "show", :id => "1").should == "/resources/1"
    end

    it "maps #edit" do
      route_for(:controller => "resources", :action => "edit", :id => "1").should == "/resources/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "resources", :action => "create").should == {:path => "/resources", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "resources", :action => "update", :id => "1").should == {:path =>"/resources/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "resources", :action => "destroy", :id => "1").should == {:path =>"/resources/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/resources").should == {:controller => "resources", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/resources/new").should == {:controller => "resources", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/resources").should == {:controller => "resources", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/resources/1").should == {:controller => "resources", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/resources/1/edit").should == {:controller => "resources", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/resources/1").should == {:controller => "resources", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/resources/1").should == {:controller => "resources", :action => "destroy", :id => "1"}
    end
  end
end
