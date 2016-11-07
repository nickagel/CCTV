var mongoose = require('mongoose')
var config = require('./config.json')
var connectionString = "mongodb://" + config.user + ":" + config.password + "@" + config.domain + ":" + config.port + "/" + config.db

mongoose.connect(connectionString, function () {
  mongoose.Promise = global.Promise;
  console.log('CCTV-API connected to MongoDb')
})
module.exports = mongoose