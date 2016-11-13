exports.index_checker = function (username, password) {
    var ret = '';
    if (!username)
        return ('Please enter an username');
    else if (!password)
        return ('Please enter a password');
    else
        return (null);
};