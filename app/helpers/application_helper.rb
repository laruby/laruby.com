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

end
