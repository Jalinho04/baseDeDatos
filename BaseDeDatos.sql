CREATE DATABASE Testeto
    DEFAULT CHARACTER SET = 'utf8mb4';

USE Testeto

Create table Entidad_bancaria(
    ID_banco INT(10) PRIMARY KEY AUTO_INCREMENT,
    Domicilio_central VARCHAR(10)
);

CREATE Table Sucursales(
    ID_sucursal INT(10) PRIMARY KEY AUTO_INCREMENT,
    Numero_empleados INTEGER(10),
    Domicilio_sucursal VARCHAR(10),
    ID_banco INT(10)
);

CREATE TABLE Vigilantes(
    ID_vigilante INT(10) PRIMARY KEY AUTO_INCREMENT,
    edad INTEGER (3)
);

CREATE Table detenidos(
    ID_persona INT(10) PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25),
    ID_banda INT(10)
);

CREATE Table Bandas(
    ID_banda INT(10) PRIMARY KEY AUTO_INCREMENT,
    Numero_miembros INTEGER(2)
);

CREATE Table Juez(
    ID_juez INT(10) PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25),
    Años_servicio INTEGER(7) 
);

Create Table Contrataciones(
    Fecha_contratación DATE,
    Arma VARCHAR(2),
    ID_sucursal INT,
    ID_vigilante INT,
    PRIMARY KEY (ID_Sucursal, ID_vigilante),
    FOREIGN KEY (ID_sucursal) REFERENCES Sucursales (ID_sucursal),
    FOREIGN KEY (ID_vigilante) REFERENCES Vigilantes(ID_vigilante)
);

DROP Table Contratacion;

Create Table atracos(
    Fecha_atraco DATE,
    ID_sucursal INT,
    ID_persona INT,
    PRIMARY KEY (ID_Sucursal, ID_persona),
    FOREIGN KEY (ID_sucursal) REFERENCES Sucursales (ID_sucursal),
    FOREIGN KEY (ID_persona) REFERENCES Detenidos (ID_persona)
);

Create Table Casos(
    Condena VARCHAR(2),
    tiempo_carcel TIME,
    ID_juez INT,
    ID_persona INT,
    PRIMARY KEY (ID_juez, ID_persona),
    FOREIGN KEY (ID_juez) REFERENCES Juez (ID_juez),
    FOREIGN KEY (ID_persona) REFERENCES Detenidos (ID_persona)
);

ALTER Table Sucursales ADD FOREIGN KEY fk_id (ID_Banco)
REFERENCES Entidad_bancaria (ID_Banco);

ALTER TABLE detenidos ADD FOREIGN KEY kf_id1 (ID_banda)
REFERENCES Bandas (ID_banda);

INSERT INTO Juez (Nombre, Años_servicio) VALUES ("Lucas Rodriguez", 12);

INSERT INTO detenidos (ID_persona, Nombre) VALUES (1082867823, "Roberto");

INSERT INTO vigilantes (ID_vigilante, Edad) VALUES (1082867825, 23);