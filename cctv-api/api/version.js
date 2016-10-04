var router = require('express').Router()
var packageJson = require('./../package.json')

router.get("/version", function(req, res, next){
    res.send(packageJson.version)
})

module.exports = router