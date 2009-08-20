require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PagesController do
  describe "GET show" do
    it "show should render whatever action is passed to it" do
      get :about
      response.should render_template('about')
    end
  end
  
  describe "GET events" do
    it "should render events view" do
      get :events, :past => 'past'
      assigns[:upcoming].should == false
      response.should render_template('events')
    end
  end
  
  describe 'Event Map' do
    it 'should redirect if no event_id is given' do
      get :map
      response.should redirect_to(root_path)
    end
    
    it 'should calculate lat long values' do
      MeetupApi::Client.stub!(:new).and_return(nil)
      @api.stub!(:get_events)
      @api.stub!(:results)
      @api.stub!(:first)
      rsvp = mock(MeetupApi::Rsvp, {:response => "yes", :coord => "1.0", :lon => "1.0"})
      rsvp.stub!(:get_rsvps)
      @event.stub!(:get_rsvps)
      @event.stub!(:results).and_return([rsvp, rsvp])
      get :map, :event_id => '10847519'
      assigns[:coords].should == {"no"=>[], "maybe"=>[], "yes"=>[{:long=>"1.0", :lat=>"1.0"}, {:long=>"1.0", :lat=>"1.0"}]}
      assigns[:mid_lat].should == "1.0"
      assigns[:mid_long].should == "1.0"
      response.should render_template('map')
    end
  end
end