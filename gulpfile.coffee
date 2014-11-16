gulp = require('gulp')
coffee = require('gulp-coffee')
less = require('gulp-less')
livereload = require('gulp-livereload')
watch = require('gulp-watch')
nodemon = require('gulp-nodemon')
sourcemaps = require('gulp-sourcemaps')

gulp.task 'coffee', ->
  gulp.src('public/coffee/*.coffee')
    .pipe(coffee({base:true}))
    .pipe gulp.dest('public/js')

gulp.task 'less', ->
  gulp.src('public/less/*.less')
    .pipe(sourcemaps.init())
    .pipe(less())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('public/css'))

gulp.task 'watch', ->
  livereload.listen()
  gulp.watch(['public/**/*.coffee'], ['coffee'])
    .on('change', livereload.changed)
  gulp.watch(['public/**/*.less'], ['less'])
    .on('change', livereload.changed)
  gulp.watch(['views/**/*.jade'])
    .on('change', livereload.changed)

gulp.task 'nodemon', ->
  nodemon({
    script : 'app.js',
    nodeArgs : ['--harmony'],
    watch : []
    ignore : ["*.*"]
  })

gulp.task 'default', ['coffee', 'less', 'watch', 'nodemon']
