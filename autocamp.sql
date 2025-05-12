
CREATE DATABASE autocamp;

USE autocamp;

CREATE TABLE cliente (
    codcli integer NOT NULL,
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
    PRIMARY KEY (codgama)
);
CREATE TABLE coche (
    matricula character(7) NOT NULL,
    modelo character varying(40),
    combustible character(1),
    motor character(1),
    plazas integer,
    maletas integer,
    foto character varying(15),
    codgama character(2) NOT NULL,
    PRIMARY KEY (matricula)
);

CREATE TABLE reserva (
    codreserva integer NOT NULL,
    fecha_res date NOT NULL,
    f_inicio date,
    f_fin date,
    dias integer,
    lugar character varying(50),
    codgama character varying(2) NOT NULL,
    codcliente int NOT NULL,
    importe float DEFAULT 0,
    coche character(7),
    f_recogida date,
    f_devolucion date,
    s_motor character(1),
    s_plazas integer,
    PRIMARY KEY (codreserva)
);

alter table coche add foreign key (codgama) references gama (codgama);
alter table reserva add foreign key (codgama) references gama (codgama);
alter table reserva add foreign key (codcliente) references cliente (codcli);

INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES (1, 'Pepe', 'García', 'Ausiach March, 23', 'pep@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES (2, 'Lucas', 'Iniesta', 'Ausiach March, 23', 'lui@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES (3, 'Ana', 'Lorca Sanz', 'Ausiach March, 23', 'annta@gmailx.com');

INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('L1', 'Lujo', 2, 23.00);
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('F2', 'Familiar', 3, 23.00);
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('T1', '4 x 4', 1, 23.00);
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('F1', 'Familiar', 4, 15.00);


INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('1111AAA', 'Volvo z', 'F', 'A', 5, 3, 'foto1.jpg', 'F1');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('1112AAA', 'Volvo EX40', 'E', 'A', 5, 3, 'foto2.jpg', 'F1');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('1001BBB', 'Ford Focus', 'H', 'A', 5, 3, 'foto4.jpg', 'F1');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('1003TTT', 'Citroen e-c3', 'E', 'A', 7, 4, 'foto5.jpg', 'T1');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('3003LLL', 'Mercedes', 'E', 'A', 7, 4, 'foto6.jpg', 'L1');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('3333BBB', 'Volvo XC90', 'E', 'A', 7, 4, 'foto7.jpg', 'L1');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('4444NNN', 'Volvo XC1', 'H', 'A', 5, 4, 'foto10.jpg', 'F1');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('1113AAA', 'Audi A3', 'H', 'M', 5, 4, 'foto3.jpg', 'F2');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('6666NNN', 'Fiesta', 'F', 'M', 5, 3, 'foto8.jpg', 'F2');
INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama) VALUES ('6612NNN', 'Audi A3', 'F', 'M', 5, 3, 'foto9.jpg', 'F2');

INSERT INTO reserva (codreserva,fecha_res,f_inicio,f_fin,dias,lugar,codgama,codcliente,importe,coche,f_recogida,f_devolucion,s_motor,s_plazas) VALUES
(1,'15/05/2025','20/05/2025',datediff(days,f_inicio,f_fin),'Oficina 1','L1',1,(select gama.precio from gama where gama.codgama = reserva.codgama),
'3333BBB','15/05/2025','21/05/2025',(select coche.motor from coche where coche.matricula = reserva.coche),(select coche.plazas from coche where coche.matricula = reserva.coche));



