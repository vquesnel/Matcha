function previewFile() {
    var preview = document.getElementById('photodisplay');
    var file = document.querySelector('input[type=file]').files[0];
    var reader = new FileReader();
    reader.addEventListener("load", function () {
        preview.src = reader.result;
    }, false);
    if (file) {
        reader.readAsDataURL(file);
        document.getElementById("photo").setAttribute("style", "display:block; padding:0");
        document.getElementById("band").setAttribute("style", "display:none");

    }
}

function delete_pic(_this) {
    var socket = io.connect('https://localhost:4433');
    socket.emit("delete_pic", {
        picture: _this.src
    });
    _this.remove();
}