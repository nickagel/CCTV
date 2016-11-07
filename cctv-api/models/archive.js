var db = require('./../db')

var Archive = db.model('archive', {
    _id: {type: String, select:false},
    nid: {type: String},
    title: {type: String},
    subTitle: {type: String},
    airDate: {type: String}
})

module.exports = Archive