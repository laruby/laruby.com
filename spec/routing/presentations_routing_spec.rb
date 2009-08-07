require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PresentationsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "presentations", :action => "index").should == "/presentations"
    end

    it "maps #new" do
      route_for(:controller => "presentations", :action => "new").should == "/presentations/new"
    end

    it "maps #show" do
      route_for(:controller => "presentations", :action => "show", :id => "1").should == "/presentations/1"
    end

    it "maps #edit" do
      route_for(:controller => "presentations", :action => "edit", :id => "1").should == "/presentations/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "presentations", :action => "create").should == {:path => "/presentations", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "presentations", :action => "update", :id => "1").should == {:path =>"/presentations/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "presentations", :action => "destroy", :id => "1").should == {:path =>"/presentations/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/presentations").should == {:controller => "presentations", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/presentations/new").should == {:controller => "presentations", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/presentations").should == {:controller => "presentations", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/presentations/1").should == {:controller => "presentations", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/presentations/1/edit").should == {:controller => "presentations", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/presentations/1").should == {:controller => "presentations", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/presentations/1").should == {:controller => "presentations", :action => "destroy", :id => "1"}
    end
  end
end
