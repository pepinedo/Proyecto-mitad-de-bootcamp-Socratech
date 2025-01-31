let connection = require('../config/db');

class IndexControllers {

  openIndex = (req, res) => {
    let sql = `SELECT * FROM hospital WHERE logic_delete = 0`;
    connection.query(sql, (err, result) =>{
      if(err){
        throw err;
      }
      else{
        console.log(result);
        res.render('index', {data : result});
      }
    });
  };


} //FIN DEL INDEXCONTROLLERS

module.exports = new IndexControllers();