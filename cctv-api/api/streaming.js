var router = require('express').Router()
var Uri = require('./../models/uri')

router.get("/streaming", function (req, res, next) {
    Uri.find({}, function(err, uris){
        res.send({"streaming": uris})
    })
})

module.exports = router