let connection = require('../config/db');
const bcrypt = require("bcrypt");

class DoctorControllers {

  openFormNewDoctor = (req, res) => {
    res.render('newDoctor', {data : req.params});
  };

  formNewDoctor = (req, res) => {
    let id = req.params.hospital_id;
    let {name, last_name, speciality, university_degree, description} = req.body;
    console.log(req.body);
    console.log(req.file)

    if(!name || !last_name || !speciality || !university_degree || !description){
      let data = {hospital_id:id};
      res.render('newDoctor', {data, message: "Por favor, completa todos los campos obligatorios"});
    }
    else {
      let sql = `INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description) VALUES (${id}, "${name}", "${last_name}", "${speciality}", "${university_degree}", "${description}")`;
  
      if(req.file){
        let sql = `INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image) VALUES (${id}, "${name}", "${last_name}", "${speciality}", "${university_degree}", "${description}", "${req.file.filename}")`;
      }      
      connection.query(sql, (err, result) => {
        if(err){
          throw err;
        }
        else {
          res.redirect(`/hospital/oneHospital/${id}`);
        }
      });
    }


  };

}; //FIN DE LOS CONTROLADORES

module.exports = new DoctorControllers();