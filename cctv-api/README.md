# CCTV API

### Installation
CCTV-API requires [Node.js](https://nodejs.org/).

Install the dependencies and start the server.

```sh
$ cd CCTV/cctv-api
$ npm install
$ node server
```
**NOTE:** Ask admin for cctv-api/config.json

config.json
```sh
{
    "domain" : String,
    "port" : Int32,
    "db" : String,
    "user" : String,
    "password" : String
}
```

### Production
Deplay node in production follow this [documentation] provided by Digital Ocean

### Collection Schemas

archives
```sh
{
    "url": String,
    "thumbnail": String,
    "title": String,
    "subtitle": String,
    "airDate": ISODate as String (ex: 2016-10-23T04:00:00.000Z)
}
```

schedules
```sh
{
    "date": date as string, (ex: 2016-12-06)
    "channel317": [
        {
            "title": String,
            "startTime": String, (ex: 02:15)
            "endTime": String, (ex: 15:15)
            "ch_type": String
        }
        .
        .
        .
    ],
    "channel17": [
        {
            "title": String,
            "startTime": String, (ex: 02:15)
            "endTime": String, (ex: 15:15)
            "ch_type": String
        }
        .
        .
        .
    ]
}
```

uris
```sh
{
    "title": String,
    "channel": Int32,
    "uri": String
}
```

### Technology

CCTV uses a number of open source projects to work properly:

* [Async] - utility module for asynchronous JavaScript
* [Body Parser] - body parsing middleware
* [Express] - Fast, unopinionated minimalist framework
* [Moment Timezone] - parse and display moments in any timezone
* [MongoDb] - high-level API on top of mongodb-core
* [Mongoose] - fast node.js network app framework [@tjholowaychuk]

   [Body Parser]: <https://github.com/expressjs/body-parser>
   [Express]: <http://expressjs.com>
   [Async]: <https://caolan.github.io/async/>
   [Moment Timezone]: <https://www.npmjs.com/package/moment-timezone>
   [MongoDb]: <https://www.npmjs.com/package/mongodb>
   [mongoose]: <http://mongoosejs.com/index.html>
   [documentation]: <https://www.digitalocean.com/community/tutorials/how-to-deploy-node-js-applications-using-systemd-and-nginx>