//document.getElementById('change-email').setAttribute('style', 'display: none');
//document.getElementById('change-password').setAttribute('style', 'display: none');
function showEmailChanger() {
	var checker = document.getElementById('change-email').getAttribute("style");
	var checker2 = document.getElementById('change-password').getAttribute("style");
	if (checker2 === 'display: block') {
		document.getElementById('change-password').setAttribute('style', 'display: none');
	}
	if (checker === 'display: none') {
		document.getElementById('change-email').setAttribute('style', 'display: block');
	}
	else {
		document.getElementById('change-email').setAttribute('style', 'display: none');
	}
}

function showPasswordChanger() {
	var checker = document.getElementById('change-password').getAttribute("style");
	var checker2 = document.getElementById('change-email').getAttribute("style");
	if (checker2 === 'display: block') {
		document.getElementById('change-email').setAttribute('style', 'display: none');
	}
	if (checker === 'display: none') {
		document.getElementById('change-password').setAttribute('style', 'display: block');
	}
	else {
		document.getElementById('change-password').setAttribute('style', 'display: none');
	}
}
$(document).ready(function () {
	$('input.typeahead').typeahead({
		name: 'typeahead'
		, remote: 'https://localhost:4433/search?key=%QUERY'
		, limit: 10
	});
});