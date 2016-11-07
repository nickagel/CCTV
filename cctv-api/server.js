var express    = require('express')
var bodyParser = require('body-parser')
var logger     = require('morgan')

var app = express()
app.use(bodyParser.json())
app.use(logger('dev'))
app.use(require('./api/routes'))

var port = process.env.PORT || 3000
var server = app.listen(port, function () {
  console.log('CCTV-API listening on', port)
})