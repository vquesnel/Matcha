var addComment = function (user, comment, connection, callback) {
    var self = this;

    console.log(user + "===" + comment);
    connection.query("INSERT into UserComment (UserID,Username,Comment) VALUES ((SELECT id FROM users WHERE username = ?),?,?)", [user, user, comment], function (err, rows) {
        if (err) {
            return callback(true, null);
        } else {
            callback(false, "comment added");
        }
    });

    connection.on('error', function (err) {
        return callback(true, null);

    });
};

module.exports.addComment = addComment;