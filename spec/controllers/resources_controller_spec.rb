require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ResourcesController do
  before(:each) do
    @current_user = mock_model(User, {:id => 1})
    @current_user.stub!(:id).and_return(1)
  end
    
  def mock_resource(stubs={})
    @mock_resource ||= mock_model(Resource, stubs)
  end

  
  describe "GET index" do
    it "assigns all resources as @resources" do
      Resource.stub!(:find).with(:all).and_return([mock_resource])
      get :index
      assigns[:resources].should == [mock_resource]
    end
  end

  describe "GET show" do
    it "assigns the requested resource as @resource" do
      Resource.stub!(:find).with("37").and_return(mock_resource)
      get :show, :id => "37"
      assigns[:resource].should equal(mock_resource)
    end
  end

  describe "GET new" do
    it "assigns a new resource as @resource" do
      Resource.stub!(:new).and_return(mock_resource)
      get :new
      assigns[:resource].should equal(mock_resource)
    end
  end

  describe "GET edit" do
    it "assigns the requested resource as @resource" do
      Resource.stub!(:find).with("37").and_return(mock_resource)
      get :edit, :id => "37"
      assigns[:resource].should equal(mock_resource)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created resource as @resource" do
        Resource.stub!(:new).with({'these' => 'params'}).and_return(mock_resource(:save => true))
        @mock_resource.stub!(:created_by).with(1)
        post :create, :resource => {:these => 'params'}
        assigns[:resource].should equal(mock_resource)
      end

      it "redirects to the created resource" do
        Resource.stub!(:new).and_return(mock_resource(:save => true))
        @mock_resource.stub!(:created_by).with(1)
        post :create, :resource => {}
        response.should redirect_to(resource_url(mock_resource))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved resource as @resource" do
        Resource.stub!(:new).with({'these' => 'params'}).and_return(mock_resource(:save => false))
        @mock_resource.stub!(:created_by).with(1)
        post :create, :resource => {:these => 'params'}
        assigns[:resource].should equal(mock_resource)
      end

      it "re-renders the 'new' template" do
        Resource.stub!(:new).and_return(mock_resource(:save => false))
        @mock_resource.stub!(:created_by).with(1)
        post :create, :resource => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested resource" do
        Resource.should_receive(:find).with("37").and_return(mock_resource)
        mock_resource.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :resource => {:these => 'params'}
      end

      it "assigns the requested resource as @resource" do
        Resource.stub!(:find).and_return(mock_resource(:update_attributes => true))
        put :update, :id => "1"
        assigns[:resource].should equal(mock_resource)
      end

      it "redirects to the resource" do
        Resource.stub!(:find).and_return(mock_resource(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(resource_url(mock_resource))
      end
    end

    describe "with invalid params" do
      it "updates the requested resource" do
        Resource.should_receive(:find).with("37").and_return(mock_resource)
        mock_resource.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :resource => {:these => 'params'}
      end

      it "assigns the resource as @resource" do
        Resource.stub!(:find).and_return(mock_resource(:update_attributes => false))
        put :update, :id => "1"
        assigns[:resource].should equal(mock_resource)
      end

      it "re-renders the 'edit' template" do
        Resource.stub!(:find).and_return(mock_resource(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested resource" do
      Resource.should_receive(:find).with("37").and_return(mock_resource)
      mock_resource.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the resources list" do
      Resource.stub!(:find).and_return(mock_resource(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(resources_url)
    end
  end

end
