require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PresentationsController do
	before(:each) do
    @current_user = mock_model(User, {:id => 1})
		@current_user.stub!(:id).and_return(1)
    controller.stub!(:current_user).and_return(@current_user)
  end

  def mock_presentation(stubs={})
    @mock_presentation ||= mock_model(Presentation, stubs)
  end

  describe "GET index" do
    it "assigns all presentations as @presentations" do
      Presentation.stub!(:find).with(:all).and_return([mock_presentation])
      get :index
      assigns[:presentations].should == [mock_presentation]
    end
  end

  describe "GET show" do
    it "assigns the requested presentation as @presentation" do
      Presentation.stub!(:find).with("37").and_return(mock_presentation)
      get :show, :id => "37"
      assigns[:presentation].should equal(mock_presentation)
    end
  end

  describe "GET new" do
    it "assigns a new presentation as @presentation" do
      Presentation.stub!(:new).and_return(mock_presentation)
      get :new
      assigns[:presentation].should equal(mock_presentation)
    end
  end

  describe "GET edit" do
    it "assigns the requested presentation as @presentation" do
      Presentation.stub!(:find).with("37").and_return(mock_presentation)
      get :edit, :id => "37"
      assigns[:presentation].should equal(mock_presentation)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created presentation as @presentation" do
        Presentation.stub!(:new).with({'these' => 'params'}).and_return(mock_presentation(:save => true))
				mock_presentation.should_receive(:submitted_by=).with(1)
        post :create, :presentation => {:these => 'params'}
        assigns[:presentation].should equal(mock_presentation)
      end

      it "redirects to the created presentation" do
        Presentation.stub!(:new).and_return(mock_presentation(:save => true))
				mock_presentation.should_receive(:submitted_by=).with(1)
        post :create, :presentation => {}
        response.should redirect_to(presentations_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved presentation as @presentation" do
        Presentation.stub!(:new).with({'these' => 'params'}).and_return(mock_presentation(:save => false))
				mock_presentation.should_receive(:submitted_by=).with(1)
        post :create, :presentation => {:these => 'params'}
        assigns[:presentation].should equal(mock_presentation)
      end

      it "re-renders the 'new' template" do
        Presentation.stub!(:new).and_return(mock_presentation(:save => false))
				mock_presentation.should_receive(:submitted_by=).with(1)
        post :create, :presentation => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested presentation" do
        Presentation.should_receive(:find).with("37").and_return(mock_presentation)
        mock_presentation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :presentation => {:these => 'params'}
      end

      it "assigns the requested presentation as @presentation" do
        Presentation.stub!(:find).and_return(mock_presentation(:update_attributes => true))
        put :update, :id => "1"
        assigns[:presentation].should equal(mock_presentation)
      end

      it "redirects to the presentation" do
        Presentation.stub!(:find).and_return(mock_presentation(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(presentation_url(mock_presentation))
      end
    end

    describe "with invalid params" do
      it "updates the requested presentation" do
        Presentation.should_receive(:find).with("37").and_return(mock_presentation)
        mock_presentation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :presentation => {:these => 'params'}
      end

      it "assigns the presentation as @presentation" do
        Presentation.stub!(:find).and_return(mock_presentation(:update_attributes => false))
        put :update, :id => "1"
        assigns[:presentation].should equal(mock_presentation)
      end

      it "re-renders the 'edit' template" do
        Presentation.stub!(:find).and_return(mock_presentation(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested presentation" do
      Presentation.should_receive(:find).with("37").and_return(mock_presentation)
      mock_presentation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the presentations list" do
      Presentation.stub!(:find).and_return(mock_presentation(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(presentations_url)
    end
  end

end
