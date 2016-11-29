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

router.post("/archives", function (req, res, next) {
    var search = req.body.search.replace(/[^a-zA-Z ]/g, "")
    var regex = new RegExp("^" + search, 'i')

    var query = Archive.find({
        $or:
        [
            {title: {$regex: regex}}, 
            {subtitle: {$regex: regex}}
        ]   
    })
    .sort({airDate: -1})
    .limit(10)

    query.exec(function (err, archives) {
        if(err) {
            res.status(404)
        }
        
        res.status(200).json({"archives": archives})
    })
})

module.exports = router