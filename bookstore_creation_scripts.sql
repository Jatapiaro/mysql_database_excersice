CREATE TABLE salas
(
	id INT unsigned NOT NULL auto_increment,
	nombre VARCHAR(240) NOT NULL,
	metros FLOAT(6, 2) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO salas
(nombre, metros)
VALUES 
('A', 100.0), 
('B', 100.0),
('C', 200.0);

CREATE TABLE secciones
(
	id INT unsigned NOT NULL auto_increment,
	sala_id INT unsigned NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (sala_id) REFERENCES salas(id) ON DELETE CASCADE
);

/*
* (ID, Sala)
* (1, A)
* (2, B)
* (3, C)
*/
INSERT INTO secciones 
(sala_id)
VALUES 
(1), (1), (1),
(2), (2), (2),
(3), (3), (3);


CREATE TABLE libros 
( 
	id INT unsigned NOT NULL auto_increment,
	fecha DATE NOT NULL,
	titulo VARCHAR(240) NOT NULL,
	numero_paginas INT NOT NULL,
	seccion_id INT unsigned,
	PRIMARY KEY (id),
	FOREIGN KEY (seccion_id) REFERENCES secciones(id) ON DELETE SET NULL
);

INSERT INTO libros
(fecha, titulo, numero_paginas, seccion_id)
VALUES
('2001-06-15', 'Bajo La Misma Estrella', 304, 1),
('2005-01-04', 'Bajo La Misma Estrella II', 304, 2),
('2003-04-22', 'El Jilguero', 1152, 3),
('2012-08-20', 'Ciudades De Papel', 368, 3),
('1995-01-02', 'Nos Vemos Allá Arriba', 448, 4),
('1996-02-03', 'Las Gafas De La Felicidad', 320, 5),
('1997-03-04', 'Los Cuerpos Extraños', 352, 6),
('1998-04-05', 'Divergente', 464, 7),
('1999-05-06', 'La Ladrona De Libros', 544, 7),
('2000-06-07', 'Fundamentos de bases de datos', 944, 9),
('2001-06-08', 'Desarrollo de Bases de Datos: casos prácticos desde el análisis a la implementación', 494, 9);

CREATE TABLE autores
(
	id INT unsigned NOT NULL auto_increment,
	nombre VARCHAR(500) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO autores
(nombre)
VALUES
('John Green'), ('Donna Tartt'),
('Pierre Lemaitre'),('Rafael Santandreu'),
('Lorenzo Silva'),('Veronica Roth'),
('Markus Zusak'),('Silberschatz Abraham'),
('Korth Henry'),('Sudarshan S.'),
('Ana Maria Iglesias Maqueda'),
('Paloma Martinez Fernandez');

CREATE TABLE libro_autor
(
	libro_id INT unsigned NOT NULL,
	autor_id INT unsigned NOT NULL,
	FOREIGN KEY (libro_id) REFERENCES libros(id) ON DELETE CASCADE,
	FOREIGN KEY (autor_id) REFERENCES autores(id) ON DELETE CASCADE
);

INSERT INTO libro_autor
VALUES 
(1, 1), (2, 1), (3, 2), (4, 1),
(5, 3), (6, 4), (7, 5), (8, 6),
(9, 7), (10, 8), (10, 9), (10, 10),
(11, 11), (11, 12);