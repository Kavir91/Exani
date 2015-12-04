-- -----------------------------------------------------
-- usuario
-- -----------------------------------------------------
CREATE USER 'examen'@'localhost' IDENTIFIED BY 'accesible';
GRANT ALL PRIVILEGES ON examenfinal.* TO 'examen'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
-- -----------------------------------------------------
-- BD
-- -----------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema examenfinal
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `examenfinal` ;
CREATE SCHEMA IF NOT EXISTS `examenfinal` DEFAULT CHARACTER SET utf8 ;
USE `examenfinal` ;

-- -----------------------------------------------------
-- Table `examenfinal`.`aspirante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examenfinal`.`aspirante` (
  `folioUV` INT(9) NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `ap_paterno` VARCHAR(50) NULL,
  `ap_materno` VARCHAR(50) NULL,
  PRIMARY KEY (`folioUV`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `examenfinal`.`examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examenfinal`.`examen` (
  `idExamen` INT(10) NOT NULL AUTO_INCREMENT,
  `fechadeExamen` DATE NOT NULL,
  `horaInicio` TIME NULL,
  `horaFinal` TIME NULL,
  PRIMARY KEY (`idExamen`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `examenfinal`.`Secciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examenfinal`.`Secciones` (
  `idSecciones` INT NOT NULL,
  `nombreSeccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idSecciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examenfinal`.`preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examenfinal`.`preguntas` (
  `numeroPregunta` INT(3) NOT NULL,
  `textoPregunta` TEXT NOT NULL,
  `incisoA` TEXT NULL,
  `incisoB` TEXT NULL,
  `incisoC` TEXT NULL,
  `incisoD` TEXT NULL,
  `Secciones_idSecciones` INT NOT NULL,
  `instruccion` TEXT NULL,
  PRIMARY KEY (`numeroPregunta`),
  INDEX `fk_preguntas_Secciones1_idx` (`Secciones_idSecciones` ASC),
  CONSTRAINT `fk_preguntas_Secciones1`
    FOREIGN KEY (`Secciones_idSecciones`)
    REFERENCES `examenfinal`.`Secciones` (`idSecciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `examenfinal`.`respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examenfinal`.`respuestas` (
  `respuesta` ENUM('A','B','C','D','5') NULL,
  `preguntas_numeroPregunta` INT(3) NOT NULL,
  `aspirante_folioUV` INT(9) NOT NULL,
  INDEX `fk_respuestas_preguntas1_idx` (`preguntas_numeroPregunta` ASC),
  INDEX `fk_respuestas_aspirante1_idx` (`aspirante_folioUV` ASC),
  CONSTRAINT `fk_respuestas_preguntas1`
    FOREIGN KEY (`preguntas_numeroPregunta`)
    REFERENCES `examenfinal`.`preguntas` (`numeroPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuestas_aspirante1`
    FOREIGN KEY (`aspirante_folioUV`)
    REFERENCES `examenfinal`.`aspirante` (`folioUV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `examenfinal`.`acceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examenfinal`.`acceso` (
  `clave` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`clave`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- -----------------------------------------------------
-- SECCION INSERTS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Tabla Secciones
-- -----------------------------------------------------

Insert into secciones (`idSecciones`,`NombreSeccion`) 
values 
('1','Pensamiento Matemático'),
('2','Pensamiento Analítico'),
('3','Estructura de la Lengua'),
('4','Comprensión Lectora');

-- -----------------------------------------------------
-- Tabla Aspirantes
-- -----------------------------------------------------

Insert into aspirante (`folioUV`,`nombre`,`ap_paterno`,`ap_materno`) 
values 
('723675307','Roberto Carlos','López','Espinoza'),
('725413902','Raymundo','Ixtla','Hernandez'),
('732820805','Freddy','Sánchez','Díaz'),
('723116006','Edwin Michel','Martínez','Solis'),
('723724009','Claudia','Conde','Montero'),
('722367007','Javier','Ramírez','Agustín'),
('725166602','Guillian','Ramírez','Camacho'),
('724177504','Luis Manuel','Mota','Ramírez'),
('732830303','Saul Abinadar','Hernández','Pazos'),
('724960104','Viridiana','Rendón','Alcántara'),
('725160508','Viridiana','Rendón','Alcántara'),
('724782907','Magdaly Stefany','Temix','Delgadillo'),
('732829504','Dulce Margarita','Santiago','Martínez');

-- -----------------------------------------------------
-- Tabla Acceso
-- -----------------------------------------------------

Insert into acceso (`clave`) 
values 
('acceso2015');

-- -----------------------------------------------------
-- Tabla Preguntas
-- -----------------------------------------------------


INSERT into `preguntas` (`numeroPregunta`,`textoPregunta`,`incisoA`,`incisoB`,`incisoC`,`incisoD`,`Secciones_idSecciones`,`instruccion`)
values 
('1','Un terreno cuadrangular, cuyos lados miden 10 metros cada uno, está cercado por postes que mantienen una separación de 1 metro entre ellos. ¿Cuántos postes forman el cerco en cada lado del terreno?','9','10','11','8','1',''),
('2','Es el resultado de realizar la operación: abre paréntesis 9 cierra paréntesis; abre paréntesis 4 cierra paréntesis más 4 medios.','14','20','38','40','1',''),
('3','Un lago pierde por evaporización 5 Litros de agua, si la temperatura del día llega a los 42 grados. Pierde 3 Litros si la temperatura del día no pasa los 40 grados. Si en la semana hubo 3 días de 43 grados, 2 días de 39 grados y 2 días de 40 grados. ¿Cuántos litros perdió el lago en la semana?','21','27','31','35','1',''),
('4','¿Cuál es la expresión que corresponde al doble de abre paréntesis 1 sobre x más x cierra paréntesis?','1 sobre 2x + 2x','2 abre paréntesis 1 sobre x cierra paréntesis + x','1 sobre x al cuadrado + x al cuadrado','2 sobre x + 2x','1',''),
('5','Desarrolle el binomio (x + 3) elevado al cuadrado.','x al cuadrado + 9','x al cuadrado - 6x + 9','x al cuadrado + 6x - 9','x al cuadrado + 6x + 9','1',''),
('6','Número de paros...3;10;5;4;9;3;9;8;4;9;6;8','3.0','6.7','7.0','9.0','1','El cuadro corresponde al número de paros al mes de una máquina fabricante de computadoras. ¿Cuál es la mediana?'),
('7','Determine los factores de m al cuadrado - 17m + 16.','abre paréntesis m + 2 cierra paréntesis abre parénstesis m - 8 cierra paréntesis','abre paréntesis m - 5 cierra paréntesis abre parénstesis m - 12 cierra paréntesis','abre paréntesis m + 1 cierra paréntesis abre parénstesis m + 16 cierra paréntesis','abre paréntesis m - 1 cierra paréntesis abre parénstesis m - 16 cierra paréntesis','1',''),
('8','El resultado de abre paréntesis 2x - 3y cierra paréntesis al cubo es:','8 x al cubo + 27 y al cubo','8 x al cubo + 36 x 2 y + 54 xy al cubo + 27 y al cubo','8 x al cubo - 27 y al cubo','8 x al cubo - 36 x 2 y + 54 xy al cuadrado - 27 y al cubo','1',''),
('9','Esta es una pregunta de control. Elija la letra B.','A','B','C','D','1',''),
('10','La suma de las edades de 3 personas es 61. Si la mayor tiene 28 años más que la menor y la de en medio tiene 16 años menos que la mayor, la edad de la de en medio es:','17','19','21','23','1',''),
('11','La solución de la ecuación cuadrática ax al cuadrado + bx + c = 0 está dada por:','x = abre paréntesis-b masmenos abre paréntesis b al cuadrado - 4ac cierra paréntesis elevado a un medio cierra paréntesis sobre 2a','x =  abre paréntesis b masmenos b al cuadrado - 4ac elevado a un medio cierra paréntesis sobre 2a','x = abre paréntesis b masmenos abre pparéntesis b al cuadrado - 2ac cierra paréntesis elevado a un medio ciarra paréntesis sobre 4a','x = abre paréntesis -b masmenos abre paréntesis b - 4ac cierra paréntesis elevado a un medio cierra paréntesis sobre 2a','1',''),
('12','La manecilla que marca las horas de un reloj mide 6 centímetros y la que marca los minutos 8 centímetros. ¿A qué distancia se encuentran los extremos de las manecillas cuando son las 3:00 horas?','10 centímetros','7 centímetros','14 centímetros','3 centímetros','1',''),
('13','3 x + a sobre 4 es igual a 9','6','12','24','48','1','Para la siguiente ecuación, ¿cuál es el valor que debe tener a para que x sea igual a 4?'),
('14','Hay 8 candelabros en una casa. Algunos tienen 4 brazos y otros tienen 3 brazos, en total hay 27 brazos. ¿Cuántos candelabros hay con 4 brazos?','5','3','4','6','1',''),
('15','En un lote de 500 focos, 17% son rojos y 8% son blancos. Al seleccionar 1 al azar, ¿cuál es la probabilidad de obtener un foco rojo o uno blanco?','0.08','0.09','0.17','0.25','1',''),
('16','Si en un mapa la distancia de 120 kilómetros está representada por 24 milímetros, ¿por cuántos milímetros quedará representada una distancia de 375 kilómetros? ','12.5','25.0','50.0','75.0','1',''),
('17','Enero...90 personas con alergía; Febrero...60; Marzo...40; Abril...80; Mayo...40 y Junio...20','53.16','55','56.66','57','1','La tabla muestra el número de individuos que padecieron de alergia al polen en un periodo de 6 meses. Determine el valor promedio de personas durante ese periodo.'),
('18','Ventas...255...Frecuencia...8; Ventas...265...Frecuencia...10; Ventas...275...Frecuencia...16; Ventas...285...Frecuencia...15 ;Ventas...295...Frecuencia...10','238.5','247.5','276.5','283.5','1','Según los datos, ¿cuál es el valor medio de las ventas de 59 empleados de una empresa?'),
('19','Un estudiante olvidó la calificación de una de sus materias, pero recuerda las calificaciones del resto: 9, 8, 10, 10. ¿Cuál es la calificación que le falta si su promedio global es de 9?','7','8','9','10','1',''),
('20','Considere que los lados de las monedas se representan con C y S.','E = {C C S; C S C; S C C}','E = {S S C; S C S; C S S}','E = {C C C; S S S}','E = {C C C; C C S; C S C; S C C; S S C; S C S; C S S; S S S}','1','¿Cuál es el conjunto de todos los posibles resultados distintos del experimento de arrojar simultáneamente tres monedas?'),
('21','Marca A...estudiantes...19; Marca B...estudiantes...8; Marca C...estudiantes...9; Marca D...estudiantes...4; Marca E...estudiantes...10','0.06','0.20','0.56','0.76','1','La tabla muestra los datos sobre la marca de automóvil adquirido por un grupo de estudiantes, ¿cuál es la probabilidad de que un alumno posea un auto de la marca A o C?'),
('22','En una competencia de tiro, Armando acertó 4 de cada 9 tiros, Benito 3 de 8, César 2 de 5 y Daniel 11 de 25 tiros. ¿Quién tiene el mejor promedio de aciertos?','Armando','Benito','César','Daniel','1',''),
('23','2 abre corchete 3 abre paréntesis A por B cierra paréntesis - 5 abre paréntesis A + B cierra paréntesis cierra corchete','325','575','350','650','1','Si A + B es igual a 25 y A por B es igual 150, ¿cuál será el resultado de la siguiente operación matemática?'),
('24','Un fabricante vende 2 tipos de telas, lisas y estampadas, enrolladas en tubos de cartón chicos, medianos y grandes. Si una persona selecciona una tela al azar, ¿cuál es la probabilidad de que escoja una tela lisa enrollada en un tubo mediano?','Dos tercios','Un medio','Un tercio','Un sexto','1',''),
('25','En una carrera, el corredor que llegó 3 lugares adelante del que llegó al último, llegó 2 lugares adelante del corredor que ocupó el séptimo lugar. ¿Cuántos corredores llegaron a la meta?','7','8','9','10','1',''),
('26','¿Cuál es el resultado de la operación  abre paréntesis x - 5 cierra paréntesis al cuadrado?','x al cuadrado - 10 x + 10','x al cuadrado - 10 x + 25','x al cuadrado + 10 x + 25','x a cuadrado - 10 x - 25','1',''),
('27','¿Cuáles son las coordenadas del punto R, donde la recta 3x - y - 9 = 0 interseca a la recta 2x + 3y + 5 = 0?','(-2 coma -15)','(2 coma 3)','(2 coma -3)','(-2 coma 15)','1',''),
('28','En una bolsa de canicas hay 1 blanca, 2 amarillas, 3 azules y 4 rojas. ¿Cuál es la probabilidad de sacar una canica color azul?','Un tercio','Un cuarto','Tres séptimos','Tres sobre diez','1',''),
('29','Jorge ganó en la lotería un premio y desea compartirlo con sus 2 hermanos: Un sexto parte al menor y un cuarto al mayor. ¿Con qué parte del premio se quedará Jorge?','Seis sobre doce','Siete sobre doce','Ocho sobre doce','Once sobre doce','1',''),
('30','10 elevado a menos cuatro sobre diez','0.000001','0.00001','0.0001','0.001','1','¿Cuál es la forma de escribir la expresión?'),
('31','abre doble paréntesis 2 + 6 cierra paréntesis; abre paréntesis 3 + 2 cierra doble paréntesis 2 +  abre paréntesis 2 + 6 abre paréntesis 3 + 2 cierra doble paréntesis elevado al cuadrado','144','2048','2624','3200','1','¿Cuál es el resultado de la operación?'),
('32','Carpintero - madera','Curtidor - cuero','Barrendero - basura','Vegetales - salud','Pudor - virginidad','2','Es una relación similar al siguiente ejemplo.'),
('33','Ruina - opulencia','Caparazón - cubierta','Desconcierto - desacuerdo','Suculento - desabrido','Aptitud - competencia','2','Seleccione el par de palabras cuya relación es similar a la existente entre los términos.'),
('34','Frío es a hielo como...','jugo a limón','lágrima a ojo','humedad a lluvia','desierto a sudor','2',''),
('35','Se dice que algunos cantantes son famosos y que todos los famosos aman ser fotografiados, por lo tanto, se puede concluir que:','todos los cantantes aman ser fotografiados','ningún cantante ama ser fotografiado','ninguno que ama ser fotografiado es cantante','algunos que aman ser fotografiados son cantantes','2',''),
('36','Ningún cuadro es redondo; Algunos dibujos son cuadros; Luego...','algunos dibujos no son redondos ','ningún dibujo es redondo ','ningún ser redondo es cuadro ','los cuadros no son dibujos redondos ','2',''),
('37','Si un animal tiene alas, entonces es ave.; Los murciélagos tienen alas.; Por lo tanto...','los animales tienen alas','las aves tienen alas','los murciélagos tienen alas','los murciélagos son aves','2',''),
('38','Todos los automóviles tienen ventanas.; Algunos medios de transporte son automóviles.; Por lo tanto...','todo lo que tiene ventanas es un medio de transporte','algunos automóviles son medios de transporte','algunos medios de transporte tienen ventanas','todos los medios de transporte cuentan con ventanas','2','¿Cuál es la conclusión del siguiente silogismo?'),
('39','Montaña es a elevación como:','llanura a planicie','volcán a erupción','meseta a superficie','cordillera a monte','2',''),
('40','"Los exploradores tuvieron que detener su marcha, la selva era inextricable". Esta frase significa que la selva...','no se puede describir','no se puede penetrar','es exuberante','es inagotable','2',''),
('41','Si en mi familia somos dos hermanas y un hermano, y si yo soy el varón, entonces, ¿qué parentesco tiene el hijo del abuelo paterno de mi hijo con mi hijo? ','Tío','Padre','Abuelo','Primo','2',''),
('42','1, 2, 9, 4, 25, 6, 49,...','4','7','8','12','2','¿Qué número continúa la siguiente sucesión numérica?'),
('43','¿Cuál de las siguientes expresiones modela la sucesión 2, 11, 26, 47,...?','2n al cuadrado + 1','3n al cuadrado - 1','3n al cubo - 1','4n al cuadrado - 2','2',''),
('44','Primo es a abuelo como... ','rosa a jazmín','olla a comida','padre a viejo','libro a sabio','2',''),
('45','Pericles es un perro entrenado por Alejandro, Misifús es un gato callejero. Esteban protege a los gatos y perros sin hogar. ¿Cuál de las siguientes alternativas es verdadera? ','Esteban entrenó a Pericles','Misifús vive con Alejandro','Misifús y Pericles viven con Esteban','Esteban no protege a Pericles','2',''),
('46','7a, 16d, 34g, espacio, 142m, espacio,...','70j - 286p','70i - 284p','70j - 286q','68j - 286p','2','Seleccione la opción que da continuidad a la serie.'),
('47','-100, 200, 100, 400, 500, 600','-100','100','500','600','2','¿Cuál número rompe con el patrón de la serie?'),
('48','Todos los patos son aves.; Todas las aves ponen huevos.; Por lo tanto, todos los...','patos son animales','animales que ponen huevos son patos','patos son vertebrados','patos ponen huevos','2','Conclusión que hace verdaderas a las siguientes premisas:'),
('49','Cama es a colcha como:','sillón a cojín','toalla a baño','mesa a mantel ','cortina a ventana','2',''),
('50','Esta es una pregunta de control. Elija la letra C.','A','B','C','D','2',''),
('51','0, 8, 2, 6,...','4, 10','4, 6','4, 4','10, 4','2','Seleccione la opción que da continuidad a la serie.'),
('52','Ojo - iris','Corazón - pulmón','Cuerpo - hombre','Vientre - bebé','Dedo - uña','2','Seleccione el par de palabras cuya relación es semejante a la propuesta en el par.'),
('53','Si estuviera en el grupo primero B llevaría el libro de Español 3. Si lleva el libro de Español 1, entonces...','cursa la clase de Español 1','no cursa la clase de Español 1','va en el grupo de primero B','no va en el grupo de primero B','2',''),
('54','1, 5, 11, 19,...','27','29','31','33','2','Seleccione el siguiente número de la secuencia.'),
('55','Luz es a foco, como...','hielo a paleta','calor a plancha','cocimiento a estufa','microondas a calentar','2',''),
('56','4, -1, 6, 1, 8, 3,...','5','7','10','12','2','Determine el noveno elemento de la siguiente serie:'),
('57','Cine es a cinéfilo como:','timbre a sello postal','mensaje a telegrama','novela a escritor','estampilla a filatelista','2',''),
('58','La siguiente es una palabra compuesta:','sacapuntas','extraer','afonía','circunvalar','3',''),
('59','Escoja la opción que está redactada en tiempo copretérito.','Porque ellas no pueden o no quieren aprender a elevar su vuelo','El águila buscó un lugar dónde guarecerse hasta el día siguiente','No me volveré a juntar nunca más con aves que no sepan volar','Había visto volar alto a otras aves, lo que le llenaba de esperanzas','3',''),
('60','Son ejemplos de sustantivos colectivos, excepto:','parvada','bosque','elenco','verdad','3',''),
('61','El invierno llega a la ciudad y todos sus habitantes se alegran de ello.','Invierno, ciudad, habitantes','Invierno, todos, se','Llega, se, de','Ciudad, todos, habitantes','3','Seleccione la opción que contiene solo sustantivos.'),
('62','Elija la oración cuyo adjetivo tiene grado comparativo. ','Juan es más alegre que Antonio','Juan es alegre','Juan es muy alegre','Juan es el más alegre de la familia','3',''),
('63','"que yo fui el arquitecto de mi propio destino".','Separar palabras, frases u oraciones','Señalar citas textuales','Indicar pausas menores','Suplir la omisión del verbo','3','¿Cuál es el uso de las comillas en la frase de Amado Nervo?'),
('64','En los siguientes enunciados se emplean correctamente las preposiciones, excepto:','Voy en casa de mis padres','Tiene afición por las matemáticas','Estas pastillas son contra el mareo','Me caso en México para el 30 de diciembre','3',''),
('65','¿Cuál de las siguientes oraciones presenta acentuación correcta?','Esta escuela ha conseguido mejorar el nível académico de sus alumnos','La población esta asustada por el riesgo de una epidemia','Mí ausencia sé debió a una gripe muy fuerte','Se debe reprogramar el calendario de exámenes porque está mal planeado','3',''),
('66','Elija la oración que está escrita correctamente.','Sé que quieres convertirte en pintor; mas para lograrlo se necesita algo más que tener ganas.','Se que quieres convertirte en pintor; más para lograrlo se necesita algo más que tener ganas.','Sé que quieres convertirte en pintor; más para lograrlo se necesita algo mas que tener ganas.','Sé que quieres convertirte en pintor; mas para lograrlo sé necesita algo más que tener ganas.','3',''),
('67','1. Vitalidad;2. Nocivo;3. Bienestar;4. Sensible;5. Bicolor','1, 2 ','2, 5','2, 3','3, 4','3','Elija el par de palabras que se escriben con v.'),
('68','La letra s se utiliza correctamente en las siguientes frases, excepto:','Admiro la esplendorosa tarde','El dentista es libanés','No meresco tu amor','Tu relato es novelesco','3',''),
('69','Es un antónimo de lánguido.','Dañado','Licencioso','Complaciente','Vigoroso','3',''),
('70','Tipo de acento...1. Prosódico; 2. Ortográfico; 3.Diacrítico...Descripción...a.Se emplea para diferenciar dos o más palabras que se pronuncien igual, pero cuyo significado es diferente; b. Cuando enfatizamos una sílaba pero no la marcamos con la tilde; c. Cuando además de enfatizar sobre una sílaba al pronunciar la palabra, se marca con una tilde','1a, 2c, 3b','1b, 2a, 3c ','1c, 2b, 3a','1b, 2c, 3a','3','Relacione el tipo de acento con su descripción correspondiente.'),
('71','Los romanos invadieron la Península Ibérica en el siglo 3 a. C.; los árabes, a principios del siglo VIII de nuestra era.','Sustituir un verbo','Hacer una pausa','Separar oraciones ','Separar el sujeto del predicado','3','¿Cuál es la función de la coma en la oración siguiente?'),
('72','Seleccione el par de palabras formado por sinónimos.','Decrecer - incrementar','Activo - pasivo','Omiso - diligente','Remate - término','3',''),
('73','Los sinónimos son palabras que tienen igual significado o que, aunque no compartan el significado en forma exacta, su reemplazo dentro de la oración no ocasiona modificaciones en el significado completo de la misma.','Análogo','Diferente','Desigual','Aparente','3','Elija la opción que sustituya la palabra “igual” en el párrafo siguiente y conserva su sentido.'),
('74','La gráfica muestra un patrón flotante en la economía del país.','Estable','Invariable','Oscilante','Constante','3','De acuerdo con la oración, es el sinónimo de la palabra “flotante”.'),
('75','El antónimo de “numeroso” es:','único','enorme','grande','abundante','3',''),
('76','Lo que me contaste es inverosímil.','Insuperable','Fascinante','Creíble','Perturbador','3','De acuerdo con la oración, elija la palabra que significa lo opuesto a “inverosímil”.'),
('77','El doctor no ;espacio; en llamar a las autoridades en cuanto descubrió el ;espacio; nuevo.','vaciló - vacilo','baciló - vacilo','baciló - bacilo','vaciló - bacilo','3','Complete el texto.'),
('78','¿Qué opción tiene palabras homónimas?','El arroyo subió de nivel con la última lluvia – Luis arrolló un gato con su bicicleta ayer','El compromiso adquirido es inevitable – El pacto con mi hermano se cumplió','El corte del cabello cuesta 30 pesos – La corte del rey tuvo vacaciones esta semana','El papá de mi amiga es médico – El Papa vendrá a México el próximo mes','3',''),
('79','No me gusta la clase de matemáticas, ;espacio; tengo que asistir para poder aprobar el curso.','incluso','por lo tanto','por lo cual','sin embargo','3','Complete el texto.'),
('80','Finalmente, entonces y en suma son enlaces que se utilizan en los párrafos...','introductorios','conclusivos','ilativos','explicativos','3',''),
('81','1. U otro signo que aparezca en el cuerpo;2. La característica esencial de la hipocondría;3. Una enfermedad grave;4. Es la preocupación y el miedo a padecer;5. A partir de alguna sensación corporal','2, 4, 3, 5, 1','2, 3, 4, 1, 5','5, 1, 2, 4, 3','2, 5, 3, 1, 4','3','Ordene las oraciones para formar un párrafo coherente.'),
('82','En un estudio reciente se demostró que los hombres resultaron ser más propensos a enamorarse de sus amigas.','Atraídos','Expuestos','Vulnerables','Indiferentes','3','De acuerdo con el contexto, ¿cuál es el antónimo de la palabra “propensos”?'),
('83','¿Cuál verbo está conjugado en primera persona del tiempo pasado, modo indicativo?','Bendigo','Diste','Veo','Fui','3',''),
('84','¿Cuál verbo está conjugado en tercera persona del singular, modo indicativo?','Extraje','Fue','Puse','Planté','3',''),
('85','Las efemérides tomaron un giro radical, abriendo el horizonte a nuevas consecuencias, y su contenido es solo simbólico.','Confuso','Gráfico','Real','Alegórico','3','¿Cuál es el antónimo de la palabra “simbólico” en la siguiente oración?'),
('86','La vajilla se vino al suelo con estrépito.','Estruendo','Lentitud','Silencio','Precipitación','3','Es el antónimo de la palabra “estrépito” en la siguiente oración.'),
('87','La economía andará mal en nuestro país, ;espacio; todos necesitarán esforzarse para salir adelante.','si bien','pero','aunque','por lo que','3','Complete el texto.'),
('88','Los fósiles generalmente se encuentran en rocas sedimentarias, como calizas, conglomerados y areniscas, que se acumularon en primitivos mares, lagos, deltas o marismas. Son más abundantes en rocas sedimentarias de mares relativamente poco profundos y son escasos o faltan en las de origen continental. R.M. Black. Elementos de paleontología','Glaciares y icebergs','Cimas de montañas','Mares poco profundos','Sabanas africanas','4','De acuerdo con el texto, ¿en dónde existe mayor acumulación de fósiles?'),
('89','La Wii, contra el Parkinson; Son relativamente baratos y accesibles, pero sirven mucho más que para jugar. Los fisioterapeutas ocupacionales empiezan a descubrir los beneficios de los videojuegos en la lucha contra enfermedades como el Parkinson, la esclerosis múltiple o la parálisis cerebral.
   Las terapias de rehabilitación tradicionales son aburridas, dolorosas y repetitivas, mientras que las nuevas opciones de videojuegos disponibles en el mercado plantean una solución para ejercitarse en un ambiente divertido, competitivo y que motiva a los enfermos a seguir jugando. No estamos hablando de obligación, sino de entretenimiento.
','las enfermedades relacionadas con el sistema nervioso disminuyen con el uso del Wii','es un deber tener un Wii para los pacientes en rehabilitación','hay una gran variedad de Wii para los centros de rehabilitación','los Wii sustituyen de una forma amena y eficiente a las terapias normales','4','El autor del texto sostiene que:'),
('90','Las unidades de negocios de bienes y servicios serán más automatizadas y requerirán trabajadores calificados. En las próximas décadas se llevará a cabo un desplazamiento paulatino de la mano de obra no calificada, motivo por el cual las instituciones de enseñanza superior ocuparán un lugar estratégico en la calificación de la fuerza de trabajo; será necesario dar paso a un sistema nacional de certificación de competencias, se vinculará la educación a la internacionalización.
I. M. Sotomayor. Las nuevas tecnologías de información en las organizaciones mexicanas
','Será desplazada paulatinamente','Se certificará en competencias','Se calificará la fuerza de trabajo','Será vinculada a la internacionalización','4','Con base en el texto, ¿qué sucederá, en las organizaciones, con la mano de obra no calificada?'),
('91','No dudo que las hipótesis que aventuro en este escrito puedan generar resquemor y molestia. Pienso, incluso, que también habrá quien las juzgue equivocadas. Sin embargo, la aventura de emitir ideas propias y confrontarlas con el ocasional lector bien vale la pena. Mis hipótesis son las siguientes. Primera, hasta la descripción del SIDA la idea de confrontar nuevas epidemias era un absurdo. Creo que ni los médicos más avezados en el campo de la epidemiología concebían la posibilidad de que nuevos agentes infecciosos diezmaran, en medio de la abundancia tecnológica y científica, la salud de la población. Segunda hipótesis, la pandemia del sida ha resultado ser mucho más compleja que las epidemias previas por el inmenso enlistado de connotaciones morales y sociales que se agolpan detrás del término sida. Por ende los matices sociales que se adquieren por un padecimiento son muy diferentes a los del otro. En este contexto, no importa morir, lo que importa es cómo y de qué se muere. Como si existiesen enfermedades aceptadas y patologías demoniacas. Parafraseando la mente silenciosa de las mayorías, peor fallecer de sida que por cólera.  La síntesis de la primera hipótesis es que:
','la medicina siempre ha estado atenta a descubrir nuevas enfermedades','a pesar de los avances tecnológicos el conocimiento médico no es sólido','los avances tecnológicos pueden ayudar a encontrar la cura para el sida','la descripción del síndrome de inmunodeficiencia adquirida es un absurdo','4','Escuche el siguiente texto y responda.'),
('92','En el texto se plantean...','ideas totalmente científicas sobre las causas del sida','conceptos básicos sobre las consecuencias del sida','ideas tentativas sobre las actitudes sociales frente al sida','los pocos conocimientos de los médicos para curar el sida ','4','Escuche el texto nuevamente'),
('93','Los enamorados muestran una empatía extrema hacia el amado y muchos están dispuestos a morir por este individuo "especial". Una característica central del amor romántico es...','pensar de vez en cuando en el ser amado','sustituir al ser amado por otro rápidamente','pensar de manera obsesiva en el ser amado','olvidar muy fácilmente al ser amado','4','Elija el enunciado que completa de manera lógica el párrafo.'),
('94','El enunciado "La adversidad intensifica la pasión amorosa" significa que la pasión amorosa...','se pone a prueba con los problemas','concluye cuando hay obstáculos','se acrecienta con la desgracia','a veces triunfa sobre los problemas','4',''),
('95','Pedro Cavadas. El "mago" de los trasplantes

Hace unas semanas, coincidiendo con el 20° aniversario de la Organización Nacional de Trasplantes, me preguntaban que cuáles eran las diferencias entre los trasplantes de los ochenta y los de ahora. Evidentemente, son bastantes, pero me pareció que el aspecto más destacado es que habían dejado de ser actos heroicos para pasar a ser una actividad casi industrial. Con ello quería recalcar que ya no se trata de hacer el gran trasplante. La cuestión ahora es cuántos cientos o miles de trasplantes se hacen cada año o cuánto va a tardar cada enfermo en recibirlo.

Rafael Matesanz. http://www.elpais.com/especial/protagonistas/2009/pedro-cavadas.html
','apoya la idea de hacer muchos trasplantes cada año','plantea que el dominio de la técnica ha vuelto cotidianos los trasplantes','cree que ya no hay trasplantes únicos sino miles de ellos','piensa que el tiempo que se requiere para conseguir un trasplante es muy largo','4','De acuerdo con el texto, el autor...'),
('96','Gracias a recientes mediciones obtenidas mediante satélites se ha podido determinar que el Monte Everest no es en realidad el más alto. Medido desde el centro de la Tierra, el Monte Chimborazo del Ecuador lo supera por 2,153 metros, debido a la combadura de la Tierra en el Ecuador. Empero, medidos desde el nivel del mar, el Everest sí es el más alto.

Conozca más
','La superficie convexa de la Tierra da mayor altitud al Monte Chimborazo','La superficie irregular de la Tierra hace semejantes las alturas de las montañas','Las mediciones realizadas por satélites han permitido observar la diferencia de tamaño entre montes','El Monte Everest se encuentra en el Ecuador y es el más alto del mundo','4','A partir de la lectura del siguiente texto, elija la afirmación correcta.'),
('97','Mientras el destacado investigador Mario Molina trabajó en México su labor no fue muy reconocida. Cuando se trasladó a Estados Unidos a continuar su preparación académica y desarrollar ahí su labor de investigación ganó el Premio Nobel.','La suerte de la fea la bonita la desea','Nadie es profeta en su tierra','Sobre advertencia no hay engaño','Dios aprieta pero no ahorca','4','Seleccione el refrán que se aplica a la siguiente situación.'),
('98','Igualitaristas contra especistas

[1] El debate sobre los límites de la experimentación con animales se plantea en términos filosóficos y éticos1. La clave está en definir el criterio para que un ser vivo pueda tener derechos2, es decir si la protección de estos incluye a todas las criaturas o solo a las racionales.
[2] Tom Regan, filósofo de la Universidad de Carolina del Norte, considera que todos los seres vivos tienen derechos inherentes3 y que no podemos darles un valor inferior simplemente por no ser racionales. En la misma línea el psicólogo británico Richard Ryder critica el especismo o la discriminación que practica el ser humano contra otras especies.
[3] El neurocientífico Stuart Zola, director del Yerkes National Primate Research Center, defiende el uso de los primates en todo tipo de estudios pues, "por más que lo pretendamos, los chimpancés no son humanos". Lo apoya, entre otros, Carl Cohen, de la Universidad de Michigan4, quien se manifiesta partidario de hacer distinciones entre especies.

Miguel Ángel Sabadell. Esclavos de la ciencia
; ¿Cuál es la idea central del tercer párrafo?','Estados Unidos cuenta con valiosos científicos como Stuart Zola director del Yerkes National Primate Research Center','Un científico norteamericano apoya el empleo de chimpancés en estudios de todo tipo porque no los considera humanos','Para determinar los límites de la experimentación con animales debe considerarse la ética y la filosofía','Regan piensa que todos los seres vivos tienen derechos inherentes y que no valen menos por no ser racionales','4','Escuche el texto y responda las preguntas.'),
('99','¿Cuál es la idea central del texto?','La experimentación con ciertas especies animales debe prohibirse porque atenta contra su derecho a la protección','En Estados Unidos se han hecho importantes descubrimientos científicos sobre el comportamiento de los primates','Algunos investigadores consideran que todos los seres vivos tienen derecho a la protección, otros, los discriminan','El derecho a ser protegido es inherente solo a los seres humanos, no es extensivo a las especies animales','4','Igualitaristas contra especistas

[1] El debate sobre los límites de la experimentación con animales se plantea en términos filosóficos y éticos1. La clave está en definir el criterio para que un ser vivo pueda tener derechos2, es decir si la protección de estos incluye a todas las criaturas o solo a las racionales.
[2] Tom Regan, filósofo de la Universidad de Carolina del Norte, considera que todos los seres vivos tienen derechos inherentes3 y que no podemos darles un valor inferior simplemente por no ser racionales. En la misma línea el psicólogo británico Richard Ryder critica el especismo o la discriminación que practica el ser humano contra otras especies.
[3] El neurocientífico Stuart Zola, director del Yerkes National Primate Research Center, defiende el uso de los primates en todo tipo de estudios pues, "por más que lo pretendamos, los chimpancés no son humanos". Lo apoya, entre otros, Carl Cohen, de la Universidad de Michigan4, quien se manifiesta partidario de hacer distinciones entre especies.
'),
('100','Uno de los hijos de Juanita andaba con un amigo, Pepe, quien tenía fama de mentiroso y de tomar cosas ajenas. Un día que Pepe fue a jugar a casa de Juanita, esta descubrió que le faltaba dinero; al preguntar quién lo había tomado, Pepe acusó al hijo de Juanita, pero al esculcar a Pepe se dio cuenta de que él tenía el dinero.','Ladrón que roba a ladrón tiene cien años de perdón ','Después del niño ahogado quieren tapar el pozo ','Cuando el río suena es que agua lleva','En la tierra de ciegos el tuerto es rey ','4','Seleccione el refrán que se aplica a la siguiente situación.'),
('101','Dice Mario Benedetti que la política es la historia que se está haciendo. Es decir, una historia de ida y vuelta, pero siempre en movimiento, nunca estática.
Ignacio Solares. Ebrard en la encrucijada
','política se escapa de la historia','historia está siempre en movimiento','historia describe los actos políticos','política es dinámica e histórica','4','La idea central del fragmento es que la...'),
('102','¿Cuál oración es una opinión?','Me parece que José no está preparado para la presión','Mi esposa Leonor daba clases en una preparatoria','Leí que los doctores recetan aspirina para evitar infartos','El 90% del chocolate producido en el mundo es mexicano','4',''),
('103','La principal diferencia entre los agentes especiales y la división uniformada comienza con el nivel educativo. Para ingresar al servicio secreto como agente especial se requiere el grado de licenciatura, tres años de experiencia laboral en investigaciones criminales y aprobar un examen de procuración de justicia. Para ingresar al servicio de la división uniformada, cuyo papel principal es el de protección, se requiere solo el certificado de preparatoria, aprobar un examen escrito, una entrevista y someterse a la prueba del polígrafo.
J. O´Leary. Los principios del centurión
','la prueba del polígrafo','el grado de licenciatura','aprobar una entrevista','el certificado de preparatoria','4','Con base en el texto, uno de los requisitos para ingresar al servicio secreto es...'),
('104','Un estudio hecho con monos demostró la acción perniciosa del ruido sobre la salud mental. El ruido más dañino, durante periodos prolongados, es el difuso de más de 80 decibeles, como el de las grandes ciudades.
La Jornada
','La privación del ruido garantiza la salud mental','En las grandes ciudades todos los habitantes son ruidosos','El ruido difuso es menos dañino que el de fuente directa','La exposición prolongada al ruido eleva las patologías mentales','4','A partir de la lectura del siguiente texto, elija la conclusión.'),
('105','¿Qué oración expresa una opinión?','La escenografía está compuesta por diversos materiales de decoración','El diálogo involucra a dos o más personas que conversan en una escena','La presentación teatral de un monólogo impacta más que la de un diálogo','Las obras dramáticas se clasifican en dos subgéneros: tragedia y comedia','4',''),
('106','El estrés es una reacción individual. Un suceso, como hablar ante un gran público, puede provocar un estrés positivo en una persona y un estrés negativo en otra.
   El estrés puede ser fantástico o puede ser fatal. Usted lo decide. Puede aprender tanto a respetar los peligros del estrés, como a aprovechar sus beneficios.
','De la elección personal depende su impacto','Es tan peligroso que hay que conocer sus límites','Se produce siempre que alguien habla en público','iene su base en factores emocionales y psicológicos','4','¿Cuál es el punto de vista que tiene el autor respecto al estrés?'),
('107','En su libro Historia de la gastronomía española, Martínez Llopis se queja de "los prejuicios y hasta la hostilidad con que los extranjeros consideraban la cocina española, que en la mayor parte de los casos desconocían, pues todas sus experiencias gastronómicas en nuestra tierra las habían realizado mal comiendo los guisotes pergeñados en las fondas o en las ventas que hallaban al margen de su camino". El reproche es especialmente justificado en el caso de algunos ilustres escritores franceses que nos visitaron a mediados del siglo XIX, el "complejo de superioridad" que se advierte en las narraciones que dejaron de estas visitas resulta francamente irritante y, a veces, también divertido.','Los extranjeros tienen prejuicios contra España y lo escriben en sus narraciones','Se desprecia a la comida española porque, en realidad, se le desconoce ','Resulta irritante que los extranjeros escriban sobre sus viajes a España','Los españoles que son dueños de las fondas y las ventas no cocinan bien','4','¿Cuál es la opinión expresada en el siguiente texto?'),
('108','Los siguientes párrafos utilizan un vocabulario técnico, excepto:','El hidrógeno es el elemento más abundante del universo. Representa, en peso, 92% de la materia conocida; del resto, 7% es de He y solamente queda 1% para los demás elementos. En nuestro planeta es el décimo elemento más abundante en la corteza terrestre y lo encontramos combinado en forma de agua','Se dice que la primera inspiración del hombre por crear un abecedario que permitiera perpetuar su pensamiento fueron las huellas que dejaban las aves en la arena húmeda. Hoy en día esta teoría no ha sido comprobada; sin embargo, existe una poderosa sospecha de que es cierta','Los antibióticos son sustancias medicinales seguras que tienen el poder para destruir o detener el crecimiento de organismos infecciosos en el cuerpo. El término antibiótico fue propuesto por Selman A. Waksman, descubridor de la estreptomicina, para definir sustancias dotadas de actividad antimicrobiana extraídas de estructuras orgánicas vivientes','La termodinámica se desarrolla a partir de cuatro principios: el principio cero, que permite definir la temperatura como propiedad; el primer principio, que define el concepto de energía como magnitud conservativa; el segundo principio, define la entropía como magnitud no conservativa, una medida de dirección de los procesos; y finalmente el tercer principio, que postula algunas propiedades en el cero absoluto de temperatura','4',''),
('109','Elija el texto cuya función es apelativa. ','¡Estoy feliz! ¡Por fin logré lo que durante tanto tiempo había soñado; mi corazón salta de alegría!','Utilice diariamente la nueva pasta de dientes con bicarbonato y sus dientes brillarán como porcelana','Observé mis ojos, como una laguna sobre la que se postra la Luna, y dentro de mí, su radiante luz se mecía como cuna','El tiburón blanco tiene dientes triangulares y afilados como cuchillas, dispuestos en varias filas levemente inclinadas','4',''),
('110','¿Cuál de las siguientes afirmaciones puede considerarse como un hecho?','Nadie sabe lo que tiene hasta que lo ve perdido','En boca cerrada no entran moscas','Todo cabe en un jarrito sabiéndolo acomodar','No hay mal que por bien no venga','4',''),
('111','Depresión posparto
Las mujeres deben estar alertas de cambios mentales que pueden ocurrir durante el embarazo y después del parto. La Academia Americana del Médico Familiar reporta que los síntomas de lo que más comúnmente se conoce como baby blues pueden comenzar de tres a cuatro días después del parto, y esto incluye cambios de temperamento, llanto repentino y problemas de concentración. Estos síntomas desaparecen por lo regular diez días después del parto. Pero si se prolongan o se intensifican, se le llama depresión posparto y puede requerirse ayuda médica. El Instituto Nacional de la Salud Mental (NIMH, por sus siglas en inglés) menciona que los estudios sugieren que las mujeres que experimentan mayor depresión después del parto con frecuencia tuvieron anteriormente episodios depresivos, aun cuando quizá no hayan sido diagnosticados y tratados.
http://www.cedehc.org/home.php?action=alumnos&page=detalleArticulo&id=43&sec=AA
','Descriptivo','Narrativo','Argumentativo','Expositivo','4','¿De qué tipo de texto se trata?'),
('112','Es un texto persuasivo en el que se destaca su función apelativa.','Noticia','Cuento','Anuncio','Crónica','4','');







