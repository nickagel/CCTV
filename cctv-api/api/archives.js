var router = require('express').Router()
var Archive = require('./../models/archive')

router.get("/archives", function (req, res, next) {
    var query = Archive.find({}).sort({airDate: -1}).limit(10)

    query.exec(function (err, archives) {
        res.send({"archives": archives})
    })
})

module.exports = router