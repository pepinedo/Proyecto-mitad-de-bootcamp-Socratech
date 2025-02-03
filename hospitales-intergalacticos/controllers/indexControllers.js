let connection = require('../config/db');

class IndexControllers {

  openIndex = (req, res) => {
    let sql = `SELECT * FROM new WHERE active=1`;
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