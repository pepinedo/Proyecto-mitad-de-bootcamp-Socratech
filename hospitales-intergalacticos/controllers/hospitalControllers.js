let connection = require('../config/db');
const bcrypt = require("bcrypt");

class HospitalControllers {

  openNewHospital = (req, res) => {
    res.render('newHospital');
  };

  formNewHospital = (req, res) => {
    console.log(req.body);
    console.log(req.file);

    let {name, email, password, repPassword, phone_number, sector, direction, description} = req.body;

    if (password != repPassword){
      res.render('newHospital', {message: "Las contraseñas no coinciden"});
    }
    else if (!name || !email || !password || !phone_number || !sector || !direction || !description || !req.file){
      res.render('newHospital', {message: "Por favor, completa todos los campos"});
    }
    else {
      bcrypt.hash(password, 10, (errHash, hash) => {
        if(errHash){
          throw errHash;
        }
        else {
          let sql = `INSERT INTO hospital (name, email, password, phone_number, sector, direction, description, image) VALUES ("${name}", "${email}", "${hash}", "${phone_number}", "${sector}", "${direction}", "${description}", "${req.file.filename}")`;

          connection.query(sql, (err, result) => {
            if(err){
              throw err;
            }
            else{
              res.redirect(`/hospital/allHospital`);
            }
          });
        }
      });
    }
  };

  openAllHospital = (req, res) => {
    let sql = `SELECT hospital_id, name, sector, image FROM hospital WHERE logic_delete = 0`;

    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else{
        console.log(result);
        res.render('allHospital', {data : result});
      }
    });
  };

  openOneHospital = (req, res) => {
    let id = req.params.hospital_id;
    let sqlHospital = `SELECT * FROM hospital WHERE hospital_id=${id} AND logic_delete=0`;
    let sqlDoctor = `SELECT doctor_id, name, last_name, speciality, image FROM doctor WHERE hospital_id = ${id} AND logic_delete = 0`;

    connection.query(sqlHospital, (errHospital, resultHospital) => {
      if(errHospital){
        throw errHospital;
      }
      else{
        connection.query(sqlDoctor, (errDoctor, resultDoctor) => {
          if(errDoctor){
            throw errDoctor;
          }
          else {
            console.log("--------------- Result de hospital ---------------------\n", resultHospital);
            console.log("--------------- Result de doctor ---------------------\n", resultDoctor);
            res.render('oneHospital', {dataHospital : resultHospital[0], dataDoctor : resultDoctor});
          }
        })
      }
    })
  }

  lockEditHospital = (req, res) => {
    let id = req.params.hospital_id;
    let sql = `SELECT hospital_id, name FROM hospital WHERE hospital_id=${id} AND logic_delete=0`;

    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        console.log(result);
        res.render('lockEditHospital', {data : result[0]});
      }
    });
  };

  lockFormEditHospital = (req, res) => {
    let id = req.params.hospital_id;
    let formPassword = req.body.password;
    let sql = `SELECT hospital_id, password, name FROM hospital WHERE hospital_id=${id} AND logic_delete=0`;

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
            console.log(resultHash);
            if(!resultHash || !formPassword){
              res.render('lockEditHospital', {message : "Contraseña incorrecta", data : result[0]});
            }
            else {
              res.redirect(`/hospital/editHospital/${id}`);
            }          
          }
        });
      }
    });
  };

  openEditHospital = (req, res) => {
    let id = req.params.hospital_id;

    let sql = `SELECT * FROM hospital WHERE hospital_id=${id} AND logic_delete=0`;
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else{
        console.log(result);
        res.render('editHospital', {data : result[0]});
      }
    });
  };

  formEditHospital = (req, res) => {
    let id = req.params.hospital_id;
    console.log(req.body);
    let {name, email, password, repPassword, phone_number, sector, direction, description} = req.body;
    let data = {id, name, email, password, repPassword, phone_number, sector, direction, description};
    console.log(data);
    
    if (password != repPassword){
      let sql = `SELECT * FROM hospital WHERE hospital_id=${id} AND logic_delete=0`;
      connection.query(sql, (err, result) => {
        if(err){
          throw err;
        }
        else{
          console.log(result);
          res.render('editHospital', {data : result[0], message : "Las contraseñas no coinciden"});
        }
      });
    }
    else if (!name || !email || !password || !phone_number || !sector || !direction || !description){
      let sql = `SELECT * FROM hospital WHERE hospital_id=${id} AND logic_delete=0`;
      connection.query(sql, (err, result) => {
        if(err){
          throw err;
        }
        else{
          console.log(result);
          res.render('editHospital', {data : result[0], message : "Por favor, complete todos los campos obligatorios"});
        }
      });
    }
    else {
      bcrypt.hash(password, 10, (errHash, hash) => {
        if(errHash){
          throw errHash;
        }
        else {
          if(!req.file){
            let sql = `INSERT INTO hospital (name, email, password, phone_number, sector, direction, description) VALUES ("${name}", "${email}", "${hash}", "${phone_number}", "${sector}", "${direction}", "${description}")`;
          }
          else{
            let sql = `INSERT INTO hospital (name, email, password, phone_number, sector, direction, description, image) VALUES ("${name}", "${email}", "${hash}", "${phone_number}", "${sector}", "${direction}", "${description}", "${req.file.filename}")`;
          }
          connection.query(sql, (err, result) => {
            if(err){
              throw err;
            }
            else{
              res.redirect(`/hospital/oneHospital/${req.params.hospital_id}`);
            }
          });
        }
      });
    }
  };

  deleteHospital = (req, res) => {
    let id = req.params.hospital_id;
    console.log(req.params);

    res.render("deleteHospital", {data : req.params});
  };

  logicDeleteHospital = (req, res) => {
    let id = req.params.hospital_id;

    let sql = `UPDATE hospital SET logic_delete=1 WHERE hospital_id=${id}`;
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.redirect('/hospital/allHospital');
      }
    });
  };

  totalDeleteHospital = (req, res) => {
    let id = req.params.hospital_id;

    let sql = `DELETE FROM hospital WHERE hospital_id=${id}`;
    connection.query(sql, (err, result) => {
      if(err){
        throw err;
      }
      else {
        res.redirect('/hospital/allHospital');
      }
    });
  };


} //FIN DE LOS CONTROLADORES

module.exports = new HospitalControllers();