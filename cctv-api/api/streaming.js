var router = require('express').Router()
var Uri = require('./../models/uri')

router.get("/streaming", function (req, res, next) {
    Uri.find({}, function(err, uris){
        if(err) {
            res.status(404)
        }
        
        res.status(200).json(uris)
    })
})

module.exports = router