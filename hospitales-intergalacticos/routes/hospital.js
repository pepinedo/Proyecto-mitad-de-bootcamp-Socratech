var express = require('express');
const hospitalControllers = require('../controllers/hospitalControllers');
const uploadImage = require('../middleware/uploadImage');
var router = express.Router();

/* Página de añadir nuevo hospital */
router.get('/newHospital', hospitalControllers.openNewHospital);

/* Formulario de añadir nuevo hospital */
router.post('/newHospital', uploadImage('hospital'), hospitalControllers.formNewHospital);

/* Página donde aparece la lista de todos los hospitales */
router.get('/allHospital', hospitalControllers.openAllHospital);

/* Página dinámica, muestra el hospital seleccionado */
router.get('/oneHospital/:hospital_id', hospitalControllers.openOneHospital);

module.exports = router;
