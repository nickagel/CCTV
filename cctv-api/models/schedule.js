var db = require('../db')

var Schedule = db.model("schedule", {
  _id: {type: String, select:false},
  date: {type: String},
  317: {type: String},
  17: {type: String}
})

module.exports = Schedule