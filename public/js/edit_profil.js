function previewFile() {
    var preview = document.getElementById('photo');
    var file = document.querySelector('input[type=file]').files[0];
    var reader = new FileReader();
    reader.addEventListener("load", function () {
        preview.src = reader.result;
    }, false);
    if (file) {
        reader.readAsDataURL(file);
        document.getElementById("photo").setAttribute("style", "display:block");
    }
}

function Changeprofile_pic(img) {
    var socket = io.connect('http://localhost:1234');
    socket.emit("changeprofile_pic", {
        picture: img.src
    });
}