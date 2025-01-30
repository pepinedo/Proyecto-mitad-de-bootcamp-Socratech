const mysql2 = require('mysql2');
const connection = mysql2.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'space_hospitals'
});

connection.connect((err)=>{
    if(err){
        console.log('error al conectar', err);
        return;
    }
    console.log("Conectado correctamente con la base de datos ->space_hospitals<-");
}
)
module.exports = connection;