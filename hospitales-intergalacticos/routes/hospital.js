var express = require('express');
const hospitalControllers = require('../controllers/hospitalControllers');
const uploadImage = require('../middleware/uploadImage');
var router = express.Router();

/* Página de añadir nuevo hospital */
router.get('/newHospital', hospitalControllers.openNewHospital);

/* Formulario de añadir nuevo hospital */
router.post('/newHospital', uploadImage('hospital'), hospitalControllers.formNewHospital);

//-------------------------------------------------
/* Página donde aparece la lista de todos los hospitales */
router.get('/allHospital', hospitalControllers.openAllHospital);

/* Página dinámica, muestra el hospital seleccionado */
router.get('/oneHospital/:hospital_id', hospitalControllers.openOneHospital);


//---------------------------------------------------
/* Página de poner contraseña del hospital de editar datos */
router.get('/lockEditHospital/:hospital_id', hospitalControllers.lockEditHospital);

/* Contraseña para acceder a editar */
router.post('/lockFormEditHospital/:hospital_id', hospitalControllers.lockFormEditHospital);

//-----------------------------------------------------
/* Página de edicion del hospital */
router.get('/editHospital/:hospital_id', hospitalControllers.openEditHospital);

/* Formulario de edicion de hospital */
router.post('/formEditHospital/:hospital_id', hospitalControllers.formEditHospital);

//-----------------------------------------------------
/* Página de eliminar hospital */
router.get('/deleteHospital/:hospital_id', hospitalControllers.deleteHospital);

/* Botón de eliminado lógico */
router.get('/logicDeleteHospital/:hospital_id', hospitalControllers.logicDeleteHospital);

/* Botón de eliminado total */
router.get('/totalDeleteHospital/:hospital_id', hospitalControllers.totalDeleteHospital);



module.exports = router;
