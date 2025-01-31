CREATE DATABASE space_hospitals;
USE space_hospitals;
-- DROP DATABASE space_hospitals;

CREATE TABLE hospital (
	hospital_id	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(80) NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    sector VARCHAR(50) NOT NULL,
    direction VARCHAR(100) NOT NULL,
    description VARCHAR(5000),
    image VARCHAR(100),
    logic_delete BOOLEAN DEFAULT 0
);

CREATE TABLE doctor (
	doctor_id MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    hospital_id SMALLINT UNSIGNED,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    speciality VARCHAR(30) NOT NULL,
    university_degree VARCHAR(100) NOT NULL,
    description VARCHAR(5000),
    image VARCHAR(100),
    logic_delete BOOLEAN DEFAULT 0,
	CONSTRAINT fk_hospital_id FOREIGN KEY (hospital_id)
		REFERENCES hospital(hospital_id) ON DELETE CASCADE ON UPDATE CASCADE
    
);

INSERT INTO hospital (name, email, password, phone_number, sector, direction, description, image) 
VALUES ('Hospital Central del sector XVII', 'hospitalcentralxvii@hospitalesinteresterales.espace', '1234', '952607080', 'Sector Central XVII', '24-00054-32', 'El Hospital Central del sector XVII es la cumbre de la medicina avanzada, un bastión de esperanza flotando entre las estrellas. Sus médicos, reconocidos en toda la galaxia, combinan tecnología de vanguardia con una compasión infinita, ofreciendo atención a múltiples especies con una precisión sin igual. Equipado con quirófanos antigravedad, inteligencia artificial diagnóstica y laboratorios de regeneración celular, el hospital es capaz de curar desde enfermedades humanas hasta dolencias exóticas de civilizaciones distantes. Su personal, entrenado en bioética interplanetaria, domina la genética cuántica y la cirugía neuroholográfica, asegurando tratamientos personalizados. Pacientes de todos los rincones del universo confían en su excelencia, sabiendo que cada médico, más allá de su inmenso conocimiento, entrega su corazón en cada caso. Nova Vita no solo sana cuerpos, sino que renueva vidas, iluminando la galaxia con su inquebrantable dedicación al bienestar universal.', 'latest-1-scaled.webp');


INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
VALUES (1, 'Hugo', 'Fernández López', 'Cardiólogo', 'Licenciado en Medicina por la universidad de Marte', 'Dr. Hugo Fernández López es un prestigioso cardiólogo con más de 20 años de experiencia salvando corazones. Apasionado por la medicina desde joven, estudió en las mejores universidades y se especializó en cirugía cardiovascular mínimamente invasiva. Conocido por su trato cercano y su incansable búsqueda de innovación, ha desarrollado técnicas pioneras para tratar enfermedades cardíacas con mayor precisión y menor riesgo. Dirige la unidad de cardiología de un hospital de renombre, donde combina tecnología avanzada con un enfoque humano y empático. Su compromiso con la salud de sus pacientes lo convierte en un referente en su campo, admirado tanto por colegas como por aquellos a quienes ha devuelto la esperanza de una vida plena.', 'FOTO');

    
INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
VALUES (1, 'Cirubot', 'RX-9000', 'Cirugía', 'Fábrica de médicos de la Academia Galáctica', 
'RX-9000 es un avanzado robot cirujano diseñado para realizar intervenciones de alta precisión en entornos de gravedad cero y en pacientes de múltiples especies. Equipado con inteligencia artificial avanzada, brazos quirúrgicos nanométricos y una base de datos médica intergaláctica, este autómata ha perfeccionado técnicas de cirugía minimamente invasiva. Su capacidad de análisis en tiempo real y su habilidad para ejecutar procedimientos sin margen de error lo convierten en el referente de la medicina del futuro. RX-9000 opera sin fatiga, sin temblores y con una eficiencia inigualable, redefiniendo los estándares de la cirugía avanzada.', 'FOTO');

INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
VALUES (1, 'Elena', 'Martínez Vega', 'Psicología Clínica', 'Doctora en Psicología por la Universidad de Marte', 
'La Dra. Elena Martínez Vega es una reconocida psicóloga clínica con más de 15 años de experiencia ayudando a pacientes a superar sus dificultades emocionales y mentales. Especializada en neurociencia cognitiva y terapia interplanetaria, combina métodos tradicionales con técnicas avanzadas de estimulación neuronal y realidad virtual terapéutica. Su enfoque empático y personalizado ha permitido que cientos de personas, desde astronautas hasta colonos espaciales, logren el bienestar emocional en entornos de alta presión. Conocida por su dedicación y su compromiso con la salud mental, la Dra. Martínez Vega es una figura clave en la psicología del futuro.', 
'FOTO');

INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
VALUES (1, 'Unidad Anestésica', 'DP-0031', 'Anestesiología', 'Fábrica de médicos de la Academia Galáctica', 
'DP-0031 es un robot anestesista de última generación diseñado para administrar anestesia con una precisión absoluta en procedimientos quirúrgicos interplanetarios. Equipado con inteligencia artificial avanzada y sensores biométricos en tiempo real, ajusta la dosificación con exactitud para cada paciente, independientemente de su fisiología o especie. Su capacidad para monitorear signos vitales y responder instantáneamente a cualquier variación lo convierte en un asistente quirúrgico imprescindible. Incansable y sin margen de error, DP-0031 ha revolucionado la anestesiología, garantizando intervenciones más seguras y eficientes en el Hospital Central del sector XVII.', 
'FOTO');

SELECT * FROM doctor;
SELECT * FROM hospital;



