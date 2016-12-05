var moment = require('moment');
var mysql = require('mysql');
var md5 = require('md5');
var uniqid = require('uniqid');

function isValid(str) {
	if (typeof (str) !== 'string') {
		return false;
	}
	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 127) {
			return false;
		}
	}
	return true;
}
exports.form_checker = function (firstname, lastname, birthday, username, email, conf_email, password, conf_password, sexe) {
	var ret = '';
	if (!firstname) return ('Please enter a firstname');
	else if (!lastname) return ('Please enter a lastname');
	else if (!birthday) return ('Please enter a birthday');
	else if (!isValid(username)) return ('Please enter an username with only valids characters');
	else if (!email) return ('Please enter an email');
	else if (!conf_email) return ('Please enter an email confirmation');
	else if (!password) return ('Please enter a password');
	else if (!conf_password) return ('Please enter a password confirmation');
	else if (!sexe) return ('Please select a sexe kind');
	else return (null);
};
exports.form_validator = function (username, email, conf_email) {
	connection.query("CREATE DATABASE IF NOT EXISTS matcha;");
}
exports.checkbirth = function (date) {
	var legal = moment().subtract('18', 'years').format('YYYY-MM-DD');
	var result = [];
	if (moment(date, 'YYYY-MM-DD').isAfter(legal)) result.push('Sorry you\'re underage...');
	return result;
}
exports.find_duplicates = function (arr) {
	var len = arr.length
		, out = []
		, counts = {};
	for (var i = 0; i < len; i++) {
		var item = arr[i];
		counts[item] = counts[item] >= 1 ? counts[item] + 1 : 1;
		if (counts[item] === 1) {
			out.push(item);
		}
	}
	return out;
}
exports.cleanArray = function (actual) {
	var newArray = new Array();
	for (var i = 0; i < actual.length; i++) {
		if (actual[i]) {
			newArray.push(actual[i]);
		}
	}
	return newArray;
}