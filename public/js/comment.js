$(document).ready(function () {
    var socket = io();
    // API to get status from DB.
    $.get("/comment.html", function (data) {
        if (data.error) {
            $("#message").empty().text(data.message);
        } else {
            $("#status").text(data.message[0].UserPostContent);
        }
    });
    $("#addComment").click(function (event) {
        var userName = $("#name").val();
        var userComment = $("#comment").val();
        if (userName === "" || userComment === "") {
            alert("Please fill the form.");
            return;
        }
        // Here we emit the event and back-end will add it into DB.
        socket.emit('comment added', {
            username: userName,
            comment: userComment
        });
        socket.on('notify everyone', function (msg) {
            // Will explain in next section.
            notifyMe(msg.user, msg.comment);
        });
    });
});

function notifyMe(user, message) {
    // Let's check if the browser supports notifications
    if (!("Notification" in window)) {
        alert("This browser does not support desktop notification");
    }
    // Let's check if the user is okay to get some notification
    else if (Notification.permission === "granted") {
        // If it's okay let's create a notification
        var options = {
            body: message,
            dir: "ltr"
        };
        var notification = new Notification(user + " Posted a comment", options);
    }
    // Otherwise, we need to ask the user for permission
    // Note, Chrome does not implement the permission static property
    // So we have to check for NOT 'denied' instead of 'default'
    else if (Notification.permission !== 'denied') {
        Notification.requestPermission(function (permission) {
            // Whatever the user answers, we make sure we store the information
            if (!('permission' in Notification)) {
                Notification.permission = permission;
            }
            // If the user is okay, let's create a notification
            if (permission === "granted") {
                var options = {
                    body: message,
                    dir: "ltr"
                };
                var notification = new Notification(user + " Posted a comment", options);
            }
        });
    }
    // At last, if the user already denied any notification, and you
    // want to be respectful there is no need to bother them any more.
}