var router = require('express').Router()

router.get("/archives", function (req, res, next) {
    res.send("Archives Here!")
})

module.exports = router