$(document).ready(function(){
	if (!GBrowserIsCompatible()) {
		alert('Your browser is not compatible with the Google Maps API');
		return;
	}
	if (!document.getElementById("map")) {
		return;
	}
	map = new GMap2(document.getElementById("map"));
	map.setCenter(new GLatLng(34.04999923706055, -118.23999786376953), 13);
	map.setUIToDefault();
});