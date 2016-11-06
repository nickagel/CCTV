var mongoose = require('mongoose')
var config = require('./config.json')
var connectionString = "mongodb://" + config.user + ":" + config.password + "@" + config.domain + ":" + config.port + "/" + config.db

mongoose.connect(connectionString, function () {
  console.log('mongodb connected')
})
module.exports = mongoose