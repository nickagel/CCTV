var db = require('./../db')

var Uri = db.model("uri", {
  _id: {type: String, select: false},
  title: {type: String, select: false},
  channel: {type: String},
  uri: {type: String}
})

module.exports = Uri