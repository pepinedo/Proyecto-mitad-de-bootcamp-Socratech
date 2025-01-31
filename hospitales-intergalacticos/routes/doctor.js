var express = require('express');
const doctorControllers = require('../controllers/doctorControllers');
const uploadImage = require('../middleware/uploadImage');
var router = express.Router();

/* Página de añadir médico */
router.get('/newDoctor/:hospital_id', doctorControllers.openFormNewDoctor);

/* Formulario de añadir médico */
router.post('/formNewDoctor/:hospital_id', uploadImage("doctor"), doctorControllers.formNewDoctor);


module.exports = router;
