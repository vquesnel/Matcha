/*$(document).ready(function () {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showLocation, errorHandler, {
            enableHighAccuracy: false,
            maximumAge: 60000,
            timeout: 27000
        });
    } else {
        alert('Votre navigateur ne prend malheureusement pas en charge la géolocalisation.');
    }
});
function showLocation(position) {
    document.write('Latitude : ' + position.coords.latitude + ' - Longitude : ' + position.coords.longitude);
}
function errorHandler(error) {
    console.log('Geolocation error : code ' + error.code + ' - ' + error.message);
    alert('Une erreur est survenue durant la géolocalisation. Veuillez réessayer plus tard ou contacter le support.');
}*/
$(document).ready(function () {
	var socket = io.connect('https://localhost:4433');
	var currgeocoder;
	var iploc;
	var currentloc = [];
	socket.on("iplocation", function (data) {
			iploc = (data.location);
			initializeCurrent(iploc[0], iploc[1]);
		})
		//Set geo location lat and long
	navigator.geolocation.getCurrentPosition(function (position, html5Error) {
		geo_loc = processGeolocationResult(position);
		currLatLong = geo_loc.split(",");
		if (currLatLong) {
			initializeCurrent(currLatLong[0], currLatLong[1]);
		}
		else {}
	});
	//Get geo location result
	function processGeolocationResult(position) {
		html5Lat = position.coords.latitude; //Get latitude
		html5Lon = position.coords.longitude; //Get longitude
		html5TimeStamp = position.timestamp; //Get timestamp
		html5Accuracy = position.coords.accuracy; //Get accuracy in meters
		return (html5Lat).toFixed(8) + ", " + (html5Lon).toFixed(8);
	}
	//Check value is present or not & call google api function
	function initializeCurrent(latcurr, longcurr) {
		currgeocoder = new google.maps.Geocoder();
		if (latcurr != '' && longcurr != '') {
			var myLatlng = new google.maps.LatLng(latcurr, longcurr);
			return getCurrentAddress(myLatlng);
		}
	}
	//Get current address
	function getCurrentAddress(location) {
		currgeocoder.geocode({
			'location': location
		}, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				currentloc.push(results[0].formatted_address);
				socket.emit("location", {
					location: currentloc
				});
			}
			else {
				alert('Geocode was not successful for the following reason: ' + status);
			}
		});
	}
});