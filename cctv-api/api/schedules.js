var router = require('express').Router()
var Schedule = require('./../models/schedule')
var moment = require('moment-timezone')
var currentTime = (moment.tz("America/New_York").format()).substring(0,10)

router.get("/schedules", function (req, res, next) {
    var EST = moment.tz("America/New_York").format()
    var ESTstring = EST.substring(0,10)
    Schedule.find({"date":ESTstring}, function(err, schedules){
        res.send({"schedules": schedules})
    })
})

module.exports = router