# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def add_markers(coords)
    rtn = ""
    coords.each do |key, list|
      list.each do |coord|
        rtn << "map.addOverlay(new GMarker(new GLatLng(#{coord[:lat]}, #{coord[:long]}), #{key}MarkerOptions));\n"
        rtn << "bounds.extend(new GLatLng(#{coord[:lat]}, #{coord[:long]}));\n"
      end
    end

    return rtn
  end

  def meetup_events(upcoming=true)
    @api = MeetupApi::Client.new('422f436d58563429753272236322037')
    after = (upcoming) ? DateTime.now.strftime("%m%d%Y") : "01012000"
    @api.get_events(:group_id => '335039', :after => after).results.reverse
  end

  def laruby
    'LA<span class="red">Ruby</span>'
  end

  def link_to_new_window(link_copy, href)
    "<a href='#{href}' target='_blank'>#{link_copy}</a>"
  end

  def navigation
    #%li= link_to 'Home', root_path
    #%li= link_to 'Connect', static_page_path(:page => 'connect')
    #%li= link_to 'About', static_page_path(:page => 'about')
    rtn = ""
    rtn << "#{%li= link_to 'Home', root_path\n}"
    #rtn << "#{link_to 'Connect', static_page_path(:page => 'connect')}"
    #rtn << "#{link_to 'About', static_page_path(:page => 'about')}"

    return rtn
  end
end
