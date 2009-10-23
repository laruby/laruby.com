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
    when_fragment_expired 'meetup', 15.minutes.from_now do
      @api = MeetupApi::Client.new('422f436d58563429753272236322037')
      after = (upcoming) ? DateTime.now.strftime("%m%d%Y") : "01012000"
      @api.get_events(:group_id => '335039', :after => after).results.reverse
    end
  rescue 
    nil
  end

  def laruby
    'LA<span class="red">Ruby</span>'
  end

  def link_to_new_window(link_copy, href)
    "<a href='#{href}' target='_blank'>#{link_copy}</a>"
  end

  def navigation(id)
    #%li= link_to 'Home', root_path
    #%li= link_to 'Connect', static_page_path(:page => 'connect')
    #%li= link_to 'About', static_page_path(:page => 'about')
    ul @pages.map(&:title)
  end

  def html_list(type, elements, options = {}) 
    if elements.empty? 
      "" 
    else 
      lis = elements.map { |x| content_tag("li", x) } 
      content_tag(type, lis, options) 
    end 
  end 

  def ul(*args) 
    html_list("ul", *args) 
  end 

  def ol(*args) 
    html_list("ol", *args) 
  end
end
