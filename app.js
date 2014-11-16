var koa = require('koa')
var serve = require('koa-static')
var route = require('koa-route')
var views = require('co-views')
var livereload = require('koa-livereload')
var app = koa()

var render = views(__dirname + '/views',
    { map :  {html : 'jade'}})

app.use(livereload())
app.use(route.get('/', function *(next) {
  this.body = yield render('index.jade', {})
}))

app.use(serve(__dirname + '/public'))

app.listen(3000)
