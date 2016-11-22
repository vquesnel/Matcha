$(document).ready(function () {
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
}