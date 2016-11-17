var express = require('express')
var expressSession = require('express-session')
var http = require('http')
var io = require('socket.io')
var app = express();
var session = expressSession({ /* configuration */ })
	// middleware
app.use(session)
	// routes
app.get('/', function (req, res) {
	res.render("index.html", {})
});
app.post('/', function (req, res) {
	var ret = index.index_checker(req.body.username, req.body.password);
	if (ret) {
		res.render('index.html', {
			'message': ret
		})
	}
	else {
		connection.query("SELECT * FROM users WHERE username = ?", [req.body.username], function (err, rows) {
			if (err) throw err;
			if (rows.length) {
				if (md5(req.body.password) !== rows[0].password) {
					res.render("index.html", {
						message: "Sorry wrong password"
					})
				}
				else {
					req.session.username = rows[0].username;
					req.session.sexual_or = rows[0].sexual_or;
					req.session.sexe = rows[0].sexe;
					req.session.profil_pic = rows[0].profil_pic;
					connection.query("UPDATE users SET login = ? WHERE username = ?", ["online", req.session.username])
					if (!(rows[0].profil_pic)) {
						res.redirect('/edit_profil.html');
					}
					else {
						res.redirect('/match.html')
					}
				}
			}
			else {
				res.render("index.html", {
					message: "This user isn't register"
				})
			}
		})
		connection.query("SELECT * FROM users WHERE username = ? ANd password = ?", [req.body.username, md5(req.body.password)], function (err, rows) {
			if (err) throw err;
			if (rows.lenght) {
				req.session.username = rows[0].username;
				req.session.sexual_or = rows[0].sexual_or;
				req.session.sexe = rows[0].sexe;
				req.session.profil_pic = rows[0].profil_pic;
			}
			connection.query("UPDATE users SET login = ? WHERE username =?", ["online", req.session.username]);
		})
	}
});
// setup servers
var server = http.createServer(app);
var sio = io.listen(server);
// setup socket auth with sessions
sio.set('authorization', function (handshake, accept) {
		session(handshake, {}, function (err) {
			if (err) return accept(err)
			var session = socket.handshake.session;
			// check the session is valid
			accept(null, session.userid != null)
		})
	})
	// setup socket connections to have the session on them
sio.sockets.on('connection', function (socket) {
	session(socket.handshake, {}, function (err) {
		if (err) { /* handle error */ }
		var session = socket.handshake.session;
		// do stuff
		// alter session
		session.userdata = mydata
			// and save session
		session.save(function (err) { /* handle error */ })
	})
})