$(document).ready(function () {
	$('input#search-bar').typeahead({
		name: 'typeahead'
		, remote: 'https://localhost:4433/search?key=%QUERY'
		, limit: 10
	});
});