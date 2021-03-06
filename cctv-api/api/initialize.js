var router = require('express').Router()
var async = require('async')
var Uri = require('./../models/uri')
var Archive = require('./../models/archive')
var Schedule = require('./../models/schedule')
var moment = require('moment-timezone')
var currentTime = (moment.tz("America/New_York").format()).substring(0,10)

router.get("/initialize", function(req, res, next){
    async.parallel({
        schedules: function(callback){
            //schedules
            var EST = moment.tz("America/New_York").format()
            var ESTstring = EST.substring(0,10)
            Schedule.find({"date":ESTstring}, function(err, schedules){
                callback(null, schedules)
            })
        },
        uris: function(callback){
            //streaming uris
            Uri.find({}, function(err, uris){
                callback(null, uris)
            })
        },
        archives: function(callback){
            //archives
            var query = Archive.find({}).sort({airDate: -1}).limit(10)

            query.exec(function (err, archives) {
                if(err) {
                    res.status(404)
                }
                
                callback(null, archives)
            })
        }
    }, function(err, results){
        res.status(200).json
        ({
            "archives": results.archives,
            "schedules": results.schedules,
            "uris": results.uris
        })
    })
})

module.exports = router