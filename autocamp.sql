
CREATE DATABASE autocamp;

USE autocamp;

CREATE TABLE cliente (
    codcli CHARACTER(4) NOT NULL,
    nombre character varying(20),
    apellido character varying(40),
    direccion character varying(50),
    mail character varying(100),
    PRIMARY KEY (codcli)
);

CREATE TABLE gama (
    codgama character(2) NOT NULL,
    nomgama character varying(20),
    stock integer,
    precio float,
    combustible character(1),
    transmision CHARACTER(1),
    plazas integer,
    maletas integer,
    PRIMARY KEY (codgama)
);
CREATE TABLE coche (
    matricula character(7) NOT NULL,
    modelo character varying(40),
    foto character varying(15),
    codgama character(2) NOT NULL,
    PRIMARY KEY (matricula)
);

CREATE TABLE reserva (
    codreserva integer NOT NULL,
    fecha_res date NOT NULL,
    f_inicio date,
    f_fin date,
    dias int,
    importe float DEFAULT 0,
    gama character varying(2) NOT NULL,
    codcliente character(4) NOT NULL,
    f_devolucion date,
    PRIMARY KEY (codreserva)
);

alter table coche add foreign key (codgama) references gama (codgama);
alter table reserva add foreign key (gama) references gama (codgama);
alter table reserva add foreign key (codcliente) references cliente (codcli);

INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES (lpad('1',4,'0'), 'Pepe', 'García', 'Ausiach March, 23', 'pep@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES (lpad('2',4,'0'), 'Lucas', 'Iniesta', 'Ausiach March, 23', 'lui@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES (lpad('3',4,'0'), 'Ana', 'Lorca Sanz', 'Ausiach March, 23', 'annta@gmailx.com');

INSERT INTO gama (codgama, nomgama, stock, precio, combustible, transmision, plazas, maletas) VALUES ('L1', 'Lujo', 2, 23.00,'E','A',7,4);
INSERT INTO gama (codgama, nomgama, stock, precio, combustible, transmision, plazas, maletas) VALUES ('T1', '4 x 4', 1, 23.00,'E','A',7,4);
INSERT INTO gama (codgama, nomgama, stock, precio, combustible, transmision, plazas, maletas) VALUES ('F1', 'Familiar Electrico', 4, 15.00,'E','A',5,4);
INSERT INTO gama (codgama, nomgama, stock, precio, combustible, transmision, plazas, maletas) VALUES ('F2', 'Familiar Gasolina', 3, 23.00,'F','M',5,4);
INSERT INTO gama (codgama, nomgama, stock, precio. combustible, transmision, plazas, maletas) VALUES ('F3', 'Familiar Hibrido', 3, 20.00,'H','A',5,4);


INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1111AAA', 'Volvo z', 'foto1.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1112AAA', 'Volvo EX40', 'foto2.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1001BBB', 'Ford Focus', 'foto3.jpg', 'F3');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1003TTT', 'Citroen e-c3', 'foto4.jpg', 'T1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('3003LLL', 'Mercedes', 'E', 'foto5.jpg', 'L1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('3333BBB', 'Volvo XC90', 'E', 'foto6.jpg', 'L1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('4444NNN', 'Volvo XC1', 'foto7.jpg', 'F3');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1113AAA', 'Audi A3', 'foto8.jpg', 'F3');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('6666NNN', 'Fiesta', 'foto9.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('6612NNN', 'Audi A4', 'foto10.jpg', 'F2');

INSERT INTO reserva (codreserva,gama,fecha_res,f_inicio,f_fin,dias,importe,codcliente,f_devolucion) VALUES
(1,'F1','2025/05/15','2025/05/15','2025/05/20',(datediff(f_fin,f_inicio)),((select gama.precio from gama where gama.codgama = reserva.codgama)*reserva.dias),
(lpad('1',4,'0')),'2025/05/20');



