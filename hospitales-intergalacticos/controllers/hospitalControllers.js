let connection = require('../config/db');
const bcrypt = require("bcrypt");

class HospitalControllers {

  /* Página de añadir hospital */
  openNewHospital = (req, res) => {
    res.render('newHospital');
  };

  /* Formulario de añadir hospital */
  formNewHospital = (req, res) => {
    console.log(req.body);
    console.log(req.file);

    let {name, email, password, repPassword, phone_number, sector, direction, description} = req.body;

    if (password != repPassword){
      res.render('newHospital', {message: "Las contraseñas no coinciden"});
    }
    else if (!name || !email || !password || !phone_number || !sector || !direction || !description || !req.file.filename){
      res.render('newHospital', {message: "Algún campo está vacío"});
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
              res.redirect('/hospital/allHospital');
            }
          });
        }
      });
    }
  };

  openAllHospital = (req, res) => {
    let sql = `SELECT hospital_id, name, sector, image FROM hospital`;

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
    res.send("Un hospital");
  }

} //FIN DE LOS CONTROLADORES

module.exports = new HospitalControllers();