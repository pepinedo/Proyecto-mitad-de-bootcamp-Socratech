CREATE DATABASE space_hospitals;
USE space_hospitals;
-- DROP DATABASE space_hospitals;

CREATE TABLE hospital (
	hospital_id	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(80) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    sector VARCHAR(50) NOT NULL,
    direction VARCHAR(100) NOT NULL,
    description VARCHAR(5000),
    image VARCHAR(100),
    logic_delete BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE doctor (
	doctor_id MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    hospital_id SMALLINT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    speciality VARCHAR(30) NOT NULL,
    university_degree VARCHAR(100) NOT NULL,
    description VARCHAR(5000),
    image VARCHAR(100),
    logic_delete BOOLEAN NOT NULL DEFAULT 0,
	CONSTRAINT fk_hospital_id FOREIGN KEY (hospital_id)
		REFERENCES hospital(hospital_id) ON DELETE CASCADE ON UPDATE CASCADE
    
);

INSERT INTO hospital (name, email, password, phone_number, sector, direction, description, image) 
	VALUES
	('Hospital Central del sector XVII', 'hospitalcentralxvii@hospitalesinteresterales.espace', '$2b$10$NTI87xY1LtbDUrJ94zLwXeSTMj.dcfPd/9Bh8b8oihEm081odbuuu', '952607080', 'Sector Central XVII', '24-00054-32', 'El Hospital Central del sector XVII es la cumbre de la medicina avanzada, un bastión de esperanza flotando entre las estrellas. Sus médicos, reconocidos en toda la galaxia, combinan tecnología de vanguardia con una compasión infinita, ofreciendo atención a múltiples especies con una precisión sin igual. Equipado con quirófanos antigravedad, inteligencia artificial diagnóstica y laboratorios de regeneración celular, el hospital es capaz de curar desde enfermedades humanas hasta dolencias exóticas de civilizaciones distantes. Su personal, entrenado en bioética interplanetaria, domina la genética cuántica y la cirugía neuroholográfica, asegurando tratamientos personalizados. Pacientes de todos los rincones del universo confían en su excelencia, sabiendo que cada médico, más allá de su inmenso conocimiento, entrega su corazón en cada caso. Hospital Central del sector XVII no solo sana cuerpos, sino que renueva vidas, iluminando la galaxia con su inquebrantable dedicación al bienestar universal.', '1738310608470-221786705-big_spaceship.jpg'),
	('Hospital Estelar de Andrómeda Prime', 'hospitalandromeda@galacticmed.space', '$2b$10$NTI87xY1LtbDUrJ94zLwXeSTMj.dcfPd/9Bh8b8oihEm081odbuuu', '952607081', 'Sector Andrómeda Prime', '12-45000-78', 'El Hospital Estelar de Andrómeda Prime es un faro de innovación médica en el corazón de la galaxia. Con su arquitectura flotante y sus salas de tratamiento adaptativas, este hospital atiende a especies de todos los rincones del universo. Equipado con tecnología de teletransporte médico, nanobots curativos y cámaras de regeneración molecular, el hospital ofrece soluciones médicas que desafían los límites de la ciencia. Su equipo de expertos en xenobiología y medicina cuántica garantiza que cada paciente reciba atención personalizada, independientemente de su origen. Andrómeda Prime no solo cura enfermedades, sino que también redefine lo que significa estar sano en un universo lleno de posibilidades.', 'USS-Enterprise.jpg'),
	('Centro Médico Nebulosa Omega', 'nebulosaomega@galacticmed.space', '$2b$10$NTI87xY1LtbDUrJ94zLwXeSTMj.dcfPd/9Bh8b8oihEm081odbuuu', '952607082', 'Sector Nebulosa Omega', '45-67000-12', 'El Centro Médico Nebulosa Omega es un santuario de salud ubicado en el borde de la galaxia, donde la ciencia y la magia de la medicina se fusionan. Con sus salas de diagnóstico holográfico y sus laboratorios de ingeniería genética, este centro es pionero en el tratamiento de enfermedades raras y mutaciones interestelares. Su personal, compuesto por médicos y científicos de renombre galáctico, utiliza tecnología de realidad virtual para simular procedimientos complejos y garantizar resultados óptimos. El centro también cuenta con un jardín botánico interestelar que cultiva plantas medicinales de planetas lejanos, utilizadas en tratamientos alternativos. Nebulosa Omega no solo cura, sino que también inspira a las futuras generaciones de médicos galácticos.', '7886254._SX540.jpg'),
	('Hospital Intergaláctico de Sirius IX', 'siriusix@galacticmed.space', '$2b$10$NTI87xY1LtbDUrJ94zLwXeSTMj.dcfPd/9Bh8b8oihEm081odbuuu', '952607083', 'Sector Sirius IX', '89-12000-34', 'El Hospital Intergaláctico de Sirius IX es un coloso de la medicina moderna, ubicado en el sistema estelar más brillante de la galaxia. Con sus torres de diagnóstico lumínico y sus salas de cirugía robótica, este hospital es líder en el tratamiento de enfermedades crónicas y lesiones traumáticas. Su equipo de médicos, entrenados en las academias más prestigiosas del universo, combina tecnología de punta con un enfoque holístico para garantizar la recuperación completa de sus pacientes. El hospital también alberga un centro de investigación dedicado a la exploración de nuevas fronteras médicas, como la telepatía curativa y la manipulación del tiempo biológico. Sirius IX no solo es un hospital, sino un símbolo de esperanza y progreso en la galaxia.', '1706128082974-1024x683.jpg');

INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
	VALUES 
    (1, 'Hugo', 'Fernández López', 'Cardiólogo', 'Licenciado en Medicina por la universidad de Marte', 'Dr. Hugo Fernández López es un prestigioso cardiólogo con más de 20 años de experiencia salvando corazones. Apasionado por la medicina desde joven, estudió en las mejores universidades y se especializó en cirugía cardiovascular mínimamente invasiva. Conocido por su trato cercano y su incansable búsqueda de innovación, ha desarrollado técnicas pioneras para tratar enfermedades cardíacas con mayor precisión y menor riesgo. Dirige la unidad de cardiología de un hospital de renombre, donde combina tecnología avanzada con un enfoque humano y empático. Su compromiso con la salud de sus pacientes lo convierte en un referente en su campo, admirado tanto por colegas como por aquellos a quienes ha devuelto la esperanza de una vida plena.', 'fb354befa31fbd32d5403af99a1d8838.jpeg'),
	(1, 'Cirubot', 'RX-9000', 'Cirugía', 'Fábrica de médicos de la Academia Galáctica', 'RX-9000 es un avanzado robot cirujano diseñado para realizar intervenciones de alta precisión en entornos de gravedad cero y en pacientes de múltiples especies. Equipado con inteligencia artificial avanzada, brazos quirúrgicos nanométricos y una base de datos médica intergaláctica, este autómata ha perfeccionado técnicas de cirugía minimamente invasiva. Su capacidad de análisis en tiempo real y su habilidad para ejecutar procedimientos sin margen de error lo convierten en el referente de la medicina del futuro. RX-9000 opera sin fatiga, sin temblores y con una eficiencia inigualable, redefiniendo los estándares de la cirugía avanzada.', 'raf,360x360,075,t,fafafa_ca443f4786.jpg'),
    (1, 'Elena', 'Martínez Vega', 'Psicología Clínica', 'Doctora en Psicología por la Universidad de Marte', 'La Dra. Elena Martínez Vega es una reconocida psicóloga clínica con más de 15 años de experiencia ayudando a pacientes a superar sus dificultades emocionales y mentales. Especializada en neurociencia cognitiva y terapia interplanetaria, combina métodos tradicionales con técnicas avanzadas de estimulación neuronal y realidad virtual terapéutica. Su enfoque empático y personalizado ha permitido que cientos de personas, desde astronautas hasta colonos espaciales, logren el bienestar emocional en entornos de alta presión. Conocida por su dedicación y su compromiso con la salud mental, la Dra. Martínez Vega es una figura clave en la psicología del futuro.', 'estela-ruiz-psicologa-400x400.jpg'),
    (1, 'Unidad Anestésica', 'DP-0031', 'Anestesiología', 'Fábrica de médicos de la Academia Galáctica', 'DP-0031 es un robot anestesista de última generación diseñado para administrar anestesia con una precisión absoluta en procedimientos quirúrgicos interplanetarios. Equipado con inteligencia artificial avanzada y sensores biométricos en tiempo real, ajusta la dosificación con exactitud para cada paciente, independientemente de su fisiología o especie. Su capacidad para monitorear signos vitales y responder instantáneamente a cualquier variación lo convierte en un asistente quirúrgico imprescindible. Incansable y sin margen de error, DP-0031 ha revolucionado la anestesiología, garantizando intervenciones más seguras y eficientes en el Hospital Central del sector XVII.', 'istockphoto-480761927-612x612.jpg');

INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
VALUES 
    (2, 'Carlos', 'Gutiérrez Rojas', 'Oncología', 'Doctor en Medicina por la Universidad de Marte', 'El Dr. Carlos Gutiérrez Rojas es un oncólogo especializado en el tratamiento de cánceres interplanetarios. Con más de 18 años de experiencia, ha desarrollado terapias innovadoras que combinan quimioterapia avanzada y técnicas de inmunoterapia galáctica. Su enfoque multidisciplinario y su dedicación a la investigación lo han convertido en un referente en la lucha contra el cáncer en entornos espaciales.', 'carlos-gutierrez.jpg'),
    (2, 'Laura', 'Mendoza Solís', 'Pediatría', 'Licenciada en Pediatría por la Universidad de Marte', 'La Dra. Laura Mendoza Solís es una pediatra con una pasión por el cuidado de los más pequeños. Especializada en medicina infantil en entornos de gravedad cero, ha desarrollado protocolos para garantizar el crecimiento saludable de niños en colonias espaciales. Su trato cálido y su enfoque preventivo la han convertido en una figura querida por familias de todo el sistema solar.', 'laura-mendoza.jpg'),
    (2, 'Roberto', 'Navarro Díaz', 'Neurología', 'Doctor en Neurología por la Universidad de Marte', 'El Dr. Roberto Navarro Díaz es un neurólogo especializado en trastornos del sistema nervioso en entornos espaciales. Con más de 20 años de experiencia, ha tratado a astronautas y colonos con enfermedades neurodegenerativas y lesiones cerebrales. Su trabajo en neuroplasticidad y rehabilitación neuronal ha sido pionero en la medicina interplanetaria.', 'roberto-navarro.jpg'),
    (2, 'Unidad Quirúrgica', 'QX-2000', 'Cirugía', 'Fábrica de médicos de la Academia Galáctica', 'QX-2000 es un robot quirúrgico diseñado para realizar operaciones de alta complejidad en entornos de gravedad cero. Equipado con inteligencia artificial avanzada y herramientas quirúrgicas nanométricas, puede realizar procedimientos con una precisión milimétrica. Su capacidad para adaptarse a diferentes anatomías lo hace indispensable en el quirófano.', 'qx-2000.jpg'),
    (2, 'Sofía', 'López Torres', 'Ginecología', 'Doctora en Ginecología por la Universidad de Marte', 'La Dra. Sofía López Torres es una ginecóloga especializada en salud reproductiva en entornos espaciales. Con más de 15 años de experiencia, ha ayudado a cientos de mujeres a tener embarazos y partos seguros en colonias interplanetarias. Su enfoque integral y su dedicación a la salud femenina la han convertido en una líder en su campo.', 'sofia-lopez.jpg'),
    (2, 'Unidad Diagnóstica', 'DX-5000', 'Diagnóstico por Imágenes', 'Fábrica de médicos de la Academia Galáctica', 'DX-5000 es un robot especializado en diagnóstico por imágenes. Equipado con tecnología de escaneo tridimensional y algoritmos de inteligencia artificial, puede detectar anomalías en tejidos y órganos con una precisión sin precedentes. Su capacidad para procesar grandes volúmenes de datos lo convierte en una herramienta esencial para el diagnóstico temprano.', 'dx-5000.jpg');

INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
VALUES 
    (3, 'Ana', 'García Ruiz', 'Dermatología', 'Doctora en Dermatología por la Universidad de Marte', 'La Dra. Ana García Ruiz es una dermatóloga especializada en el cuidado de la piel en entornos espaciales. Con más de 12 años de experiencia, ha desarrollado tratamientos innovadores para proteger la piel de la radiación cósmica y otros factores ambientales. Su enfoque preventivo y su dedicación a la salud cutánea la han convertido en una referente en su campo.', 'ana-garcia.jpg'),
    (3, 'Javier', 'Morales Castro', 'Ortopedia', 'Doctor en Ortopedia por la Universidad de Marte', 'El Dr. Javier Morales Castro es un ortopedista especializado en el tratamiento de lesiones musculoesqueléticas en entornos de gravedad cero. Con más de 15 años de experiencia, ha desarrollado prótesis y técnicas quirúrgicas avanzadas para pacientes de múltiples especies. Su trabajo en rehabilitación física ha sido fundamental para la recuperación de astronautas y colonos.', 'javier-morales.jpg'),
    (3, 'Unidad de Emergencias', 'ER-7000', 'Medicina de Emergencias', 'Fábrica de médicos de la Academia Galáctica', 'ER-7000 es un robot especializado en medicina de emergencias. Equipado con sensores biométricos y herramientas de diagnóstico rápido, puede atender a pacientes críticos en cuestión de segundos. Su capacidad para operar en condiciones extremas lo hace indispensable en situaciones de crisis.', 'er-7000.jpg'),
    (3, 'Carmen', 'Vega Sánchez', 'Endocrinología', 'Doctora en Endocrinología por la Universidad de Marte', 'La Dra. Carmen Vega Sánchez es una endocrinóloga especializada en el tratamiento de trastornos hormonales en entornos espaciales. Con más de 10 años de experiencia, ha desarrollado terapias personalizadas para pacientes expuestos a condiciones extremas. Su enfoque integral y su dedicación a la investigación la han convertido en una líder en su campo.', 'carmen-vega.jpg'),
    (3, 'Unidad de Rehabilitación', 'RH-3000', 'Fisioterapia', 'Fábrica de médicos de la Academia Galáctica', 'RH-3000 es un robot especializado en fisioterapia y rehabilitación. Equipado con tecnología de estimulación muscular y sensores de movimiento, puede diseñar programas de recuperación personalizados para pacientes de múltiples especies. Su capacidad para adaptarse a diferentes necesidades lo hace indispensable en la rehabilitación interplanetaria.', 'rh-3000.jpg'),
    (3, 'Miguel', 'Torres Gómez', 'Psiquiatría', 'Doctor en Psiquiatría por la Universidad de Marte', 'El Dr. Miguel Torres Gómez es un psiquiatra especializado en el tratamiento de trastornos mentales en entornos espaciales. Con más de 12 años de experiencia, ha desarrollado terapias innovadoras que combinan técnicas tradicionales con realidad virtual terapéutica. Su enfoque humano y su dedicación a la salud mental lo han convertido en un referente en su campo.', 'miguel-torres.jpg');
    
INSERT INTO doctor (hospital_id, name, last_name, speciality, university_degree, description, image)
VALUES 
    (4, 'Isabel', 'Díaz Romero', 'Oftalmología', 'Doctora en Oftalmología por la Universidad de Marte', 'La Dra. Isabel Díaz Romero es una oftalmóloga especializada en el cuidado de la visión en entornos espaciales. Con más de 10 años de experiencia, ha desarrollado tratamientos innovadores para proteger los ojos de la radiación cósmica y otros factores ambientales. Su enfoque preventivo y su dedicación a la salud visual la han convertido en una referente en su campo.', 'isabel-diaz.jpg'),
    (4, 'Unidad de Radiología', 'RD-4000', 'Radiología', 'Fábrica de médicos de la Academia Galáctica', 'RD-4000 es un robot especializado en radiología. Equipado con tecnología de escaneo tridimensional y algoritmos de inteligencia artificial, puede detectar anomalías en tejidos y órganos con una precisión sin precedentes. Su capacidad para procesar grandes volúmenes de datos lo convierte en una herramienta esencial para el diagnóstico temprano.', 'rd-4000.jpg'),
    (4, 'Alejandro', 'Sánchez López', 'Urología', 'Doctor en Urología por la Universidad de Marte', 'El Dr. Alejandro Sánchez López es un urólogo especializado en el tratamiento de trastornos del sistema urinario en entornos espaciales. Con más de 15 años de experiencia, ha desarrollado técnicas quirúrgicas mínimamente invasivas para pacientes de múltiples especies. Su enfoque innovador y su dedicación a la investigación lo han convertido en un referente en su campo.', 'alejandro-sanchez.jpg'),
    (4, 'Unidad de Cuidados Intensivos', 'ICU-1000', 'Medicina Intensiva', 'Fábrica de médicos de la Academia Galáctica', 'ICU-1000 es un robot especializado en cuidados intensivos. Equipado con sensores biométricos y herramientas de monitoreo avanzado, puede atender a pacientes críticos en tiempo real. Su capacidad para operar en condiciones extremas lo hace indispensable en unidades de cuidados intensivos.', 'icu-1000.jpg'),
    (4, 'Patricia', 'Romero García', 'Nutrición', 'Doctora en Nutrición por la Universidad de Marte', 'La Dra. Patricia Romero García es una nutricionista especializada en el diseño de dietas para entornos espaciales. Con más de 10 años de experiencia, ha desarrollado planes alimenticios personalizados para astronautas y colonos. Su enfoque integral y su dedicación a la salud nutricional la han convertido en una líder en su campo.', 'patricia-romero.jpg'),
    (4, 'Unidad de Farmacología', 'PH-6000', 'Farmacología', 'Fábrica de médicos de la Academia Galáctica', 'PH-6000 es un robot especializado en farmacología. Equipado con inteligencia artificial avanzada, puede diseñar y administrar medicamentos personalizados para pacientes de múltiples especies. Su capacidad para analizar interacciones farmacológicas lo hace indispensable en el tratamiento de enfermedades complejas.', 'ph-6000.jpg');
    
SELECT * FROM doctor;
SELECT * FROM hospital;

CREATE TABLE new (
	new_id	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tittle VARCHAR(50) NOT NULL,
	short_description VARCHAR(500) NOT NULL,
    description VARCHAR(5000),
    image VARCHAR(100),
    active BOOLEAN NOT NULL DEFAULT 1
);

INSERT INTO new (tittle, short_description, description, image)
VALUES 
	("Un virus arrasa Gorbolus", "Gorbulus se vuelve prácticamente inaccesible debido al virus KLM-3030", "", "virus.jpg"),
    ("Corvotroxin", "El nuevo tratamiento contra la metamorfosis repentina", "", "medicacion.jpg"),
    ("Trobulus Klink vuelve", "El prestigioso médico, que se creía muerto, vuelve con una nueva historia", "", "medico.jpeg");
    
SELECT * FROM new;

