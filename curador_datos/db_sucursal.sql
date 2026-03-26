show databases;

show tables;

create database sucursal;
use sucursal;

create table equipos(
id_equipo int(10) PRIMARY KEY,
modelo varchar(50) NOT NULL ,
marca varchar(50) NOT NULL,
descripcion varchar(100) NOT NULL
)

create table usuarios(
id_usuario int(10) PRIMARY KEY ,
nombre varchar(50) NOT NULL, 
apellido varchar(50) NOT NULL, 
telefono varchar(10) NOT NULL
)

create table problemas (
id_problema int(10) PRIMARY KEY ,
id_equipo int(10) NOT NULL ,
id_usuario int(10) NOT NULL ,
tecnico varchar(50),
descripcion varchar(100),
FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
)

SELECT user, host FROM mysql.user; /* revisar los usuarios de la db, host = remoto o local */



GRANT all privileges on sucursal.* to 'admin_sucursal'@'localhost'

describe usuarios;

-- valores de tabla usuario --

INSERT INTO usuarios (id_usuario, nombre, apellido, telefono) VALUES 
(1, 'Brenda', 'Galvez', '5512345678'),
(2, 'Guillermo', 'Sánchez', '5587654321'),
(3, 'Juan', 'Rodríguez', '5590123456');

DROP USER 'admin_sucursal'@'localhost'; /* borrado de usuario mysql.user*/

SELECT * FROM usuarios;

CREATE user 'brenda'@'localhost' identified by 'brenda';
GRANT all privileges on sucursal.* to 'brenda'@'localhost';

CREATE USER 'guillermo'@'localhost' IDENTIFIED by 'guillermo';
GRANT SELECT, UPDATE, INSERT on sucursal.equipos to 'guillermo'@'localhost';

CREATE USER 'juan'@'localhost' IDENTIFIED by 'juan';
GRANT ALL PRIVILEGES on sucusal.equipos to 'juan'@'localhost';

SHOW GRANTS FOR 'juan'@'localhost'; -- revisar los privilegios que tiene el usuario--

-- Quita todos los permisos sobre la base de datos y la tabla
REVOKE SELECT, INSERT, UPDATE ON sucursal.equipos FROM 'guillermo'@'localhost';

GRANT ALL PRIVILEGES on sucusal.* to 'juan'@'localhost';



