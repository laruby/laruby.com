class PagesController < ApplicationController
  def home
    
  end

	def events
		@api = MeetupApi::Client.new('422f436d58563429753272236322037')
		#DateTime.now.strftime("%m%d%Y")
		@events = @api.get_events(:group_id => '335039', :after => '07012009').results
	end

	def map
		@api = MeetupApi::Client.new('422f436d58563429753272236322037')
		@event = @api.get_events(:id => params[:event_id], :after => '01012000').results.first
		@rsvps = @event.get_rsvps(@api).results
		lat = BigDecimal.new("0")
		long = BigDecimal.new("0")
		@coords = Array.new
		@rsvps.each do |rsvp|
			lat += BigDecimal.new(rsvp.coord)
			long += BigDecimal.new(rsvp.lon)
			@coords << {:lat => rsvp.coord, :long => rsvp.lon}
		end
		@mid_lat = (lat/@rsvps.count).ceil(13).to_s('F')
		@mid_long = (long/@rsvps.count).ceil(13).to_s('F')
		render 'map', :layout => 'map'
	end
end
