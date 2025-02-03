let connection = require('../config/db');
const bcrypt = require("bcrypt");

class DoctorControllers {

  openFormNewDoctor = (req, res) => {
    res.render('newDoctor', {data : req.params});
  };

  formNewDoctor = (req, res) => {
    let id = req.params.hospital_id;
    let {name, last_name, speciality, university_degree, description} = req.body;

    if(!name || !last_name || !speciality || !university_degree || !description){
      let data = {hospital_id:id};
      res.render('newDoctor', {data, message: "Por favor, completa todos los campos obligatorios"});
    }
    else {
      let sql = `INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description) VALUES (${id}, "${name}", "${last_name}", "${speciality}", "${university_degree}", "${description}")`;
  
      if(req.file){
        sql = `INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image) VALUES (${id}, "${name}", "${last_name}", "${speciality}", "${university_degree}", "${description}", "${req.file.filename}")`;
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

  openOneDoctor = (req, res) => {
    let sql = `SELECT doctor.*, hospital.name AS hospital_name FROM doctor, hospital WHERE doctor_id = ${req.params.doctor_id} AND hospital.hospital_id = ${req.params.hospital_id} AND doctor.logic_delete = 0`;
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else{
        res.render('oneDoctor', {data : result[0]});
      }
    });
  };

  openEditDoctor = (req, res) => {
    let sql = `SELECT * FROM doctor WHERE doctor_id=${req.params.doctor_id}`;

    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.render('editDoctor', {data: result[0]})
      }
    })
  };

  formEditDoctor = (req, res) => {
    let {name, last_name, speciality, university_degree, description} = req.body;

    if (!name || !last_name || !speciality || !university_degree || !description){
      let sql = `SELECT * FROM doctor WHERE doctor_id=${req.params.doctor_id} AND logic_delete=0`;
      connection.query(sql, (err, result) => {
        if(err){
          throw err;
        }
        else{
          res.render('editDoctor', {data : result[0], message : "Por favor, complete todos los campos obligatorios"});
        }
      });
    }
    else {
        let sql = `UPDATE doctor SET name='${name}', last_name='${last_name}', speciality='${speciality}', university_degree='${university_degree}', description='${description}' WHERE doctor_id=${req.params.doctor_id}`;

      if(req.file) {
        let sql = `UPDATE doctor SET name='${name}', last_name='${last_name}', speciality='${speciality}', university_degree='${university_degree}', description='${description}', image='${image}' WHERE doctor_id=${req.params.doctor_id}`;
      }
      connection.query(sql, (err, result) => {
        if(err){
          throw err;
        }
        else {
          res.redirect(`/doctor/oneDoctor/${req.params.hospital_id}/${req.params.doctor_id}`);
        }
      });
    };
  };

  lockEditDoctor = (req, res) => {
    let sql = `SELECT hospital_id, name, last_name, doctor_id FROM doctor WHERE doctor_id=${req.params.doctor_id} AND logic_delete=0`;

    console.log("GET ", req.params)
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.render('lockEditDoctor', {data : result[0]});
      }
    });
  };

  lockFormEditDoctor = (req, res) => {
    let id = req.params.hospital_id;
    let formPassword = req.body.password;
    let sql = `SELECT doctor.doctor_id, doctor.name, doctor.last_name, hospital.password, hospital.hospital_id FROM doctor, hospital WHERE doctor_id = ${req.params.doctor_id} AND hospital.hospital_id = ${id} AND doctor.logic_delete = 0;`;
    console.log("FORM", req.params)
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else{
        let passwordConLaQueComparar = result[0].password;

        bcrypt.compare(formPassword, passwordConLaQueComparar, (errHash, resultHash) => {
          if(errHash){
            throw errHash;
          } 
          else{
            if(!resultHash || !formPassword){
              res.render('lockEditDoctor', {message : "Contraseña incorrecta", data : result[0]});
            }
            else {
              res.redirect(`/doctor/editDoctor/${id}/${req.params.doctor_id}`);
            }          
          }
        });
      }
    });
  };

  openDeleteDoctor = (req, res) => {
    console.log(req.params);
    res.render("deleteDoctor", {data: req.params} );
  };

  logicDeleteDoctor = (req, res) => {
    console.log(req.params);
    let sql = `UPDATE doctor SET logic_delete=1 WHERE doctor_id=${req.params.doctor_id}`;

    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.redirect(`/hospital/oneHospital/${req.params.hospital_id}`);
      }
    });
  };

  totalDeleteDoctor = (req, res) => {
    let sql = `DELETE FROM doctor WHERE doctor_id=${req.params.doctor_id}`;

    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.redirect(`/hospital/oneHospital/${req.params.hospital_id}`);
      }
    });
  };

  openFindDoctor = (req, res) => {
    let sql = 'SELECT doctor.*, hospital.name AS hospital_name FROM doctor JOIN hospital ON doctor.hospital_id = hospital.hospital_id;';
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.render('findDoctor', {data: result});
      }
    })
  }

  formFindDoctorSelect = (req, res) => {
    let select = req.body.select;
    let sql = `SELECT * FROM doctor`;

    if(select == 1){
      sql = `SELECT * FROM doctor ORDER BY name ASC`;
    }
    else if(select == 2){
      sql = `SELECT * FROM doctor ORDER BY name DESC`;
    }
    else if(select == 3){
      sql = `SELECT * FROM doctor ORDER BY last_name ASC`;
    }
    else if(select == 4){
      sql = `SELECT * FROM doctor ORDER BY last_name DESC`;
    }
    else if(select == 5){
      sql = `SELECT * FROM doctor ORDER BY speciality ASC`;
    }
    else if(select == 6){
      sql = `SELECT * FROM doctor ORDER BY speciality DESC`;
    }
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.render('findDoctor', {data: result});
      }
    });
  };

  formFindDoctorText = (req, res) => {
    let {name, last_name, speciality} = req.body;
    let sql = `SELECT * FROM doctor`;

    if(name){
      sql = `SELECT * FROM doctor WHERE name='${name}'`;
    }
    else if(last_name){
      sql = `SELECT * FROM doctor WHERE last_name='${last_name}'`;
    }
    else if (speciality){
      sql = `SELECT * FROM doctor WHERE speciality='${speciality}'`;
    }
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else{
        res.render('findDoctor', {data: result});
      }
    });
  };

}; //FIN DE LOS CONTROLADORES

module.exports = new DoctorControllers();