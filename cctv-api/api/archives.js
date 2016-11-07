var router = require('express').Router()
var Archive = require('./../models/archive')

router.get("/archives", function (req, res, next) {
    var query = Archive.find({}).sort({airDate: -1}).limit(10)

    query.exec(function (err, archives) {
        if(err) {
            res.status(404)
        }
        
        res.status(200).json({"archives": archives})
    })
})

module.exports = router