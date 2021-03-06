var router = require('express').Router()

router.use(require('./schedules'))
router.use(require('./archives'))
router.use(require('./streaming'))
router.use(require('./version'))
router.use(require('./initialize'))

module.exports = router