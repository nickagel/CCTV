var router = require('express').Router()

router.get("/schedules", function (req, res, next) {
    res.send("Schedules Here!")
})

module.exports = router