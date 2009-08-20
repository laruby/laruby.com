require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Resource do
  before(:each) do
    @valid_attributes = {
      :link => 'http://www.deadprogrammersociety.com',
      :description => "A blog with skynet controlled blimps",
      :submitted_by => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Resource.create!(@valid_attributes)
  end

  it "should require a link" do
    @resource = Resource.new(@valid_attributes.except(:link))
    @resource.should have(1).errors_on(:link)
  end

  describe "twitter import" do
    it "should import tweets with #resource and a http link" do
      good_tweet = Mash.new({:text => "#resource for http://something-good.com/"})
      bad_tweet = Mash.new({:text => "a link for http://something-bad.com/"})
      twitter = mock(Twitter::Search)
      mock_resource = mock_model(Resource)
      header = mock(Net::HTTPHeader, {:code => "301"})
      header.stub!(:[]).with("location").and_return("http://something-good.com/")
      response = mock(Net::HTTPResponse, {:header => header})
      Twitter::Search.stub!(:new).and_return(twitter)
      User.stub!(:find_by_twitter_id).and_return(nil)
      twitter.should_receive(:to).with('laruby').once.and_return([good_tweet, bad_tweet])
      Net::HTTP.should_receive(:get_response).and_return(response)
      Resource.should_receive(:exists?).once.with({:link => "http://something-good.com/"}).and_return(false)
      Resource.should_receive(:new).once.and_return(mock_resource)
      mock_resource.should_receive(:approved=).once.with(false)
      mock_resource.should_receive(:link=).once.with("http://something-good.com/")
      mock_resource.should_receive(:description=).once.with(good_tweet.text)
      mock_resource.should_receive(:save)
      Resource.import_twitter_links
    end

    it "should skip urls that don't resolve"

    it "should skip tweets without links"

    it "should skip tweets without #resource"

    it "should approve resources with registered users"
  end
end
