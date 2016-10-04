var router = require('express').Router()

router.get("/streaming", function (req, res, next) {
    res.send("Streaming Here!")
})

module.exports = router