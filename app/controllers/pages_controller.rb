class PagesController < ApplicationController
  def home
  end

  def show
    render :action => params[:page]
  end

  def events
    @upcoming = params['past'].nil?
  end

  def map
    redirect_to root_path and return if (params[:event_id].nil?)
    @api = MeetupApi::Client.new('422f436d58563429753272236322037')
    @event = @api.get_events(:id => params[:event_id], :after => '01012000').results.first
    @rsvps = @event.get_rsvps(@api, :rsvp_types => "yes,no,maybe").results

    lat = BigDecimal.new("0")
    long = BigDecimal.new("0")
    @coords = {"yes" => Array.new, "maybe" => Array.new, "no" => Array.new}
    @rsvps.each do |rsvp|
      if rsvp.response == "yes"
        lat += BigDecimal.new(rsvp.coord)
        long += BigDecimal.new(rsvp.lon)
      end
      @coords[rsvp.response] << {:lat => rsvp.coord, :long => rsvp.lon}
    end
    @mid_lat = (lat/@coords["yes"].length).ceil(13).to_s('F')
    @mid_long = (long/@coords["yes"].length).ceil(13).to_s('F')
  end
end
