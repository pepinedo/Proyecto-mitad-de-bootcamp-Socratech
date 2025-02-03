var express = require('express');
const doctorControllers = require('../controllers/doctorControllers');
const uploadImage = require('../middleware/uploadImage');
var router = express.Router();

/* Página de añadir médico */
router.get('/newDoctor/:hospital_id', doctorControllers.openFormNewDoctor);

/* Formulario de añadir médico */
router.post('/formNewDoctor/:hospital_id', uploadImage("doctor"), doctorControllers.formNewDoctor);

/* Página de información sobre un medico */
router.get('/oneDoctor/:hospital_id/:doctor_id', doctorControllers.openOneDoctor);

/* Página de contraseña para editar un medico */
router.get('/lockEditDoctor/:hospital_id/:doctor_id', doctorControllers.lockEditDoctor);

/* Formulario de la pagina lock de editar medico */
router.post('/lockFormEditDoctor/:hospital_id/:doctor_id', doctorControllers.lockFormEditDoctor);

/* Página de editar médico */
router.get('/editDoctor/:hospital_id/:doctor_id', doctorControllers.openEditDoctor);

/* Formulario de editar medico */
router.post('/formEditDoctor/:hospital_id/:doctor_id', uploadImage("doctor"), doctorControllers.formEditDoctor);

/* Página de eliminar médico */
router.get('/deleteDoctor/:hospital_id/:doctor_id', doctorControllers.openDeleteDoctor);

/* Botón de eliminado lógico */
router.get('/logicDeleteDoctor/:hospital_id/:doctor_id', doctorControllers.logicDeleteDoctor);

/* Botón de eliminado total */
router.get('/totalDeleteDoctor/:hospital_id/:doctor_id', doctorControllers.totalDeleteDoctor);

/* Página de buscar doctores */
router.get('/findDoctor', doctorControllers.openFindDoctor);

/* Form del buscador de doctores */
router.post('/formFindDoctor', doctorControllers.formFindDoctor);

module.exports = router;
