// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function() {  
	if (navigator.geolocation) { 
		navigator.geolocation.getCurrentPosition(updatePlaces, error);
	} else {
		error('not supported');
	}  
});    
function error(msg) {
	var s = document.querySelector('#status');
	s.innerHTML = typeof msg == 'string' ? msg : "failed";
	s.className = 'fail';

	// console.log(arguments);
}
function updatePlaces (position) {
	var s = document.querySelector('#status');

	if (s.className == 'success') {
	  // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
	  return;
	}

	s.innerHTML = "found you!";
	s.className = 'success';

	var mapcanvas = document.createElement('div');
	mapcanvas.id = 'mapcanvas';
	mapcanvas.style.height = '280px';
	mapcanvas.style.width = '320px';

	document.querySelector('.map').appendChild(mapcanvas);

	var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	var myOptions = {
	  zoom: 15,
	  center: latlng,
	  mapTypeControl: false,
	  navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
	  mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

	var marker = new google.maps.Marker({
	    position: latlng, 
	    map: map, 
	    title:"You are here!"
	});              
    
	$.getScript("/places.js?lat=" + position.coords.latitude + "&long=" + position.coords.longitude)
}