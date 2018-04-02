var express = require("express");
var http = require('http');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);
//var nodemon = require('gulp-nodemon');

app.set("view engine", "ejs");

app.use(express.static(__dirname + '/dist/'));


io.on('connection', function(socket){
    console.log('a user connected');
  });

//app.get("/", function(req, res){
    //res.render("views/index");
//});

server.listen(3000, 'localhost', function(){
    console.log('Express listening on Port 3000');
});