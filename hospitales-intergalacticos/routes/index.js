var express = require('express');
const indexControllers = require('../controllers/indexControllers');
var router = express.Router();

/* Index -> la página principal */
router.get('/', indexControllers.openIndex);



module.exports = router;