var gulp       = require('gulp');
var exec       = require('gulp-exec');
var gutil      = require('gulp-util');
var coffee     = require('gulp-coffee');
var coffeelint = require('gulp-coffeelint');
var mocha      = require('gulp-mocha');
var notify     = require("gulp-notify");


var paths = {
  scripts:    [ "srcs/**/*.coffee" ],
  tests:      "tests/**/*.coffee",
  test_files: [ "tests/**/.js", '!tests/buckets.js' ]
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
  .pipe(coffee({bare: true}))
  .on("error", notify.onError(function (error) {
    return "Message to the notifier: " + error.message;
  }))
  .pipe(notify("Tests CoffeeScripted"))
  .pipe(mocha({reporter:'spec'}))
  .on('error', notify.onError(function(error) {
    return "Tests failed";
  }));
});

gulp.task('cover', function(){
  gulp.src(paths.test_files)
      .pipe(exec("istanbul cover ./node_modules/mocha/bin/_mocha tests/{LinkedList,BSTree}.js -- -R spec"))
});

gulp.task('watch', function(){
  gulp.watch(paths.scripts, ['scripts']);
  gulp.watch(paths.tests, ['tests']);
});

gulp.task('default', ['scripts', 'tests', 'watch']);