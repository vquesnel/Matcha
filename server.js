/*     D  E  C  L  A  R  A  T  I  O  N  S    */





var fs = require('fs');
var https = require('https');
var express = require('express');
var path = require('path');
var options = {
    key: fs.readFileSync('certificates/server-key.pem'),
    cert: fs.readFileSync('certificates/server-crt.pem'),
    ca: fs.readFileSync('certificates/ca-crt.pem'),
};
var app = express();
var mysql = require('mysql');
var connection = mysql.createConnection({
    port: 8889,
    //port: 3307,
    host: 'localhost',
    user: 'root',
    password: 'root'
});
var bodyParser = require('body-parser');
var mustacheExpress = require('mustache-express');
var create_account = require('./server/create_Account');
var index = require("./server/index");
var moment = require('moment');
var md5 = require('md5');
var uniqid = require('uniqid');
var session = require('express-session');
var sess = {
    secret: 'keyboard cat',
    cookie: {},
    resave: false,
    saveUninitialized: false
}

var multer = require('multer');
var storage = multer.diskStorage({
    destination: function (req, file, callback) {
        callback(null, './upload');
    },
    filename: function (req, file, callback) {
        callback(null, file.fieldname + '-' + uniqid());
    }
});
var upload = multer({
    storage: storage
}).single('userPhoto');




/*     S Q L    C  O  N  N  E  X  I  O  N  S    */






connection.connect(function (err) {
    if (err) throw err;
});
connection.query("CREATE DATABASE IF NOT EXISTS matcha;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`users` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `firstname` VARCHAR(255) NOT NULL , `lastname` VARCHAR(255) NOT NULL , `username` VARCHAR(255) NOT NULL , `birthday` DATE NOT NULL , `email` VARCHAR(255) NOT NULL , `password` VARCHAR(255) NOT NULL , `sexe` VARCHAR(8) NOT NULL , `token` VARCHAR(255) NOT NULL , `validation` VARCHAR(1) NOT NULL DEFAULT '0' ,  `profil_pic` LONGTEXT DEFAULT NULL, `sexual_or` VARCHAR(10) NOT NULL DEFAULT 'bi' , `bio` VARCHAR(255) DEFAULT NULL , `location` VARCHAR(255) DEFAULT NULL , `tags` VARCHAR(255) DEFAULT NULL , `pop` INT(5) DEFAULT '0', login VARCHAR(255), PRIMARY KEY (`id`)) ENGINE = InnoDB;");
connection.query("CREATE TABLE IF NOT EXISTS `matcha`.`pictures` ( `id` INT(5) NOT NULL AUTO_INCREMENT , `pic` LONGTEXT NOT NULL , `username` VARCHAR(255) NOT NULL,  PRIMARY KEY (`id`)) ENGINE = InnoDB;");
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
    res.render("index.html", {
        message: ""
    })
});

app.post('/', function (req, res) {
    console.log(req.body);
    var ret = index.index_checker(req.body.username, req.body.password);
    if (ret) {
        res.render('index.html', {
            'message': ret
        })
    } else {
        connection.query("SELECT * FROM users WHERE username = ?", [req.body.username], function (err, rows) {
            if (err) throw err;
            if (rows.length) {
                if (md5(req.body.password) !== rows[0].password) {
                    res.render("index.html", {
                        message: "Sorry wrong password"
                    })
                } else {
                    req.session.username = rows[0].username;
                    req.session.sexual_or = rows[0].sexual_or;
                    req.session.sexe = rows[0].sexe;
                    req.session.profil_pic = rows[0].profil_pic;
                    connection.query("UPDATE users SET login = ? WHERE username = ?", ["online", req.session.username])
                    if (!(rows[0].profil_pic)) {
                        res.redirect('/edit_profil.html');
                    } else {
                        res.redirect('/match.html')
                    }
                    console.log(req.session);
                }
            } else {
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
    res.render('create_account.html', {
        message: ""
    })
});

app.post('/create_account.html', function (req, res) {
    var ret = create_account.form_checker(req.body.firstname, req.body.lastname, req.body.birthday, req.body.username, req.body.email, req.body.confirm_email, req.body.password, req.body.confirm_password, req.body.sexe);
    if (ret) {
        res.render('create_account.html', {
            'message': ret
        })
    } else {
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
                        } else {
                            connection.query('SELECT * FROM users WHERE email = ?', [req.body.email], function (err, rows) {
                                if (err) throw err;
                                if (rows.length) {
                                    ret = 'Email already used by another account.';
                                    res.render('create_account.html', {
                                        'message': ret
                                    })
                                } else {
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
                } else {
                    ret = "Sorry you're underage";
                    res.render('create_account.html', {
                        'message': ret
                    })
                }
            } else {
                ret = "Passwords do not match";
                res.render('create_account.html', {
                    'message': ret
                })
            }
        } else {
            ret = 'Emails do not match';
            res.render('create_account.html', {
                'message': ret
            })

        }
    }
});

app.get('/edit_profil.html', function (req, res) {
    res.render('edit_profil.html', {});
});

app.post('/edit_profil.html', function (req, res) {

    upload(req, res, function (err) {
        console.log(req.body);
        if (req.file) {
            if (err) {
                res.render("edit_profil.html", {
                    message: "An error occurs while uploading your picture"
                })
            } else {
                connection.query("UPDATE users SET profil_pic = ? WHERE username = ?", [req.file.path, req.session.username], function (err) {
                    if (err) throw err;
                })
                res.render("edit_profil", {
                    message: "File is uploaded"
                })
            }
        }
    });
});
app.get('/match.html', function (req, res) {});







/*     S  E  R  V  E  R     */





https.createServer(options, app, function (req, res) {
    res.writeHead(200);
}).listen(4433);