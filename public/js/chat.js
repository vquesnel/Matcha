(function ($) {
	$(document).ready(function () {
		var socket = io.connect('https://localhost:4433');
		var url = document.location.pathname.split('/')[2];
		var sessionUser = $("#sessionUser").text();
		$('#message').focus();
		window.onload = function () {
			if (url) {
				socket.emit("seen message", {
					room: url
					, user: sessionUser
					, notif: document.getElementById("notif" + url).innerHTML
				});
				$('#msgtpl').animate({
					scrollTop: $('#msgtpl').prop('scrollHeight')
				}, 500)
			}
		}
		$(document).ready(function () {
			$('input#send').on({
				click: function (e) {
					if ($('#message').val() !== '') {
						socket.emit('send-message', {
							text: $('#message').val()
							, user: sessionUser
							, room: url
						});
					}
					$('#message').val('');
					$('#message').focus();
				}
			});
		});
		socket.emit('check_message', url);
		socket.on("new_message", function (data) {
			if (data.room === url) {
				document.getElementById("notif" + data.room).innerHTML = 0;
				if (data.sender === sessionUser) {
					$('<div class="my-message"></div>').text(data.message).appendTo("#msgtpl");
				}
				else {
					$('<div class="contact-message"></div>').text(data.message).appendTo("#msgtpl");
				}
				$('#msgtpl').animate({
					scrollTop: $('#msgtpl').prop('scrollHeight')
				}, 500);
			}
		});
		socket.on("old_message", function (data) {
			for (var k in data) {
				if (data[k].sender === sessionUser) {
					$('<div class="my-message"></div>').text(data[k].message).appendTo("#msgtpl");
				}
				else {
					$('<div class="contact-message"></div>').text(data[k].message).appendTo("#msgtpl");
				}
			}
		});
		socket.on("notification", function (data) {
			var notif = document.getElementById("notification");
			notif.innerHTML = data.notification;
		});
		socket.on("new Notification", function (data) {
			var notif = document.getElementById("notification").innerHTML;
			var value = parseInt(notif, 10);
			data.contactnotif = parseInt(data.contactnotif, 10);
			data.value = parseInt(data.value, 10);
			if (!data.room) {
				if (value !== data.value) {
					var newvalue = value + (data.value - value);
					document.getElementById("notification").innerHTML = newvalue;
				}
			}
			else if (data.room) {
				var contactnotif = document.getElementById("notif" + data.room).innerHTML;
				var contactnotifvalue = parseInt(contactnotif, 10);
				if (data.room === url) {
					socket.emit("seen message", {
						room: url
						, user: sessionUser
						, notif: document.getElementById("notif" + url).innerHTML
					})
				}
				else if (data.room !== url) {
					if (value !== data.value) {
						var newvalue = value + (data.value - value);
						document.getElementById("notification").innerHTML = newvalue;
					}
					if (contactnotifvalue !== parseInt(data.contactnotif, 10)) {
						var newcontactnotifvalue = contactnotifvalue + (parseInt(data.contactnotif, 10) - contactnotifvalue);
						document.getElementById("notif" + data.room).innerHTML = newcontactnotifvalue;
					}
				}
			}
		});
		socket.on("message update", function (data) {
			if (url === data.room) {
				var value = parseInt(data.notif, 10);
				var notifvalue = parseInt(document.getElementById("notification").innerHTML, 10);
				document.getElementById("notif" + data.room).innerHTML = 0;
				document.getElementById("notification").innerHTML = notifvalue - value;
			}
		});
	});
})(jQuery);