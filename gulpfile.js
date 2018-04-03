//https://semaphoreci.com/community/tutorials/getting-started-with-gulp-js
//https://github.com/AveVlad/gulp-connect/pull/92

var gulp = require('gulp');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var gutil = require('gulp-util');
var connect = require('gulp-connect');

var browserSync = require('browser-sync');
var nodemon = require('gulp-nodemon');
//const WebSocket = require('ws');
//var io = require('socket.io')

var outputDir = 'dist';
var jsSources = [
  'src/godot_client.js',
  'src/godot_js.js'
];

//===============================================
// GODOT Engine
//===============================================

var godotPath = "C:/godot3";
var godot_html = [
  godotPath + "/bin/.javascript_zip/godot.js",
  godotPath + "/bin/.javascript_zip/godot.wasm",
];
var godotModuleDir = godotPath + '/modules';
//===============================================
// 
//===============================================

gulp.task('connect', function() {
  /*
  var app = connect.server({
    root: './dist',
    livereload: true
  });
  */
  /*
  var io = require('socket.io')(app.server);
  io.on('connection', function(socket) {
    // do stuff
    console.log("connect client!");
  });
  var server  = app.server;

  wss = new WebSocket.Server({ server });

  wss.on('connection', function connection(ws, req) {
    //const location = url.parse(req.url, true);
    console.log("ws connect!")
    // You might use location.query.access_token to authenticate or share sessions
    // or req.headers.cookie (see http://stackoverflow.com/a/16395220/151312)
  
    ws.on('message', function incoming(message) {
      console.log('received: %s', message);
    });
  
    //ws.send('something');
  });
*/
});

gulp.task('src_js', function() {
  gulp.src(jsSources)
  .pipe(uglify())
  .pipe(concat('script.js'))
  .pipe(gulp.dest(outputDir))
  .pipe(connect.reload())
});

gulp.task('godot_js', function() {
  gulp.src(jsSources)
  //.pipe(uglify())
  //.pipe(concat('script.js'))
  .pipe(gulp.dest(outputDir))
  .pipe(connect.reload())
});

gulp.task('copy_html', function() {
  gulp.src('src/index.html')
  .pipe(gulp.dest(outputDir))
});

gulp.task('godot_modules', function() {
  gulp.src(['modules/**/*.h','modules/**/*.cpp','modules/**/*.py','modules/**/SCsub'])
  .pipe(gulp.dest(godotModuleDir))
});

gulp.task('css', function() {
  gulp.src('src/index.css')
  .pipe(gulp.dest(outputDir))
});

gulp.task('watch', function() {
  //gulp.watch('styles/main.scss', ['sass']);
  //gulp.watch(jsSources, ['godot3_js']);
  //gulp.watch(['modules/**/*.h','modules/**/*.cpp','modules/**/*.py','modules/**/SCsub'], ['godot_modules']);

  gulp.watch('src/index.html', ['copy_html']);
  gulp.watch('src/index.css', ['css']);
});

gulp.task('copy_godot_javascript', function() {
  gulp.src(godot_html)
  .pipe(gulp.dest(outputDir));

  gulp.src('./assets/html_debug/godot_modules.html')
  .pipe(gulp.dest(outputDir));
});

gulp.task('browser-sync', ['nodemon'], function() {
	browserSync.init(null, {
		proxy: "http://localhost:3000",
    files: ["dist/**/*.*"]//,
    //browser: "google chrome",
    //port: 7000
	});
});

gulp.task('nodemon', function (cb) {
	
	var started = false;
	
	return nodemon({
    script: 'app.js'
    , ignore: [
      'src/',
      'node_modules/'
    ]
    , env: { 'NODE_ENV': 'development' }
    ,watch:    ['dist']
	}).on('start', function () {
		// to avoid nodemon being started multiple times
		// thanks @matthisk
		if (!started) {
			cb();
			started = true; 
		} 
	});
});

// create a default task and just log a message
//gulp.task('default', ['browser-sync','copy_godot_javascript','godot3_js','copy_html','css','connect','watch'] , function() {
gulp.task('default', ['browser-sync','copy_godot_javascript','godot_js','copy_html','css','watch'] , function() {
  return gutil.log('Gulp is running!');
});