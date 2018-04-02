var express = require("express");
var http = require('http');
var app = express();
//var nodemon = require('gulp-nodemon');

app.set("view engine", "ejs");

app.use(express.static(__dirname + '/dist/'));


//app.get("/", function(req, res){
    //res.render("views/index");
//});

app.listen(8080, 'localhost', function(){
    console.log('Express listening on Port 8080');
});