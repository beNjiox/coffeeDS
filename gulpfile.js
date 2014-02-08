var gulp       = require('gulp');
var gutil      = require('gulp-util');
var coffee     = require('gulp-coffee');
var coffeelint = require('gulp-coffeelint');
var mocha      = require('gulp-mocha');
var notify     = require("gulp-notify");


var paths = {
  scripts: [ "srcs/*.coffee" ],
  tests: "tests/*.coffee"
};

gulp.task('scripts', function(){
  gulp.src(paths.scripts)
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())
  .pipe(coffee({bare: true}))
  .on("error", notify.onError(function (error) {
    return "Message to the notifier: " + error.message;
  }))
  .pipe(notify("CoffeeScripted"));
});

gulp.task('tests', function(){
  gulp.src(paths.tests)
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())
  .pipe(coffee({bare: true}))
  .on("error", notify.onError(function (error) {
    return "Message to the notifier: " + error.message;
  }))
  .pipe(notify("Tests CoffeeScripted"))
  .pipe(mocha())
  .on('error', notify.onError(function(error) {
    return "Tests failed";
  }));
});

gulp.task('watch', function(){
  gulp.watch(paths.scripts, ['scripts']);
  gulp.watch(paths.tests, ['tests']);
});

gulp.task('default', ['scripts', 'tests', 'watch']);