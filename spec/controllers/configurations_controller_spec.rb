require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ConfigurationsController do

  before(:each) do
    controller.stub!(:require_user)
    controller.stub!(:require_admin)
  end

  def mock_configuration(stubs={})
    @configuration ||= mock_model(Configuration, stubs)
  end

  describe "GET index" do
    it "assigns all configurations as @configurations" do
      Configuration.should_receive(:find).with(:all).and_return(:configurations)
      get :index
      assigns[:configurations].should == :configurations
    end
  end

  describe "GET show" do
    it "assigns the requested configuration as @configuration" do
      Configuration.stub!(:find).with("37").and_return(mock_configuration)
      get :show, :id => "37"
      assigns[:configuration].should == mock_configuration
    end
  end

  describe "GET new" do
    it "assigns a new configuration as @configuration" do
      Configuration.stub!(:new).and_return(mock_configuration)
      get :new
      assigns[:configuration].should == mock_configuration
    end
  end

  describe "GET edit" do
    it "assigns the requested configuration as @configuration" do
      Configuration.stub!(:find).with("37").and_return(mock_configuration)
      get :edit, :id => "37"
      assigns[:configuration].should == mock_configuration
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created configuration as @configuration" do
        Configuration.stub!(:new).with({'these' => 'params'}).and_return(mock_configuration(:save => true))
        post :create, :configuration => {:these => 'params'}
        assigns[:configuration].should == mock_configuration
      end

      it "redirects to the created configuration" do
        Configuration.stub!(:new).and_return(mock_configuration(:save => true))
        post :create, :configuration => {}
        response.should redirect_to(configuration_url(mock_configuration))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved configuration as @configuration" do
        Configuration.stub!(:new).with({'these' => 'params'}).and_return(mock_configuration(:save => false))
        post :create, :configuration => {:these => 'params'}
        assigns[:configuration].should == mock_configuration
      end

      it "re-renders the 'new' template" do
        Configuration.stub!(:new).and_return(mock_configuration(:save => false))
        post :create, :configuration => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested configuration" do
        Configuration.should_receive(:find).with("37").and_return(mock_configuration)
        mock_configuration.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :configuration => {:these => 'params'}
      end

      it "assigns the requested configuration as @configuration" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => true))
        put :update, :id => "1"
        assigns[:configuration].should == mock_configuration
      end

      it "redirects to the configuration" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(configuration_url(mock_configuration))
      end
    end

    describe "with invalid params" do
      it "updates the requested configuration" do
        Configuration.should_receive(:find).with("37").and_return(mock_configuration)
        mock_configuration.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :configuration => {:these => 'params'}
      end

      it "assigns the configuration as @configuration" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => false))
        put :update, :id => "1"
        assigns[:configuration].should == mock_configuration
      end

      it "re-renders the 'edit' template" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested configuration" do
      Configuration.should_receive(:find).with("37").and_return(mock_configuration)
      mock_configuration.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the configurations list" do
      Configuration.stub!(:find).and_return(mock_configuration(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(configurations_url)
    end
  end

end
