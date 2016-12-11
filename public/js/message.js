$(document).ready(function () {
    var room = [];
    var socket = io.connect('https://localhost:4433');
    var url = document.location.pathname;
    room = url.split("/");
    if (room[2]) {
        socket.emit("room", room[2]);
    }
    socket.on("notification", function (data) {
        console.log(data.notifcation);
    })
});