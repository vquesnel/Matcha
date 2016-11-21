/*     D  E  C  L  A  R  A  T  I  O  N  S    */
var fs = require('fs');
var https = require('https');
var express = require('express');
var path = require('path');
var options = {
	key: fs.readFileSync('certificates/server-key.pem')
	, cert: fs.readFileSync('certificates/server-crt.pem')
	, ca: fs.readFileSync('certificates/ca-crt.pem')
, };
var app = express();
var mysql = require('mysql');
var connection = mysql.createConnection({
	//port: 8889
	port: 3307
	, host: 'localhost'
	, user: 'root'
	, password: 'root'
});
var bodyParser = require('body-parser');
var mustacheExpress = require('mustache-express');
var create_account = require('./server/create_Account');
var profile = require('./server/profile');
var index = require("./server/index");
var moment = require('moment');
var md5 = require('md5');
var uniqid = require('uniqid');
var session = require('express-session');
var sess = {
	secret: 'keyboard cat'
	, cookie: {}
	, resave: false
	, saveUninitialized: false
}
var mailer = require('nodemailer');
var smtpTransport = mailer.createTransport('SMTP', {
	service: 'Gmail'
	, auth: {
		user: 'noreply.matcha@gmail.com'
		, pass: 'zdpzdpzdp'
	}
});
var multer = require('multer');
var storage = multer.diskStorage({
	destination: function (req, file, callback) {
		callback(null, './public/upload');
	}
	, filename: function (req, file, callback) {
		callback(null, req.session.username + '-' + uniqid());
	}
});
var upload = multer({
	storage: storage
	, fileFilter: function (req, file, cb) {
		if (file.mimetype !== 'image/png' && file.mimetype !== 'image/jpeg' && file.mimetype !== 'image/jpeg') {
			req.fileValidationError = 'goes wrong on the mimetype';
			return cb(null, false, new Error('goes wrong on the mimetype'));
		}
		cb(null, true);
	}
}).single('userPhoto');
var sharp = require('sharp');
/*     S Q L    C  O  N  N  E  X  I  O  N  S    */
connection.connect(function (err) {
	if (err) throw err;
});
connection.query("CREATE DATABASE IF NOT EXISTS matcha;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`users` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `firstname` VARCHAR(255) NOT NULL , `lastname` VARCHAR(255) NOT NULL , `username` VARCHAR(255) NOT NULL , `birthday` DATE NOT NULL , `email` VARCHAR(255) NOT NULL , `password` VARCHAR(255) NOT NULL , `sexe` VARCHAR(8) NOT NULL , `token` VARCHAR(255) NOT NULL , `validation` VARCHAR(1) NOT NULL DEFAULT '0' ,  `profil_pic` LONGTEXT DEFAULT NULL, `sexual_or` VARCHAR(10) NOT NULL DEFAULT 'bi' , `bio` VARCHAR(255) DEFAULT NULL , `location` VARCHAR(255) DEFAULT NULL ,  `pop` INT(5) DEFAULT '0', login VARCHAR(255), `sessionID` VARCHAR(255) DEFAULT NULL, PRIMARY KEY (`id`)) ENGINE = InnoDB;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`pictures` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `pic` LONGTEXT NOT NULL , `username` VARCHAR(255) NOT NULL,  PRIMARY KEY (`id`)) ENGINE = InnoDB;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`history` ( `visitor` VARCHAR(255) NOT NULL , `visited` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`liking` ( `liker` VARCHAR(255) NOT NULL , `liked` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`reports` ( `repoter` VARCHAR(255) NOT NULL , `reported` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`tags` ( `tag` VARCHAR(255) NOT NULL , `username` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB;");
connection.query("use matcha");
/*     P  A  G  E  S      R  E  Q  U  E  S  T  S     -     E X P R E S S     */
app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', __dirname + '/public/html/');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({
	extended: true
}));
app.use(session(sess));
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
					connection.query("UPDATE users SET sessionID = ? WHERE username = ?", [req.sessionID, req.body.username], function (err) {
						if (err) throw err;
					})
					req.session.username = rows[0].username;
					req.session.sexual_or = rows[0].sexual_or;
					req.session.sexe = rows[0].sexe;
					req.session.profil_pic = rows[0].profil_pic;
					req.session.email = rows[0].email;
					req.session.token = rows[0].token;
					connection.query("UPDATE users SET login = ? WHERE username = ?", ["online", req.session.username], function (err) {
						if (err) throw err;
					})
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
app.get('/create_account.html', function (req, res) {
	res.render('create_account.html', {})
});
app.post('/create_account.html', function (req, res) {
	var ret = create_account.form_checker(req.body.firstname, req.body.lastname, req.body.birthday, req.body.username, req.body.email, req.body.confirm_email, req.body.password, req.body.confirm_password, req.body.sexe);
	if (ret) {
		res.render('create_account.html', {
			'message': ret
		})
	}
	else {
		if (req.body.email === req.body.confirm_email) {
			if (req.body.password === req.body.confirm_password) {
				var birth = create_account.checkbirth(req.body.birthday);
				if (!(birth.length)) {
					connection.query('SELECT * FROM users WHERE username = ?', [req.body.username], function (err, rows) {
						if (err) throw err;
						if (rows.length) {
							ret = 'Username already register';
							res.render('create_account.html', {
								'message': ret
							})
						}
						else {
							connection.query('SELECT * FROM users WHERE email = ?', [req.body.email], function (err, rows) {
								if (err) throw err;
								if (rows.length) {
									ret = 'Email already used by another account.';
									res.render('create_account.html', {
										'message': ret
									})
								}
								else {
									connection.query('INSERT INTO users(firstname, lastname, username, birthday, email, sexe, password, token) VALUES (?,?,?,?,?,?,?,?)', [req.body.firstname, req.body.lastname, req.body.username, req.body.birthday, req.body.email, req.body.sexe, md5(req.body.password), uniqid()], function (err) {
										if (err) throw err;
									})
									ret = "Your account has been created !";
									res.render('create_account.html', {
										'message': ret
									})
								}
							})
						}
					})
				}
				else {
					ret = "Sorry you're underage";
					res.render('create_account.html', {
						'message': ret
					})
				}
			}
			else {
				ret = "Passwords do not match";
				res.render('create_account.html', {
					'message': ret
				})
			}
		}
		else {
			ret = 'Emails do not match';
			res.render('create_account.html', {
				'message': ret
			})
		}
	}
});
app.get('/edit_profil.html', function (req, res) {
	var infos = {};
	if (!req.session.username) {
		res.redirect("/");
	}
	else if (!req.session.profil_pic) {
		infos.messagephoto = "You need a profil picture to continue";
		res.render("edit_profil.html", {
			edit_profil: {
				infos: infos
			}
		})
	}
	else {
		connection.query("SELECT * FROM users WHERE username = ?", [req.session.username], function (err, rows) {
			if (err) throw err;
			else {
				req.session.profil_pic = rows[0].profil_pic;
			}
		})
		connection.query("SELECT * FROM pictures WHERE username = ?", [req.session.username], function (err, rows) {
			if (err) throw err;
			res.render('edit_profil.html', {
				edit_profil: {
					infos: infos
				}
				, display_pictures_edit: {
					infos: rows
				}
			})
		});
	}
});
app.post('/upload', function (req, res) {
	var infos = {};
	connection.query("SELECT * FROM users WHERE username = ?", [req.session.username], function (err, rows) {
		if (err) throw err;
		else {
			req.session.profil_pic = rows[0].profil_pic;
		}
	});
	upload(req, res, function (err) {
		var cropped = 'upload/' + req.session.username + '-' + uniqid() + '.png';
		if (req.fileValidationError) {
			infos.messagephoto = 'Wrong file type : File not uploaded';
		}
		if (req.file) {
			if (err) {
				infos.messagephoto = 'A problem occurs : File not uploaded';
			}
			else {
				sharp(req.file.path).resize(500, 500).toFile('public/' + cropped, function (err) {
					if (err) throw err;
					else {
						fs.unlink(req.file.path)
					}
				});
				if (!req.session.profil_pic) {
					connection.query("UPDATE users SET profil_pic = ? WHERE username = ?", [cropped, req.session.username], function (err) {
						if (err) throw err;
					})
					req.session.profil_pic = cropped;
				}
				connection.query("SELECT * FROM pictures WHERE username = ?", [req.session.username], function (err, rows) {
					if (err) throw err;
					if (rows.length < 5) {
						connection.query("INSERT INTO pictures(pic, username) VALUES(?,?)", [cropped, req.session.username], function (err) {
							if (err) throw err;
						})
						infos.messagephoto = 'File uploaded';
					}
					else {
						infos.messagephoto = "You can have only 5 pictures";
					}
				})
			}
			connection.query("SELECT * FROM pictures WHERE username = ?", [req.session.username], function (err, rows) {
				if (err) throw err;
				for (var k in rows) {}
				if (infos.messagephoto !== "You can have only 5 pictures") {
					rows[Number(k) + 1] = {
						pic: cropped
					}
				}
				res.render('edit_profil.html', {
					edit_profil: {
						infos: infos
					}
					, display_pictures_edit: {
						infos: rows
					}
				});
			});
		}
		else {
			connection.query("SELECT * FROM pictures WHERE username = ?", [req.session.username], function (err, rows) {
				if (err) throw err;
				for (var k in rows) {};
				infos.messagephoto = "You haven't select a picture";
				res.render('edit_profil.html', {
					edit_profil: {
						infos: infos
					}
					, display_pictures_edit: {
						infos: rows
					}
				});
			});
		}
	});
});
app.post('/update', function (req, res) {
	var infos = {};
	infos.messageprofil = "Nothing to update";
	(function (callback) {
		if (req.body.preferences) {
			var res = req.body.preferences.split(" ");
			infos.messageprofil = "Profil has been updated";
		}
		if (req.body.bio) {
			connection.query("UPDATE users SET bio = ? WHERE username = ?", [req.body.bio, req.session.username], function (err) {
				if (err) throw err;
			})
			infos.messageprofil = "Profil has been updated";
		}
		if (req.body.location) {
			connection.query("UPDATE users SET location = ? WHERE username = ?", [req.body.location, req.session.username], function (err) {
				if (err) throw err;
			})
			infos.messageprofil = "Profil has been updated";
		}
		if (req.body.orientation) {
			connection.query("UPDATE users SET sexual_or = ? WHERE username = ?", [req.body.orientation, req.session.username], function (err) {
				if (err) throw err;
			})
			infos.messageprofil = "Profil has been updated";
		}
		callback(infos);
	})(function (infos) {
		connection.query("SELECT * FROM pictures WHERE username =?", [req.session.username], function (err, rows) {
			if (err) throw err;
			else {
				if (!req.session.profil_pic) {
					infos.messageprofil = "Profil has been updated but you need a profil picture to continue";
					res.render('edit_profil.html', {
						edit_profil: {
							infos: infos
						}
						, display_pictures_edit: {
							infos: rows
						}
					});
				}
				else {
					res.render('edit_profil.html', {
						edit_profil: {
							infos: infos
						}
						, display_pictures_edit: {
							infos: rows
						}
					});
				}
			}
		})
	})
});
app.get('/match.html', function (req, res) {
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM users WHERE username = ?", [req.session.username], function (err, rows) {
			if (err) throw err;
			if (!rows[0].profil_pic) {
				res.redirect("/edit_profil.html");
			}
			else {
				connection.query("SELECT * FROM users", function (err, rows) {
					if (err) throw err;
					else {
						for (var k in rows) {
							rows[k].class = (Number(k) % 2) + 1;
							rows[k].birth = profile.age(rows[k].birthday);
						}
						res.render("match.html", {
							homepage: {
								infos: rows
							}
						})
					}
				})
			}
		})
	}
});
app.get('/profile.html', function (req, res) {
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM users WHERE username = ?", [req.session.username], function (err, rows) {
			if (err) throw err;
			if (!rows[0].profil_pic) {
				res.redirect("/edit_profil.html");
			}
			else {
				var infos = rows[0];
				infos.birth = profile.age(rows[0].birthday);
				connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.session.username, rows[0].profil_pic], function (err, row) {
					if (err) throw err;
					res.render("profile.html", {
						profile: {
							infos: infos
						}
						, display_pictures: {
							infos: row
						}
					});
				})
			}
		})
	}
});
app.get('/users.html/:user', function (req, res) {
	if (!req.session.username) {
		res.redirect('/');
	}
	else {
		if (req.params.user === req.session.username) {
			res.redirect('/profile.html');
		}
		else {
			connection.query("SELECT * FROM history WHERE visitor = ? AND visited = ?", [req.session.username, req.params.user], function (err, rows) {
				if (err) throw err;
				if (!rows[0]) {
					connection.query("UPDATE users SET pop = pop + 2 WHERE username = ?", [req.params.user], function (err) {
						if (err) throw err;
					});
					connection.query("INSERT INTO history(visitor, visited) VALUES (?,?)", [req.session.username, req.params.user], function (err) {
						if (err) throw err;
					});
				}
			});
			connection.query("SELECT * FROM users WHERE username = ?", [req.params.user], function (err, rows) {
				if (err) throw err;
				if (!rows.length) {
					res.redirect('/match.html');
				}
				else {
					var infos = rows[0];
					infos.birth = profile.age(rows[0].birthday);
					connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, row) {
						if (err) throw err;
						res.render('users.html', {
							users: {
								infos: infos
							}
							, display_pictures_users: {
								infos: row
							}
						});
					});
				}
			});
		}
	}
});
app.post("/users.html/:user", function (req, res) {
	if (!req.session.username) {
		res.redirect('/');
	}
	else {
		connection.query("SELECT * FROM users WHERE username = ?", [req.params.user], function (err, rows) {
			if (err) throw err;
			if (!rows.length) {
				res.redirect('/match.html');
			}
			else {
				var infos = rows[0];
				var pov = req.body.pov;
				if (pov === "follow") {
					connection.query("SELECT * FROM liking WHERE liker = ? AND liked = ?", [req.session.username, req.params.user], function (err, rows) {
						if (err) throw err;
						if (!rows[0]) {
							connection.query("INSERT INTO liking(liker, liked) VALUES(?,?)", [req.session.username, req.params.user], function (err) {
								if (err) throw err;
							});
							connection.query("UPDATE users SET pop =pop + 5 WHERE username = ?", [req.params.user], function (err) {
								if (err) throw err;
							})
						}
					})
					infos.follow = "you like " + rows[0].firstname + "";
				}
				else if (pov === "unfollow") {
					connection.query("SELECT * FROM liking WHERE liker = ? AND liked = ?", [req.session.username, req.params.user], function (err, rows) {
						if (err) throw err;
						if (rows[0]) {
							connection.query("DELETE FROM liking WHERE liker=? AND liked = ?", [req.session.username, req.params.user], function (err) {
								if (err) throw err;
							});
							connection.query("UPDATE users SET pop =pop - 5 WHERE username = ?", [req.params.user], function (err) {
								if (err) throw err;
							})
						}
					})
					infos.follow = "you do not like " + rows[0].firstname + " anymore";
				}
				infos.birth = profile.age(rows[0].birthday);
				connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, row) {
					if (err) throw err;
					res.render('users.html', {
						users: {
							infos: infos
						}
						, display_pictures_users: {
							infos: row
						}
					});
				})
			}
		})
	}
});
app.get('/change_password.html/:token/:username', function (req, res) {
	if (!req.params.token || !req.params.username) res.redirect('/');
	else {
		connection.query("SELECT token FROM users WHERE username = ?", [req.params.username], function (err, rows) {
			if (err) throw err;
			if (rows.length && rows[0].token === req.params.token) {
				req.session.guest = req.params.username;
				res.redirect('/change_password.html')
			}
			else if (req.session.username) {
				res.redirect('/profile.html')
			}
			else {
				res.redirect('/')
			}
		})
	}
});
app.get('/change_password.html', function (req, res) {
	if (req.session.guest) {
		res.render('change_password.html')
	}
	else {
		res.redirect('/')
	}
});
app.get('/reset_password.html', function (req, res) {
	res.render('reset_password.html')
});
app.post('/reset_password.html', function (req, res) {
	if (req.body.sendMail) {
		connection.query("SELECT * FROM users WHERE email = ?", [req.body.sendMail], function (err, rows) {
			if (err) throw err;
			else {
				if (rows.length) {
					var mail = {
						from: 'noreply@matcha.com'
						, to: req.body.sendMail
						, subject: 'Changing password'
						, html: '<p>Hello ' + rows[0].firstname + '</p><br><p>To change your password please click on the link below:</p><br><a href="https://localhost:4433/change_password.html/' + rows[0].token + '/' + rows[0].username + '">Change password</a>'
					}
					smtpTransport.sendMail(mail, function (error, response) {
						if (error) {
							res.render('reset_password.html', {
								'message': 'A problem occurs : Sending email failed'
							})
						}
						else {
							res.render('reset_password.html', {
								'message': 'Email sended'
							})
						}
						smtpTransport.close();
					});
				}
				else {
					res.render('reset_password.html', {
						message: 'Email not registred'
					})
				}
			}
		})
	}
	else {
		res.render('reset_password.html', {
			message: 'Please type your email'
		})
	}
});
app.post('/change_password.html', function (req, res) {
	var ret = '';
	if (req.body.new && req.body.confirmation) {
		if (req.body.new === req.body.confirmation) {
			connection.query("UPDATE users SET password = ? WHERE username = ?", [md5(req.body.confirmation), req.session.guest], function (err) {
				if (err) throw err;
				else {
					connection.query("UPDATE users SET token = ? WHERE username = ?", [uniqid(), req.session.guest], function (err) {
						if (err) throw err;
					})
				}
			})
			ret = 'Password Updated';
		}
		else {
			ret = 'Passwords doesn\'t match';
		}
	}
	else {
		ret = 'Please fill all the fields';
	}
	req.session.guest.destroy;
	res.render('change_password.html', {
		message: ret
	})
});
app.get("/logout.html", function (req, res) {
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("UPDATE users SET login = ? WHERE username =?", [new Date(), req.session.username], function (err) {
			if (err) throw err;
		});
		req.session.destroy();
		res.redirect("/");
	}
});
app.get("/history.html", function (req, res) {
	var infos = [];
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM history WHERE visited =?", [req.session.username], function (err, rows) {
			if (err) throw err;
			if (rows[0]) {
				for (var k in rows) {
					(function (k, callback) {
						connection.query("SELECT * FROM users WHERE username = ?", [rows[k].visitor], function (err, row) {
							if (err) throw err;
							else {
								infos[k] = row[0];
								infos[k].class = (Number(k) % 2) + 1;
								infos[k].birth = profile.age(row[0].birthday);
								if (!rows[Number(k) + 1]) {
									callback();
								}
							}
						});
					})(k, function () {
						res.render("history.html", {
							homepage: {
								infos: infos
							}
						})
					});
				}
			}
			else {
				res.render("history.html", {
					message: "Nobody have visited your profil"
				})
			}
		})
	}
});
app.get("/followers.html", function (req, res) {
	var infos = [];
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM liking WHERE liked =?", [req.session.username], function (err, rows) {
			if (err) throw err;
			if (rows[0]) {
				for (var k in rows) {
					(function (k, callback) {
						connection.query("SELECT * FROM users WHERE username = ?", [rows[k].liker], function (err, row) {
							if (err) throw err;
							else {
								infos[k] = row[0];
								infos[k].class = (Number(k) % 2) + 1;
								infos[k].birth = profile.age(row[0].birthday);
								if (!rows[Number(k) + 1]) {
									callback();
								}
							}
						});
					})(k, function () {
						res.render("followers.html", {
							homepage: {
								infos: infos
							}
						})
					});
				}
			}
			else {
				res.render("followers.html", {
					message: "Nobody liked your profil"
				})
			}
		})
	}
});
app.get('/edit_account.html', function (req, res) {
	if (!req.session.username) {
		res.redirect('/');
	}
	else {
		res.render('edit_account.html', {
			email: req.session.email
		})
	}
});
app.post('/edit_account.html', function (req, res) {
	if (req.body.sendEmail) {
		var mail = {
			from: 'noreply.matcha@gmail.com'
			, to: req.session.email
			, subject: 'Changing password'
			, html: '<p>Hello ' + req.session.firstname + '</p><br><p>To change your password please click on the link below:</p><br><a href="https://localhost:4433/change_password.html/' + req.session.token + '/' + req.session.username + '">Change password</a>'
		}
		smtpTransport.sendMail(mail, function (error, response) {
			if (error) {
				res.render('edit_account.html', {
					'message': 'A problem occurs : Sending email failed'
				})
			}
			else {
				res.render('edit_account.html', {
					'message': 'Email sended'
				})
			}
			smtpTransport.close();
		});
	}
	if (req.body.new_email) {
		var regEmail = new RegExp('^[0-9a-z._-]+@{1}[0-9a-z.-]{2,}[.]{1}[a-z]{2,5}$', 'i');
		if (!regEmail.test(req.body.new_email)) {
			res.render('edit_account.html', {
				message: 'Invalid email format'
				, email: req.session.email
			})
		}
		connection.query("SELECT * FROM users WHERE email = ?", [req.body.new_email], function (err, rows) {
			if (err) throw err;
			if (rows[0]) {
				res.render("edit_account.html", {
					email: req.session.email
					, message: 'This email is alreday use'
				})
			}
			else {
				connection.query("UPDATE users SET email = ? WHERE username = ?", [req.body.new_email, req.session.username], function (err) {
					if (err) throw err;
				});
				req.session.email = req.body.new_email;
				res.render('edit_account.html', {
					message: 'Email updated'
					, email: req.session.email
				})
			}
		})
	}
});
/*     S  E  R  V  E  R     */
var httpsServer = https.createServer(options, app, function (req, res) {
	res.writeHead(200);
});
httpsServer.listen(4433);
/*     S  O  C  K  E  T     */
var io = require('socket.io')(httpsServer);
io.sockets.on('connection', function (socket) {
	socket.on("changeprofile_pic", function (data) {
		data.picture = data.picture.replace("https://localhost:4433/", "");
		var username = data.picture.replace("upload/", "");
		username = username.split("-")[0];
		connection.query("UPDATE users SET profil_pic = ? WHERE username = ?", [data.picture, username], function (err) {
			if (err) throw err;
		});
	});
	socket.on("delete_pic", function (data) {
		data.picture = data.picture.replace("https://localhost:4433/", "");
		var username = data.picture.replace("upload/", "");
		username = username.split("-")[0];
		connection.query("DELETE FROM pictures WHERE pic = ?", [data.picture], function (err) {
			if (err) throw err;
			connection.query("SELECT profil_pic FROM users WHERE profil_pic = ? AND username = ? ", [data.picture, username], function (err, rows) {
				if (err) throw err;
				if (rows.length) {
					connection.query("UPDATE users SET profil_pic = DEFAULT WHERE username = ?", [username], function (err) {
						if (err) throw err;
					})
				}
			});
		})
		fs.unlinkSync("./public/" + data.picture + "");
	});
});