CREATE DATABASE autocamp;

USE autocamp;

CREATE TABLE cliente (
    codcli character(4) NOT NULL,
    nombre character varying(20),
    apellido character varying(40),
    direccion character varying(50),
    mail character varying(100),
    PRIMARY KEY (codcli)
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
    coste float
    PRIMARY KEY (matricula)
    FOREIGN KEY (codgama) REFERENCES gama (codgama)
);



CREATE TABLE gama (
    codgama character(2) NOT NULL,
    nomgama character varying(20),
    stock integer,
    precio float,
    PRIMARY KEY (codgama)
);




CREATE TABLE reserva (
    codreserva integer NOT NULL,
    fecha_res date NOT NULL,
    f_inicio date,
    f_fin date,
    dias integer,
    lugar character varying(50),
    importe float DEFAULT 0,
    gama character varying(2) NOT NULL,
    codcliente character varying(4) NOT NULL,
    coche character(7),
    f_recogida date,
    f_devolucion date,
    s_motor character(1),
    s_plazas integer,
    PRIMARY KEY (codreserva),
    FOREIGN KEY (codcliente) REFERENCES cliente(codcli),
    FOREIGN KEY (gama) REFERENCES gama(codgama)
);
