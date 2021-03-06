/*     D  E  C  L  A  R  A  T  I  O  N  S    */
var fs = require('fs');
var https = require('https');
var express = require('express');
var path = require('path');
var options = {
	key: fs.readFileSync('certificates/server.key')
	, cert: fs.readFileSync('certificates/server.crt')
	, ca: fs.readFileSync('certificates/server.csr')
, };
var app = express();
var mysql = require('mysql');
var connection = mysql.createConnection({
	port: 3307
	, host: 'localhost'
	, user: 'root'
	, password: 'root'
, });
var bodyParser = require('body-parser');
var mustacheExpress = require('mustache-express');
var create_account = require('./server/create_Account');
var profile = require('./server/profile');
var index = require("./server/index");
var moment = require('moment');
var md5 = require('sha256');
var uniqid = require('uniqid');
var geoip = require('geoip-lite');
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
var cookie = require('cookie')
var cookieParser = require('cookie-parser');
const publicIp = require('public-ip');
/*     S Q L    C  O  N  N  E  X  I  O  N  S    */
connection.connect(function (err) {
	if (err) throw err;
});
connection.query("CREATE DATABASE IF NOT EXISTS matcha CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`users` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `firstname` VARCHAR(255) NOT NULL , `lastname` VARCHAR(255) NOT NULL , `username` VARCHAR(255) NOT NULL , `birthday` DATE NOT NULL , `email` VARCHAR(255) NOT NULL , `password` VARCHAR(255) NOT NULL , `sexe` VARCHAR(8) NOT NULL , `token` VARCHAR(255) NOT NULL , `validation` VARCHAR(1) NOT NULL DEFAULT '0' ,  `profil_pic` LONGTEXT DEFAULT NULL, `sexual_or` VARCHAR(10) NOT NULL DEFAULT 'bi' , `bio` VARCHAR(255) DEFAULT NULL , `location` VARCHAR(255) DEFAULT NULL, `currlat` DECIMAL(11, 8) DEFAULT NULL, `currlong` DECIMAL( 11, 8 ) DEFAULT NULL, `pop` INT(5) DEFAULT '0', login VARCHAR(255), `sessionID` VARCHAR(255) DEFAULT NULL, `socket_id` VARCHAR(255) DEFAULT NULL, PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4  COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`pictures` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `pic` LONGTEXT NOT NULL , `username` VARCHAR(255) NOT NULL,  PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`history` ( `visitor` VARCHAR(255) NOT NULL , `visited` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`liking` ( `liker` VARCHAR(255) NOT NULL , `liked` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`reports` ( `reporter` VARCHAR(255) NOT NULL , `reported` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`tags` ( `tag` VARCHAR(255) NOT NULL , `username` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`matchs` ( `matcher` VARCHAR(255) NOT NULL , `matched` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`block` ( `block_by` VARCHAR(255) NOT NULL , `blocked` VARCHAR(255) NOT NULL , `id` INT(5) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`notification` (`id` INT(5) NOT NULL AUTO_INCREMENT, `sender` VARCHAR(255) NOT NULL , `sended` VARCHAR(255) NOT NULL, `content` VARCHAR(255) NOT NULL, `date` VARCHAR(255) NOT NULL,`seen` INT(1) NOT NULL DEFAULT '0', PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`dictionary` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `value` VARCHAR(255) NOT NULL , `score` INT(5) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB  CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`messages` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `sender` VARCHAR(255) DEFAULT NULL , `reciever` VARCHAR(255) DEFAULT NULL , `message` TEXT DEFAULT NULL ,`room` INT(5) DEFAULT NULL,  PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;");
connection = mysql.createPool({
	connectionLimit: 100
	, port: 3307
	, host: 'localhost'
	, user: 'root'
	, password: 'root'
	, database: 'matcha'
	, charset: 'utf8mb4'
});
/*     P  A  G  E  S      R  E  Q  U  E  S  T  S     -     E X P R E S S     */
app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', __dirname + '/views/');
app.use(express.static('public/'));
app.use(bodyParser.urlencoded({
	extended: true
}));
app.use(session(sess));
app.get('/', function (req, res) {
	connection.query("SELECT * FROM users WHERE sessionID = ?", [req.sessionID], function (err, connect) {
		if (err) throw err;
		if (!connect[0]) {
			res.render("index.html", {})
		}
		else {
			res.redirect("/profile.html");
		}
	})
});
app.get('/search', function (req, res) {
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		if (req.query.submit) {
			var people = [];
			var age_min = 18;
			var age_max = 120;
			var pop_min = 0;
			var pop_max = 1000;
			var loc_min = 0;
			var loc_max = 150;
			var tag_min = 0;
			var tag_max = 50;
			var tag_me = [];
			var tag_tofind = [];
			var firstword = req.query.search[0].split(" ")[0];
			var lastword = req.query.search[0].split(" ")[1];
			connection.query("SELECT * FROM users WHERE username = ?", [req.session.username], function (err, row) {
				if (err) throw err;
				if (!row[0].profil_pic) {
					res.redirect("/edit_profil.html");
				}
				connection.query("SELECT tag FROM tags WHERE username= ?", [req.session.username], function (err, tags) {
					if (tags[0]) {
						for (var p in tags) {
							tag_me[p] = tags[p].tag;
						}
					}
					if (req.query.pop) {
						pop_min = req.query.pop.split(";")[0];
						pop_max = req.query.pop.split(";")[1];
					}
					if (req.query.loc) {
						loc_min = req.query.loc.split(";")[0];
						loc_max = req.query.loc.split(";")[1];
					}
					if (req.query.age) {
						age_min = req.query.age.split(";")[0];
						age_max = req.query.age.split(";")[1];
					}
					if (req.query.tag) {
						tag_min = req.query.tag.split(";")[0];
						tag_max = req.query.tag.split(";")[1];
					}
					if (firstword && lastword) {
						connection.query('SELECT * FROM users WHERE (pop BETWEEN ? AND ?) AND   ((firstname like "%' + firstword + '%" AND lastname like "%' + lastword + '%") OR (firstname like "%' + lastword + '%" AND lastname like "%' + firstword + '%")) AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?)', [pop_min, pop_max, req.session.username], function (err, rows) {
							if (err) throw err;
							else {
								(function (callback) {
									if (rows[0]) {
										for (var k in rows) {
											var z = 0;
											rows[k].birth = profile.age(rows[k].birthday);
											rows[k].communtag = 0;
											rows[k].distance = getDistanceFromLatLonInKm(row[0].currlat, row[0].currlong, rows[k].currlat, rows[k].currlong);
											(function (k) {
												connection.query("SELECT tag FROM tags WHERE username = ?", [rows[k].username], function (err, tagstofind) {
													for (var a in tagstofind) {
														if (tag_me.includes(tagstofind[a].tag) === true) {
															rows[k].communtag = rows[k].communtag + 1;
														}
													}
													if (Number(rows[k].birth) >= Number(age_min) && Number(rows[k].birth) <= Number(age_max)) {
														if (Number(rows[k].communtag) >= Number(tag_min) && Number(rows[k].communtag) <= Number(tag_max)) {
															if (Number(rows[k].distance) >= Number(loc_min) && Number(rows[k].distance) <= Number(loc_max)) {
																people[z] = rows[k];
																z++;
															}
														}
													}
													if (!rows[Number(k) + 1]) {
														callback(people);
													}
												})
											})(k);
										}
									}
									else {
										callback(people);
									}
								})(function (people) {
									if (people[0]) {
										res.render("search.html", {
											search: req.query.search[0]
											, homepage: {
												infos: people
											}
										})
									}
									else {
										res.render("search.html", {
											search: req.query.search[0]
											, message: "Nobody match this paramters"
										})
									}
								})
							}
						})
					}
					else if (firstword && !lastword) {
						connection.query('SELECT * FROM users WHERE (pop BETWEEN ? AND ?) AND ( firstname like "%' + firstword + '%"  OR  lastname like "%' + firstword + '%") AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?)', [pop_min, pop_max, req.session.username], function (err, rows) {
							if (err) throw err;
							else {
								(function (callback) {
									if (rows[0]) {
										for (var k in rows) {
											var z = 0;
											rows[k].birth = profile.age(rows[k].birthday);
											rows[k].communtag = 0;
											rows[k].distance = getDistanceFromLatLonInKm(row[0].currlat, row[0].currlong, rows[k].currlat, rows[k].currlong);
											(function (k) {
												connection.query("SELECT tag FROM tags WHERE username = ?", [rows[k].username], function (err, tagstofind) {
													for (var a in tagstofind) {
														if (tag_me.includes(tagstofind[a].tag) === true) {
															rows[k].communtag = rows[k].communtag + 1;
														}
													}
													if (Number(rows[k].birth) >= Number(age_min) && Number(rows[k].birth) <= Number(age_max)) {
														if (Number(rows[k].communtag) >= Number(tag_min) && Number(rows[k].communtag) <= Number(tag_max)) {
															if (Number(rows[k].distance) >= Number(loc_min) && Number(rows[k].distance) <= Number(loc_max)) {
																people[z] = rows[k];
																z++;
															}
														}
													}
													if (!rows[Number(k) + 1]) {
														callback(people);
													}
												})
											})(k);
										}
									}
									else {
										callback(people);
									}
								})(function (people) {
									if (people[0]) {
										res.render("search.html", {
											search: req.query.search[0]
											, homepage: {
												infos: people
											}
										})
									}
									else {
										res.render("search.html", {
											search: req.query.search[0]
											, message: "Nobody match this paramaters"
										})
									}
								})
							}
						})
					}
				})
			})
		}
		else if (req.query.key) {
			var data = [];
			connection.query('SELECT firstname,lastname from users where (firstname like "%' + req.query.key + '%" OR lastname like "%' + req.query.key + '%") AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?) AND username != ?', [req.session.username, req.session.username], function (err, rows, fields) {
				if (err) throw err;
				for (i = 0; i < rows.length; i++) {
					data.push(rows[i].firstname + " " + rows[i].lastname);
				}
				res.json(data);
			});
		}
		else if (req.query.search) {
			var firstword = req.query.search[0].split(" ")[0];
			var lastword = req.query.search[0].split(" ")[1];
			var tag_me = [];
			var tag_tofind = [];
			connection.query("SELECT tag FROM tags WHERE username= ?", [req.session.username], function (err, tags) {
				if (tags[0]) {
					for (var p in tags) {
						tag_me[p] = tags[p].tag;
					}
				}
				if (firstword && lastword) {
					var tag_tofind = [];
					connection.query("SELECT username FROM users WHERE ((firstname = ? AND lastname = ?) OR (firstname = ? AND lastname = ?)) AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?)  AND username != ?", [firstword, lastword, lastword, firstword, req.session.username, req.session.username], function (err, rows) {
						if (err) throw err;
						if (rows[0] && !rows[1]) {
							if (rows[0].username === req.session.username) {
								res.redirect('/profile.html');
							}
							else {
								res.redirect('/users.html/' + rows[0].username)
							}
						}
						else {
							connection.query('SELECT * from users where ((firstname like "%' + firstword + '%" AND lastname like "%' + lastword + '%") OR (firstname like "%' + lastword + '%" AND lastname like "%' + firstword + '%")) AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?) AND username != ?', [req.session.username, req.session.username], function (err, rows) {
								if (err) throw err;
								if (!rows[0]) {
									res.render("search.html", {
										message: "Nobobdy match this name"
									})
								}
								else {
									(function (callback) {
										for (var k in rows) {
											var z = 0;
											rows[k].birth = profile.age(rows[k].birthday);
											rows[k].communtag = 0;
											(function (k) {
												connection.query("SELECT tag FROM tags WHERE username = ?", [rows[k].username], function (err, tagstofind) {
													for (var a in tagstofind) {
														if (tag_me.includes(tagstofind[a].tag) === true) {
															rows[k].communtag = rows[k].communtag + 1;
														}
													}
													if (!rows[Number(k) + 1]) {
														callback(rows);
													}
												})
											})(k);
										}
									})(function (people) {
										res.render("search.html", {
											search: req.query.search[0]
											, homepage: {
												infos: rows
											}
										})
									})
								}
							})
						}
					})
				}
				else if (firstword && !lastword) {
					connection.query("SELECT username FROM users WHERE (firstname = ?  OR  lastname = ?) AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?) AND username != ?", [firstword, firstword, req.session.username, req.session.username], function (err, rows) {
						if (err) throw err;
						if (rows[0] && !rows[1]) {
							if (rows[0].username === req.session.username) {
								res.redirect('/profile.html');
							}
							else {
								res.redirect('/users.html/' + rows[0].username)
							}
						}
						else {
							connection.query('SELECT * from users where (firstname like "%' + firstword + '%"  OR  lastname like "%' + firstword + '%") AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?) AND username != ?', [req.session.username, req.session.username], function (err, rows) {
								if (err) throw err;
								if (!rows[0]) {
									res.render("search.html", {
										message: "Nobobdy match this name"
									})
								}
								else {
									(function (callback) {
										for (var k in rows) {
											var z = 0;
											rows[k].birth = profile.age(rows[k].birthday);
											rows[k].communtag = 0;
											(function (k) {
												connection.query("SELECT tag FROM tags WHERE username = ?", [rows[k].username], function (err, tagstofind) {
													for (var a in tagstofind) {
														if (tag_me.includes(tagstofind[a].tag) === true) {
															rows[k].communtag = rows[k].communtag + 1;
														}
													}
													if (!rows[Number(k) + 1]) {
														callback(rows);
													}
												})
											})(k);
										}
									})(function (people) {
										res.render("search.html", {
											search: req.query.search[0]
											, homepage: {
												infos: rows
											}
										})
									})
								}
							})
						}
					})
				}
				else {
					res.redirect(req.get('referer'));
				}
			})
		}
	}
});
app.get('/hashtags.html', function (req, res) {
	if (req.session.username) {
		connection.query("SELECT DISTINCT * FROM dictionary ORDER BY value", function (err, rows) {
			if (err) throw err;
			else {
				res.render('hashtags.html', {
					dictionary: {
						value: rows
					}
				})
			}
		})
	}
	else {
		res.redirect('/');
	}
});
app.get('/hashtags/:data', function (req, res) {
	if (req.session.username) {
		if (!req.params.data) {
			res.redirect('/hashtags.html')
		}
		if (req.params.data === 'number') {
			connection.query("SELECT DISTINCT * FROM dictionary WHERE value REGEXP  '[0-9]' ORDER BY value", function (err, rows) {
				if (err) throw err;
				else {
					res.render('hashtags.html', {
						dictionary: {
							value: rows
						}
					})
				}
			})
		}
		else {
			connection.query("SELECT DISTINCT * FROM dictionary WHERE substr(value, 1, 1) = ? ORDER BY value", [req.params.data], function (err, rows) {
				if (err) throw err;
				else {
					res.render('hashtags.html', {
						dictionary: {
							value: rows
						}
					})
				}
			})
		}
	}
	else {
		res.redirect('/');
	}
});
app.get('/addtag/:data', function (req, res) {
	if (req.session.username) {
		if (!req.params.data) {
			res.redirect('/hashtags.html')
		}
		else {
			connection.query("SELECT * FROM tags WHERE tag = ? AND username = ?", [req.params.data, req.session.username], function (err, rows) {
				if (err) throw err;
				if (rows[0]) {
					res.render('hashtags.html', {
						message: '<div class="message-ret">Tag already used</div>'
					})
				}
				else {
					connection.query("INSERT INTO tags(tag, username) VALUES(?,?)", [req.params.data, req.session.username], function (err) {
						if (err) throw err;
						else {
							res.render('hashtags.html', {
								message: '<div class="message-ret">Tag added</div>'
							})
						}
					})
				}
			})
		}
	}
	else {
		res.redirect('/');
	}
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
					connection.query("SELECT * FROM users WHERE sessionID = ?", [req.sessionID], function (err, connect) {
						if (err) throw err;
						if (!connect[0]) {
							connection.query("UPDATE users SET sessionID = ? WHERE username = ?", [req.sessionID, req.body.username], function (err) {
								if (err) throw err;
							})
							req.session.username = rows[0].username;
							req.session.firstname = rows[0].firstname;
							req.session.lastname = rows[0].lastname;
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
						else {
							req.session.username = connect[0].username;
							req.session.firstname = connect[0].firstname;
							req.session.lastname = connect[0].lastname;
							req.session.sexual_or = connect[0].sexual_or;
							req.session.sexe = connect[0].sexe;
							req.session.profil_pic = connect[0].profil_pic;
							req.session.email = connect[0].email;
							req.session.token = connect[0].token;
							res.redirect("/profile.html");
						}
					})
				}
			}
			else {
				res.render("index.html", {
					message: "This user isn't register"
				})
			}
		})
		connection.query("SELECT * FROM users WHERE username = ? AND password = ?", [req.body.username, md5(req.body.password)], function (err, rows) {
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
	req.body.firstname = req.body.firstname.trim();
	req.body.lastname = req.body.lastname.trim();
	req.body.birthday = req.body.birthday.trim();
	req.body.username = req.body.username.trim();
	req.body.email = req.body.email.trim();
	req.body.confirm_email = req.body.confirm_email.trim();
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
				infos.location = rows[0].location;
				if (rows[0].bio) infos.bio = rows[0].bio;
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
	(function (callback) {
		upload(req, res, function (err) {
			connection.query("SELECT * FROM pictures WHERE username = ?", [req.session.username], function (err, rows) {
				if (err) throw err;
				var cropped = 'upload/' + req.session.username + '-' + uniqid() + '.png';
				if (req.fileValidationError) {
					infos.messagephoto = 'Wrong file type : File not uploaded';
					callback(infos, rows);
				}
				else if (req.file) {
					if (err) {
						infos.messagephoto = 'A problem occurs : File not uploaded';
						callback(infos, rows);
					}
					else {
						sharp(req.file.path).resize(500, 500).toFile('public/' + cropped, function (err) {
							if (err) {
								infos.messagephoto = "Unsupported image format";
								callback(infos, rows);
							}
							else {
								fs.unlinkSync(req.file.path);
								if (!req.session.profil_pic) {
									connection.query("UPDATE users SET profil_pic = ? WHERE username = ?", [cropped, req.session.username], function (err) {
										if (err) throw err;
									})
									req.session.profil_pic = cropped;
								}
								if (rows.length < 5) {
									connection.query("INSERT INTO pictures(pic, username) VALUES(?,?)", [cropped, req.session.username], function (err) {
										if (err) throw err;
									})
									connection.query("SELECT * FROM pictures WHERE username = ?", [req.session.username], function (err, pics) {
										if (err) throw err;
										infos.messagephoto = 'File uploaded';
										callback(infos, pics)
									})
								}
								else {
									infos.messagephoto = "You can have only 5 pictures";
									callback(infos, rows);
								}
							}
						});
					}
				}
				else {
					connection.query("SELECT * FROM pictures WHERE username = ?", [req.session.username], function (err, rows) {
						if (err) throw err;
						infos.messagephoto = "You haven't select a picture";
						callback(infos, rows);
					});
				}
			})
		})
	})(function (infos, rows) {
		res.render('edit_profil.html', {
			edit_profil: {
				infos: infos
			}
			, display_pictures_edit: {
				infos: rows
			}
		});
	})
});
app.post('/update', function (req, res) {
	var infos = {};
	var hashtag = [];
	var results = [];
	infos.messageprofil = "Nothing to update";
	(function (callback) {
		if (req.body.preferences) {
			var res = req.body.preferences.trim().split(" ");
			for (var k in res) {
				hashtag[k] = res[k].split("#");
				hashtag[k] = create_account.cleanArray(hashtag[k]);
			}
			var j = 0;
			for (var k in hashtag) {
				for (var i in hashtag[k]) {
					results[j] = hashtag[k][i];
					j++
				}
			}
			results = create_account.find_duplicates(results);
			for (var k in results) {
				(function (k) {
					connection.query("SELECT * FROM tags WHERE tag = ? AND username = ?", [results[k], req.session.username], function (err, rows) {
						if (err) throw err;
						if (results[k]) {
							if (!rows[0]) {
								connection.query("INSERT INTO tags(tag, username) VALUES(?,?)", [results[k], req.session.username], function (err) {
									if (err) throw err;
								})
							}
							connection.query('SELECT * FROM dictionary WHERE value = ?', [results[k]], function (err, row_dic) {
								if (err) throw err;
								if (!row_dic[0]) {
									connection.query("INSERT INTO dictionary(value, score) VALUES(?,1)", [results[k]], function (err) {
										if (err) throw err;
									})
								}
								if (row_dic[0]) {
									connection.query("UPDATE dictionary SET score = score + 1 WHERE value = ?", [row_dic[0].value], function (err) {
										if (err) throw err;
									})
								}
							})
						}
					})
				})(k);
			}
			infos.messageprofil = "Profil has been updated";
		}
		if (req.body.firstname) {
			connection.query("UPDATE users SET firstname = ? WHERE username = ?", [req.body.firstname, req.session.username], function (err) {
				if (err) throw err;
				else {
					req.session.firstname = req.body.firstname
				}
			});
			infos.messageprofil = "Profil has been updated";
		}
		if (req.body.lastname) {
			connection.query("UPDATE users SET lastname = ? WHERE username = ?", [req.body.lastname, req.session.username], function (err) {
				if (err) throw err;
				else {
					req.session.lastname = req.body.lastname
				}
			});
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
				else {
					req.session.sexual_or = req.body.orientation
				}
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
		var people = [];
		var age_min = 18;
		var age_max = 120;
		var pop_min = 0;
		var pop_max = 1000;
		var loc_min = 0;
		var loc_max = 150;
		var tag_min = 0;
		var tag_max = 50;
		var tag_me = [];
		var sexe_tomatch;
		var sexe_tonotmatch;
		connection.query("SELECT * FROM users WHERE username = ?", [req.session.username], function (err, row) {
			if (err) throw err;
			if (!row[0].profil_pic) {
				res.redirect("/edit_profil.html");
			}
			else {
				connection.query("SELECT tag FROM tags WHERE username= ?", [req.session.username], function (err, tags) {
					for (var p in tags) {
						tag_me[p] = tags[p].tag;
					}
					if (req.query.pop) {
						pop_min = req.query.pop.split(";")[0];
						pop_max = req.query.pop.split(";")[1];
					}
					if (req.query.loc) {
						loc_min = req.query.loc.split(";")[0];
						loc_max = req.query.loc.split(";")[1];
					}
					if (req.query.age) {
						age_min = req.query.age.split(";")[0];
						age_max = req.query.age.split(";")[1];
					}
					if (req.query.tag) {
						tag_min = req.query.tag.split(";")[0];
						tag_max = req.query.tag.split(";")[1];
					}
					if (req.session.sexe === "male") {
						if (req.session.sexual_or === "bi") {
							sexe_tonotmatch = ["male", "hetero", "female", "gay"]
						}
						else if (req.session.sexual_or === "hetero") {
							sexe_tomatch = ["female", "hetero", "bi"];
						}
						else if (req.session.sexual_or === "gay") {
							sexe_tomatch = ["male", "gay", "bi"];
						}
					}
					else if (req.session.sexe === "female") {
						if (req.session.sexual_or === "bi") {
							sexe_tonotmatch = ["female", "hetero", "male", "gay"]
						}
						else if (req.session.sexual_or === "hetero") {
							sexe_tomatch = ["male", "hetero", "bi"];
						}
						else if (req.session.sexual_or === "gay") {
							sexe_tomatch = ["female", "gay", "bi"];
						}
					}
					if (sexe_tomatch) {
						connection.query("SELECT * FROM users WHERE (pop BETWEEN ? AND ?) AND username != ? AND profil_pic is not null AND (sexe = ? AND (sexual_or = ? OR sexual_or = ?)) AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?)", [pop_min, pop_max, req.session.username, sexe_tomatch[0], sexe_tomatch[1], sexe_tomatch[2], req.session.username], function (err, rows) {
							if (err) throw err;
							else {
								(function (callback) {
									var z = 0;
									if (rows[0]) {
										for (var k in rows) {
											rows[k].distance = getDistanceFromLatLonInKm(row[0].currlat, row[0].currlong, rows[k].currlat, rows[k].currlong);
											rows[k].birth = profile.age(rows[k].birthday);
											rows[k].communtag = 0;
											(function (k) {
												connection.query("SELECT tag FROM tags WHERE username = ?", [rows[k].username], function (err, tagstofind) {
													for (var a in tagstofind) {
														if (tag_me.includes(tagstofind[a].tag) === true) {
															rows[k].communtag = rows[k].communtag + 1;
														}
													}
													if (Number(rows[k].birth) >= Number(age_min) && Number(rows[k].birth) <= Number(age_max)) {
														if (Number(rows[k].communtag) >= Number(tag_min) && Number(rows[k].communtag) <= Number(tag_max)) {
															if (Number(rows[k].distance) >= Number(loc_min) && Number(rows[k].distance) <= Number(loc_max)) {
																people[z] = rows[k];
																z++;
															}
														}
													}
													if (!rows[Number(k) + 1]) {
														callback(people);
													}
												})
											})(k);
										}
									}
									else {
										callback(people);
									}
								})(function (people) {
									if (people[0]) {
										res.render("match.html", {
											homepage: {
												infos: people
											}
										})
									}
									else {
										res.render("match.html", {
											message: "nobody match your profil"
										})
									}
								})
							}
						})
					}
					else if (sexe_tonotmatch) {
						connection.query("SELECT * FROM users WHERE (pop BETWEEN ? AND ?) AND username != ? AND profil_pic is not null AND ((sexe = ? AND sexual_or != ?) OR (sexe = ? AND sexual_or != ?)) AND  username NOT IN (SELECT blocked FROM block WHERE block_by = ?)", [pop_min, pop_max, req.session.username, sexe_tonotmatch[0], sexe_tonotmatch[1], sexe_tonotmatch[2], sexe_tonotmatch[3], req.session.username], function (err, rows) {
							if (err) throw err;
							else {
								(function (callback) {
									var z = 0;
									if (rows[0]) {
										for (var k in rows) {
											rows[k].birth = profile.age(rows[k].birthday);
											rows[k].communtag = 0;
											(function (k) {
												connection.query("SELECT tag FROM tags WHERE username = ?", [rows[k].username], function (err, tagstofind) {
													for (var a in tagstofind) {
														if (tag_me.includes(tagstofind[a].tag) === true) {
															rows[k].communtag = rows[k].communtag + 1;
														}
													}
													if (Number(rows[k].birth) >= Number(age_min) && Number(rows[k].birth) <= Number(age_max)) {
														if (Number(rows[k].communtag) >= Number(tag_min) && Number(rows[k].communtag) <= Number(tag_max)) {
															people[z] = rows[k];
															z++;
														}
													}
													if (!rows[Number(k) + 1]) {
														callback(people);
													}
												})
											})(k);
										}
									}
									else {
										callback(people);
									}
								})(function (people) {
									if (people[0]) {
										res.render("match.html", {
											homepage: {
												infos: people
											}
										})
									}
									else {
										res.render("match.html", {
											message: "nobody match your profil"
										})
									}
								})
							}
						})
					}
				})
			}
		})
	}
});
app.get("/match_people.html", function (req, res) {
	var infos = [];
	var infos_tmp = [];
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM matchs WHERE matcher = ? OR matched = ? ", [req.session.username, req.session.username], function (err, rows) {
			if (err) throw err;
			if (rows[0]) {
				for (var k in rows) {
					(function (k) {
						if (rows[k].matcher !== req.session.username) infos_tmp[k] = rows[k].matcher;
						else if (rows[k].matched !== req.session.username) infos_tmp[k] = rows[k].matched;
					})(k);
				}
				for (var j in infos_tmp) {
					(function (j, callback) {
						connection.query("SELECT * FROM users WHERE username = ?", [infos_tmp[j]], function (err, data) {
							infos[j] = data[0];
							infos[j].birth = profile.age(data[0].birthday);
							if (!infos_tmp[Number(j) + 1]) {
								callback();
							}
						})
					})(j, function () {
						res.render("result.html", {
							result: {
								infos: infos
							}
						})
					});
				}
			}
			else {
				res.render("result.html", {
					message: "You match with nobody"
				});
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
					connection.query("SELECT tag FROM tags WHERE username = ?", [req.session.username], function (err, tags) {
						if (err) throw err;
						res.render("profile.html", {
							profile: {
								infos: infos
							}
							, display_pictures: {
								infos: row
							}
							, display_tags: {
								infos: tags
							}
						});
					})
				})
			}
		})
	}
});
app.get('/users.html/:user', function (req, res) {
	var infos = [];
	if (!req.session.username) {
		res.redirect('/');
	}
	else {
		if (req.params.user === req.session.username) {
			res.redirect('/profile.html');
		}
		else {
			connection.query("SELECT * FROM block WHERE block_by = ? AND blocked = ?", [req.params.user, req.session.username], function (err, blocked) {
				if (err) throw err;
				if (!blocked[0]) {
					var content = req.session.firstname + " " + req.session.lastname + " visited your profil";
					var date = new Date().toISOString().slice(0, 10);
					var date = date + " " + new Date().getHours() + " : " + new Date().getMinutes();
					connection.query("INSERT INTO notification(sender,sended,content, date) VALUES(?,?,?, ?)", [req.session.username, req.params.user, content, date], function (err) {
						if (err) throw err;
					})
				}
			})
			connection.query("SELECT * FROM history WHERE visitor = ? AND visited = ?", [req.session.username, req.params.user], function (err, rows) {
				if (err) throw err;
				if (!rows[0]) {
					connection.query("UPDATE users SET pop = pop + 2 WHERE username = ?", [req.params.user], function (err) {
						if (err) throw err;
						infos.pop = infos.pop + 2;
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
					infos = rows[0];
					infos.birth = profile.age(rows[0].birthday);
					connection.query("SELECT * FROM liking WHERE liker = ? AND liked = ?", [req.session.username, req.params.user], function (err, data) {
						if (err) throw err;
						connection.query("SELECT * FROM liking WHERE liker = ? AND liked = ?", [req.params.user, req.session.username], function (err, liker) {
							if (err) throw err;
							connection.query("SELECT * FROM matchs WHERE (matcher = ? AND matched = ?) OR (matcher = ? AND matched = ?)", [req.session.username, req.params.user, req.params.user, req.session.username], function (err, match) {
								connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, row) {
									if (err) throw err;
									connection.query("SELECT tag FROM tags WHERE username =?", [req.params.user], function (err, tags) {
										if (err) throw err;
										if (data[0]) {
											infos.follow = "you like " + rows[0].firstname;
										}
										if (liker[0]) {
											infos.follow = rows[0].firstname + " likes your profil";
										}
										if (match[0]) {
											infos.follow = "you match with " + rows[0].firstname;
										}
										res.render('users.html', {
											users: {
												infos: infos
											}
											, display_pictures_users: {
												infos: row
											}
											, display_public_tags: {
												infos: tags
											}
										});
									})
								});
							});
						});
					});
				}
			});
		}
	}
});
var infos = {};
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
				infos = rows[0];
				var pov = req.body.pov;
				if (pov === "follow") {
					connection.query("SELECT * FROM block WHERE block_by = ? AND blocked = ?", [req.session.username, req.params.user], function (err, block) {
						if (err) throw err;
						if (!block[0]) {
							connection.query("SELECT * FROM liking WHERE liker = ? AND liked = ?", [req.session.username, req.params.user], function (err, row) {
								if (err) throw err;
								if (!row[0]) {
									connection.query("SELECT * FROM block WHERE block_by = ? AND blocked = ?", [req.params.user, req.session.username], function (err, blocked) {
										if (err) throw err;
										if (!blocked[0]) {
											var content = req.session.firstname + " " + req.session.lastname + " liked your profil";
											var date = new Date().toISOString().slice(0, 10);
											var date = date + " " + new Date().getHours() + " : " + new Date().getMinutes();
											connection.query("INSERT INTO notification(sender,sended,content, date) VALUES(?,?,?, ?)", [req.session.username, req.params.user, content, date], function (err) {
												if (err) throw err;
											})
										}
									})
									connection.query("INSERT INTO liking(liker, liked) VALUES(?,?)", [req.session.username, req.params.user], function (err) {
										if (err) throw err;
									});
									connection.query("UPDATE users SET pop = pop + 5 WHERE username = ?", [req.params.user], function (err) {
										if (err) throw err;
									})
									infos.follow = "you like " + rows[0].firstname;
									infos.pop += 5;
								}
								else if (row[0]) {
									infos.follow = "you already like " + rows[0].firstname;
								}
								connection.query("SELECT * FROM liking WHERE liker = ? AND liked = ?", [req.params.user, req.session.username], function (err, data) {
									if (err) throw err;
									connection.query("SELECT * FROM matchs WHERE (matcher = ? AND matched = ?) OR (matcher = ? AND matched = ?)", [req.session.username, req.params.user, req.params.user, req.session.username], function (err, match) {
										if (err) throw err;
										if (data[0]) {
											if (!match[0]) {
												connection.query("INSERT INTO matchs(matcher, matched) VALUES(?,?)", [req.session.username, req.params.user], function (err) {
													if (err) throw err;
												});
												connection.query("UPDATE users SET pop = pop + 10 WHERE username = ?", [req.params.user], function (err) {
													if (err) throw err;
												})
												connection.query("UPDATE users SET pop = pop + 10 WHERE username = ?", [req.session.username], function (err) {
													if (err) throw err;
												})
												infos.follow = "you match with " + rows[0].firstname;
												infos.pop += 10;
											}
											else if (match[0]) {
												infos.follow = "you already match with " + rows[0].firstname;
											}
										}
										infos.birth = profile.age(rows[0].birthday);
										connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, row) {
											if (err) throw err;
											connection.query("SELECT tag FROM tags WHERE username = ?", [req.params.user], function (err, tags) {
												if (err) throw err;
												res.render('users.html', {
													users: {
														infos: infos
													}
													, display_pictures_users: {
														infos: row
													}
													, display_public_tags: {
														infos: tags
													}
												});
											})
										})
									})
								})
							})
						}
						else {
							infos.follow = "You can't like this profil because you block it";
							infos.birth = profile.age(infos.birthday);
							connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, row) {
								if (err) throw err;
								connection.query("SELECT tag FROM tags WHERE username = ?", [req.params.user], function (err, tags) {
									if (err) throw err;
									res.render('users.html', {
										users: {
											infos: infos
										}
										, display_pictures_users: {
											infos: row
										}
										, display_public_tags: {
											infos: tags
										}
									});
								})
							})
						}
					})
				}
				else if (pov === "unfollow") {
					connection.query("SELECT * FROM block WHERE block_by = ? AND blocked = ?", [req.session.username, req.params.user], function (err, block) {
						if (err) throw err;
						if (!block[0]) {
							connection.query("SELECT * FROM liking WHERE liker = ? AND liked = ?", [req.session.username, req.params.user], function (err, row) {
								if (err) throw err;
								if (row[0]) {
									connection.query("SELECT * FROM block WHERE block_by = ? AND blocked = ?", [req.params.user, req.session.username], function (err, blocked) {
										if (err) throw err;
										if (!blocked[0]) {
											var content = req.session.firstname + " " + req.session.lastname + " don't liked your profil";
											var date = new Date().toISOString().slice(0, 10);
											var date = date + " " + new Date().getHours() + " : " + new Date().getMinutes();
											connection.query("INSERT INTO notification(sender,sended,content, date) VALUES(?,?,?, ?)", [req.session.username, req.params.user, content, date], function (err) {
												if (err) throw err;
											})
										}
									})
									connection.query("DELETE FROM liking WHERE liker=? AND liked = ?", [req.session.username, req.params.user], function (err) {
										if (err) throw err;
									});
									if (infos.pop >= 5) {
										connection.query("UPDATE users SET pop =pop - 5 WHERE username = ?", [req.params.user], function (err) {
											if (err) throw err;
										})
										infos.pop -= 5;
									}
									else {
										connection.query("UPDATE users SET pop = 0 WHERE username = ?", [req.params.user], function (err) {
											if (err) throw err;
										})
										infos.pop = 0;
									}
								}
								else {
									infos.follow = "you already unfollow " + rows[0].firstname;
								}
							})
							connection.query("SELECT * FROM matchs WHERE (matcher = ? AND matched = ?) OR (matcher = ? AND matched = ?)", [req.session.username, req.params.user, req.params.user, req.session.username], function (err, rows) {
								if (err) throw err;
								if (rows[0]) {
									connection.query("DELETE FROM matchs WHERE  (matcher = ? AND matched = ?) OR (matcher = ? AND matched = ?)", [req.session.username, req.params.user, req.params.user, req.session.username], function (err) {
										if (err) throw err;
										connection.query("DELETE  FROM messages WHERE room = ?", [rows[0].id], function (err) {
											if (err) throw err;
										})
									});
									if (infos.pop >= 10) {
										connection.query("UPDATE users SET pop =pop - 10 WHERE username = ?", [req.params.user], function (err) {
											if (err) throw err;
										})
										infos.pop -= 10;
									}
									else {
										connection.query("UPDATE users SET pop = 0 WHERE username = ?", [req.params.user], function (err) {
											if (err) throw err;
										})
										infos.pop = 0;
									}
								}
							})
							infos.follow = "you do not like " + rows[0].firstname + " anymore";
							infos.birth = profile.age(rows[0].birthday);
							connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, row) {
								if (err) throw err;
								connection.query("SELECT tag FROM tags WHERE username = ?", [req.params.user], function (err, tags) {
									if (err) throw err;
									res.render('users.html', {
										users: {
											infos: infos
										}
										, display_pictures_users: {
											infos: row
										}
										, display_public_tags: {
											infos: tags
										}
									});
								})
							})
						}
						else {
							infos.follow = "You can't unlike this profil because you block it";
							infos.birth = profile.age(infos.birthday);
							connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, row) {
								if (err) throw err;
								connection.query("SELECT tag FROM tags WHERE username = ?", [req.params.user], function (err, tags) {
									if (err) throw err;
									res.render('users.html', {
										users: {
											infos: infos
										}
										, display_pictures_users: {
											infos: row
										}
										, display_public_tags: {
											infos: tags
										}
									});
								})
							})
						}
					})
				}
				else if (pov === "reported") {
					connection.query("SELECT * FROM reports WHERE reporter = ? AND reported = ?", [req.session.username, req.params.user], function (err, row) {
						if (err) throw err;
						if (!row[0]) {
							connection.query("INSERT INTO reports(reporter, reported) VALUES(?,?)", [req.session.username, req.params.user], function (err) {
								if (err) throw err;
							});
							if (infos.pop >= 5) {
								connection.query("UPDATE users SET pop = pop - 5 WHERE username = ?", [req.params.user], function (err) {
									if (err) throw err;
								})
							}
							else {
								connection.query("UPDATE users SET pop = 0 WHERE username = ?", [req.params.user], function (err) {
									if (err) throw err;
								})
							}
						}
					})
					if (infos.pop >= 5) {
						infos.pop -= 5;
					}
					else {
						infos.pop = 0;
					}
					infos.follow = "you report " + rows[0].firstname;
					infos.birth = profile.age(rows[0].birthday);
					connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, pic) {
						if (err) throw err;
						connection.query("SELECT tag FROM tags WHERE username = ?", [req.params.user], function (err, tags) {
							if (err) throw err;
							res.render('users.html', {
								users: {
									infos: infos
								}
								, display_pictures_users: {
									infos: pic
								}
								, display_public_tags: {
									infos: tags
								}
							});
						})
					})
				}
				else if (pov === "block") {
					connection.query("SELECT * FROM block WHERE block_by = ? AND blocked =?", [req.session.username, req.params.user], function (err, row) {
						if (err) throw err;
						if (!row[0]) {
							connection.query("INSERT INTO block(block_by, blocked) VALUES(?,?)", [req.session.username, req.params.user], function (err) {
								if (err) throw err;
							});
							connection.query("DELETE FROM matchs WHERE (matcher = ? AND matched = ?) OR (matcher =? AND matched = ?)", [req.params.user, req.session.username, req.session.username, req.params.user], function (err) {
								if (err) throw err;
							})
							connection.query("DELETE FROM liking WHERE (liker = ? AND liked = ?) OR (liker =? AND liked = ?)", [req.params.user, req.session.username, req.session.username, req.params.user], function (err) {
								if (err) throw err;
							})
							infos.follow = "you block " + rows[0].firstname;
							infos.birth = profile.age(rows[0].birthday);
							connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, pic) {
								if (err) throw err;
								connection.query("SELECT tag FROM tags WHERE username = ?", [req.params.user], function (err, tags) {
									if (err) throw err;
									res.render('users.html', {
										users: {
											infos: infos
										}
										, display_pictures_users: {
											infos: pic
										}
										, display_public_tags: {
											infos: tags
										}
									});
								})
							})
						}
						else {
							infos.follow = "You already block " + rows[0].firstname;
							infos.birth = profile.age(rows[0].birthday);
							connection.query("SELECT * FROM pictures WHERE username = ? AND pic != ?", [req.params.user, rows[0].profil_pic], function (err, pic) {
								if (err) throw err;
								connection.query("SELECT tag FROM tags WHERE username = ?", [req.params.user], function (err, tags) {
									if (err) throw err;
									res.render('users.html', {
										users: {
											infos: infos
										}
										, display_pictures_users: {
											infos: pic
										}
										, display_public_tags: {
											infos: tags
										}
									});
								})
							})
						}
					})
				}
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
	var regPass = new RegExp('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
	if (req.body.new && req.body.confirmation) {
		if (req.body.new === req.body.confirmation) {
			if (regPass.test(req.body.new)) {
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
				ret = 'Password too weak';
			}
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
		connection.query("UPDATE users SET login = ? WHERE username = ?", [new Date().toISOString().slice(0, 10), req.session.username], function (err) {
			if (err) throw err;
		});
		req.session.destroy();
		res.redirect("/");
	}
});
app.get("/message.html", function (req, res) {
	var infos = [];
	var infos_tmp = [];
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT profil_pic FROM users WHERE username= ?", [req.session.username], function (err, pic) {
			if (err) throw err;
			if (!pic[0].profil_pic) {
				res.redirect("/edit_profil.html");
			}
			else {
				connection.query("SELECT * FROM matchs WHERE matcher = ? OR matched = ? ", [req.session.username, req.session.username], function (err, rows) {
					if (err) throw err;
					if (rows[0]) {
						for (var k in rows) {
							(function (k, cllaback) {
								if (rows[k].matcher !== req.session.username) {
									infos_tmp[k] = {
										name: rows[k].matcher
										, id: rows[k].id
									}
								}
								else if (rows[k].matched !== req.session.username) {
									infos_tmp[k] = {
										name: rows[k].matched
										, id: rows[k].id
									}
								}
								if (!rows[Number(k + 1)]) {
									cllaback(infos_tmp);
								}
							})(k, function (infos_tmp) {
								for (var j in infos_tmp) {
									(function (j, callback) {
										connection.query("SELECT * FROM users WHERE username = ?", [infos_tmp[j].name], function (err, data) {
											connection.query("SELECT COUNT(*) as nbr_notif FROM notification WHERE sender = ? AND sended = ?and RIGHT(content, 7) = 'message'", [infos_tmp[j].name, req.session.username], function (err, notif) {
												infos[j] = data[0];
												infos[j].id = infos_tmp[j].id;
												infos[j].notification = notif[0].nbr_notif;
												infos[j].class = Number(j) % 2 + 1;
												if (!infos_tmp[Number(j) + 1]) {
													callback(infos, j);
												}
											})
										})
									})(j, function (infos, j) {
										res.redirect("/message.html/" + infos[j].id);
									});
								}
							})
						}
					}
					else {
						res.render("message.html", {});
					}
				})
			}
		})
	}
});
app.get("/message.html/:id", function (req, res) {
	var infos = [];
	var infos_tmp = {};
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT COUNT(*) as verif FROM matchs WHERE id = ? AND (matched=? or matcher =?)", [req.params.id, req.session.username, req.session.username], function (err, count) {
			if (count[0].verif === 0) {
				res.redirect("/message.html");
				res.end();
			}
			else {
				connection.query("SELECT * FROM matchs WHERE matcher = ? OR matched = ? ", [req.session.username, req.session.username], function (err, rows) {
					if (err) throw err;
					for (var k in rows) {
						(function (k) {
							if (rows[k].matcher !== req.session.username) {
								infos_tmp[k] = {
									name: rows[k].matcher
									, id: rows[k].id
								}
							}
							else if (rows[k].matched !== req.session.username) {
								infos_tmp[k] = {
									name: rows[k].matched
									, id: rows[k].id
								}
							}
						})(k);
					}
					for (var j in infos_tmp) {
						(function (j, callback) {
							connection.query("SELECT * FROM users WHERE username = ?", [infos_tmp[j].name], function (err, data) {
								connection.query("SELECT COUNT(*) as nbr_notif FROM notification WHERE sender = ? AND sended = ?and RIGHT(content, 7) = 'message' AND seen = 0", [infos_tmp[j].name, req.session.username], function (err, notif) {
									infos[j] = data[0];
									infos[j].id = infos_tmp[j].id
									infos[j].class = Number(j) % 2 + 1;
									infos[j].notification = notif[0].nbr_notif;
									if (!infos_tmp[Number(j) + 1]) {
										callback();
									}
								})
							})
						})(j, function () {
							connection.query("SELECT * FROM matchs WHERE id = ?", [req.params.id], function (err, row) {
								if (err) throw err;
								if (row[0].matcher !== req.session.username) {
									connection.query("SELECT * FROM users WHERE username = ?", [row[0].matcher], function (err, rows) {
										if (err) throw err;
										res.render("message.html", {
											chatwithme: rows[0].firstname
											, message: {
												infos: infos
											}
											, baiserie: '<div id="sessionUser" style="font-size: 0px;">' + req.session.username + '</div>'
										})
									})
								}
								else if (row[0].matched !== req.session.username) {
									connection.query("SELECT * FROM users WHERE username = ?", [row[0].matched], function (err, rows) {
										if (err) throw err;
										res.render("message.html", {
											chatwithme: rows[0].firstname
											, message: {
												infos: infos
											}
											, baiserie: '<div id="sessionUser" style="font-size: 0px;">' + req.session.username + '</div>'
										})
									})
								}
							})
						});
					}
				})
			}
		});
	}
});
app.get("/history.html", function (req, res) {
	var infos = [];
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM history WHERE visited = ?", [req.session.username], function (err, rows) {
			if (err) throw err;
			if (rows[0]) {
				for (var k in rows) {
					(function (k, callback) {
						connection.query("SELECT * FROM users WHERE username = ?", [rows[k].visitor], function (err, row) {
							if (err) throw err;
							else {
								infos[k] = row[0];
								infos[k].birth = profile.age(row[0].birthday);
								if (!rows[Number(k) + 1]) {
									callback();
								}
							}
						});
					})(k, function () {
						res.render("result.html", {
							result: {
								infos: infos
							}
						})
					});
				}
			}
			else {
				res.render("result.html", {
					message: "Nobody have visited your profil"
				})
			}
		})
	}
});
app.get("/blocks.html", function (req, res) {
	var infos = [];
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM block WHERE block_by =?", [req.session.username], function (err, rows) {
			if (err) throw err;
			if (rows[0]) {
				for (var k in rows) {
					(function (k, callback) {
						connection.query("SELECT * FROM users WHERE username = ?", [rows[k].blocked], function (err, row) {
							if (err) throw err;
							else {
								infos[k] = row[0];
								infos[k].birth = profile.age(row[0].birthday);
								if (!rows[Number(k) + 1]) {
									callback();
								}
							}
						});
					})(k, function () {
						res.render("result.html", {
							block: {
								infos: infos
							}
						})
					});
				}
			}
			else {
				res.render("result.html", {
					message: "You have blocked nobody"
				})
			}
		})
	}
});
app.get("/unblock/:user", function (req, res) {
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("DELETE FROM block WHERE block_by = ? AND blocked = ?", [req.session.username, req.params.user], function (err) {
			if (err) throw err;
			res.redirect("/blocks.html");
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
								infos[k].birth = profile.age(row[0].birthday);
								if (!rows[Number(k) + 1]) {
									callback();
								}
							}
						});
					})(k, function () {
						res.render("result.html", {
							result: {
								infos: infos
							}
						})
					});
				}
			}
			else {
				res.render("result.html", {
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
					, message: 'This email is already use'
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
app.get('/tags.html/:tag', function (req, res) {
	var infos = [];
	if (!req.session.username) {
		res.redirect('/');
	}
	else {
		connection.query("SELECT username FROM tags WHERE tag = ?", [req.params.tag], function (err, rows) {
			if (err) throw err;
			if (rows[0]) {
				for (var k in rows) {
					(function (k, callback) {
						connection.query("SELECT * FROM users WHERE username = ?", [rows[k].username], function (err, row) {
							if (err) throw err;
							else {
								infos[k] = row[0];
								infos[k].birth = profile.age(row[0].birthday);
								if (!rows[Number(k) + 1]) {
									callback();
								}
							}
						});
					})(k, function () {
						res.render("result.html", {
							result: {
								infos: infos
							}
						})
					});
				}
			}
			else {
				res.render("result.html", {
					message: "nobody have this tags"
				})
			}
		})
	}
});
app.get('/deletetag/:data', function (req, res) {
	if (req.params.data) {
		connection.query("DELETE FROM tags WHERE tag = ? AND username = ?", [req.params.data, req.session.username], function (err) {
			if (err) throw err;
			else {
				connection.query("UPDATE dictionary SET score = score - 1 WHERE value = ?", [req.params.data], function (err) {
					if (err) throw err;
				})
				res.redirect('/profile.html')
			}
		})
	}
	else {
		res.redirect('/profile.html')
	}
});
app.get('/delete_account.html', function (req, res) {
	if (!req.session.username) {
		res.redirect('/');
	}
	else {
		res.render('delete_account.html')
	}
});
app.post('/delete_account.html', function (req, res) {
	if (req.body.deleteAccount) {
		connection.query("DELETE FROM users WHERE username = ?", [req.session.username], function (err) {
			if (err) throw err;
			else {
				connection.query("DELETE FROM pictures WHERE username = ?", [req.session.username], function (err) {
					if (err) throw err;
					else {
						connection.query("DELETE FROM liking WHERE liker = ? OR liked = ?", [req.session.username, req.session.username], function (err) {
							if (err) throw err;
							else {
								connection.query("DELETE FROM matchs WHERE matcher = ? OR matched = ?", [req.session.username, req.session.username], function (err) {
									if (err) throw err;
									else {
										connection.query("DELETE FROM history WHERE visitor  = ? OR visited = ?", [req.session.username, req.session.usenamername], function (err) {
											if (err) throw err;
											else {
												res.redirect('/logout.html')
											}
										})
									}
								})
							}
						})
					}
				})
			}
		})
	}
});
app.get("/notification.html", function (req, res) {
	if (!req.session.username) {
		res.redirect("/");
	}
	else {
		connection.query("SELECT * FROM notification WHERE sended = ? ORDER by id DESC", [req.session.username], function (err, rows) {
			if (err) throw err;
			for (var k in rows) {
				rows[k].class = (Number(rows[k].seen) % 2) + 1;
			}
			res.render("notification.html", {
				notification: {
					infos: rows
				}
			})
		})
	}
});
app.get('/deletenotif/:id', function (req, res) {
	if (req.params.id) {
		connection.query("DELETE FROM notification WHERE id = ?", [req.params.id], function (err) {
			if (err) throw err;
			else {
				res.redirect('/notification.html')
			}
		})
	}
	else {
		res.redirect('/notification.html')
	}
});
app.get('*', function (req, res) {
	if (!req.session.username) {
		res.redirect('/');
	}
	else {
		res.status(404).send('Sorry this page doesn\'t exists');
	}
});
/*     S  E  R  V  E  R     */
var httpsServer = https.createServer(options, app, function (req, res) {
	res.writeHead(200);
});
httpsServer.listen(4433);
/*     S  O  C  K  E  T     */
var io = require('socket.io').listen(httpsServer.listen(4433));
io.on('connection', function (socket) {
	var cookies = cookieParser.signedCookies(cookie.parse(socket.handshake.headers.cookie), sess.secret);
	var sessionid = cookies['connect.sid'];
	connection.query("UPDATE users SET socket_id= ? WHERE sessionID = ?", [socket.id, sessionid], function (err) {
		if (err) throw err;
	});
	connection.query("SELECT COUNT(*) AS notification FROM notification WHERE sended = (SELECT username FROM users WHERE sessionID = ?) AND seen = 0", [sessionid], function (err, rows) {
		if (err) throw err;
		if (rows[0]) {
			socket.emit("notification", {
				notification: rows[0].notification
			});
		}
	});
	socket.on("new visitor", function (data) {
		connection.query("SELECT socket_id FROM users WHERE username = ? ", [data.user], function (err, rows) {
			if (Object.keys(io.sockets.sockets).includes(rows[0].socket_id)) {
				(function (callback) {
					connection.query("SELECT COUNT(*) AS notification FROM notification WHERE sended = ? and seen = 0", [data.user], function (err, number) {
						callback(number);
					});
				})(function (number) {
					io.sockets.in(rows[0].socket_id).emit("new Notification", {
						value: number[0].notification
					});
				})
			}
		});
	});
	socket.on("likeEvent", function (data) {
		connection.query("SELECT socket_id FROM users WHERE username = ? ", [data.user], function (err, rows) {
			if (Object.keys(io.sockets.sockets).includes(rows[0].socket_id)) {
				(function (callback) {
					connection.query("SELECT COUNT(*) AS notification FROM notification WHERE sended = ? AND seen = 0", [data.user], function (err, number) {
						callback(number);
					});
				})(function (number) {
					io.sockets.in(rows[0].socket_id).emit("new Notification", {
						value: number[0].notification
					});
				})
			}
		});
	});
	socket.on("changeprofile_pic", function (data) {
		data.picture = data.picture.replace("https://localhost:4433/", "");
		connection.query("UPDATE users SET profil_pic = ? WHERE sessionID = ?", [data.picture, sessionid], function (err) {
			if (err) throw err;
		});
	});
	socket.on("delete_pic", function (data) {
		data.picture = data.picture.replace("https://localhost:4433/", "");
		connection.query("DELETE FROM pictures WHERE pic = ?", [data.picture], function (err) {
			if (err) throw err;
			connection.query("SELECT profil_pic FROM users WHERE profil_pic = ? AND sessionID = ? ", [data.picture, sessionid], function (err, rows) {
				if (err) throw err;
				if (rows.length) {
					connection.query("UPDATE users SET profil_pic = DEFAULT WHERE sessionID = ?", [sessionid], function (err) {
						if (err) throw err;
					})
				}
			});
		})
		fs.unlinkSync("./public/" + data.picture + "");
	});
	socket.on("location", function (data) {
		if (data) {
			var location = data.location;
			if (location[1]) {
				var arrondissement = location[1].split(',')[1];
				arrondissement = arrondissement.split("-")[0];
				connection.query("UPDATE users SET location = ?, currlat =?, currlong = ? WHERE sessionID = ?", [arrondissement, data.lat, data.long, sessionid], function (err) {
					if (err) throw err;
				});
			}
			else {
				connection.query("UPDATE users SET currlat =?, currlong = ? WHERE sessionID = ?", [data.lat, data.long, sessionid], function (err) {
					if (err) throw err;
				});
			}
		}
	});
	publicIp.v4().then(function (ip) {
		var location = geoip.lookup(ip).ll
		socket.emit("iplocation", {
			location: location
		})
	}).catch(function (err) {
		console.log(err);
	})
	socket.on("seen Notification", function () {
		connection.query("UPDATE  notification SET seen = 1 WHERE sended = (SELECT username FROM users WHERE sessionID= ?)", [sessionid], function (err) {
			if (err) throw err;
		})
	});
	socket.on('check_message', function (url) {
		var data = [];
		connection.query("SELECT * FROM messages WHERE room = ?", [url], function (err, rows) {
			if (err) throw err;
			(function (callback) {
				for (i = 0; i < rows.length; i++) {
					data.push(rows[i]);
				}
				callback(data);
			})(function (data) {
				socket.emit('old_message', data);
			})
		})
	});
	socket.on("send-message", function (data) {
		if (data.room) {
			connection.query("SELECT * FROM matchs WHERE id = ?", [data.room], function (err, room) {
				if (err) throw err;
				if (room[0]) {
					if (room[0].matcher === data.user) {
						var reciever = room[0].matched;
					}
					else {
						var reciever = room[0].matcher;
					}
					(function (callback) {
						connection.query("INSERT INTO messages(sender, reciever, message, room) VALUES(?,?,?,?)", [data.user, reciever, data.text, data.room], function (err) {
							if (err) throw err;
							connection.query("SELECT firstname,lastname FROM users WHERE username = ?", [data.user], function (err, rows) {
								if (err) throw err;
								var content = rows[0].firstname + " " + rows[0].lastname + " send you a new message";
								var date = new Date().toISOString().slice(0, 10);
								var date = date + " " + new Date().getHours() + " : " + new Date().getMinutes();
								connection.query("INSERT INTO notification(sender,sended, content,date) VALUES(?,?,?,?)", [data.user, reciever, content, date], function (err) {
									if (err) throw err;
									callback();
								})
							})
						})
					})(function () {
						connection.query("SELECT socket_id FROM users WHERE username = ? ", [reciever], function (err, rows) {
							if (Object.keys(io.sockets.sockets).includes(rows[0].socket_id)) {
								io.sockets.in(rows[0].socket_id).emit("new_message", {
									message: data.text
									, sender: data.user
									, room: data.room
								});
								(function (callback) {
									connection.query("SELECT COUNT(*) AS notification FROM notification WHERE sended = ? AND seen = 0", [reciever], function (err, number) {
										connection.query("SELECT COUNT(*) as nbr_notif FROM notification WHERE sender = ? AND sended = ? and RIGHT(content, 7) = 'message' AND seen = 0", [data.user, reciever], function (err, notif) {
											callback(number, notif);
										});
									})
								})(function (number, notif) {
									io.sockets.in(rows[0].socket_id).emit("new Notification", {
										value: number[0].notification
										, contactnotif: notif[0].nbr_notif
										, room: data.room
									});
								})
							}
							socket.emit("new_message", {
								message: data.text
								, sender: data.user
								, room: data.room
							});
						})
					})
				}
			});
		}
	})
	socket.on("seen message", function (data) {
		connection.query("SELECT matched, matcher FROM matchs WHERE id = ?", [data.room], function (err, rows) {
			if (rows[0].matcher === data.user) {
				var reciever = rows[0].matched;
			}
			else {
				var reciever = rows[0].matcher;
			}
			connection.query("UPDATE notification SET seen = 1 WHERE sender = ? AND  sended = ? AND RIGHT(content, 7)='message'", [reciever, data.user], function (err) {
				if (err) throw err;
				socket.emit("message update", data);
			})
		})
	});
});

function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
	var R = 6371; // Radius of the earth in km
	var dLat = deg2rad(lat2 - lat1); // deg2rad below
	var dLon = deg2rad(lon2 - lon1);
	var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	var d = R * c; // Distance in km
	return d;
}

function deg2rad(deg) {
	return deg * (Math.PI / 180)
}