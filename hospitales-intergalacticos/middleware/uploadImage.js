const multer = require("multer");

// -- Función de consiguración de donde y como se guardará la copia del archivo
let upload = (folder) => {
  //configurar el storage (como y donde guardamos la foto)
  const storage = multer.diskStorage({
    destination: `public/images/${folder}`,
    filename: function (req, file, cb){
      let originalName = file.originalname;
      const finalName = Date.now() + "-" + Math.round(Math.random() * 1E9) + "-" + originalName;
      cb(null, finalName);
    }
  });

  const executeUpload = multer({storage: storage}).single("image");

  return executeUpload;
}

module.exports = upload;