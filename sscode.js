// sscode.js
var express = require("express"),
    routes = require('./routes'),
    http = require('http'),
    path = require('path'),
    logfmt = require("logfmt");

var app = express();

app.configure(function(){
    app.set('port', process.env.PORT || 5000);
    app.use(logfmt.requestLogger());
    app.use('views',path.join(__dirname, 'views'));
    app.use(express.static(path.join(__dirname,'/public')));
});

app.get('/',routes.index);

var port = Number(process.env.PORT || 5000);

http.createServer(app).listen(app.get('port'),function(){
	console.log("Listening on " + port)
    });
