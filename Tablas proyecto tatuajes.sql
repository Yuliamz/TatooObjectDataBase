--ESPECIFICACION DEL OBJETO
CREATE OR REPLACE TYPE OBJECT_TATOO AS OBJECT(
       codigo                    NUMBER,
       nombre                    VARCHAR2(20),
       descripcion               VARCHAR2(150),
       ruta                      VARCHAR2(40),
       MEMBER PROCEDURE mostrar);

--CUERPO DEL OBJETO
CREATE OR REPLACE TYPE BODY OBJECT_TATOO AS
  MEMBER PROCEDURE mostrar IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Código: ' || codigo || ' - ' || 'nombre: ' || nombre ||' - ' || 'descripción: ' || descripcion);
  END;
END;

--TABLA CREADA A PARTIR DEL OBJETO INDICANDO LA LLAVE PRIMARIA
CREATE TABLE TATOOS of OBJECT_TATOO (PRIMARY KEY (codigo)); 
--INSERCIONES EN LA TABLA
INSERT INTO TATOOS VALUES(OBJECT_TATOO (1, 'Calavera', 'Calavera blanca en llamas','C://tatoos//calavera.png')); 
INSERT INTO TATOOS VALUES(OBJECT_TATOO (2, 'Dragon', 'Dragon estilo oriental','C://tatoos//dragon.png'));
--BLOQUE ANONIMO PARA LLAMAR EL METODO "MOSTRAR" DEL OBJETO
DECLARE
  mi_tatoo OBJECT_TATOO;
BEGIN
  SELECT VALUE(t) INTO mi_tatoo FROM TATOOS t WHERE t.codigo = 1;
  mi_tatoo.mostrar();
END;

--OBJETO PERSONA PARA HERENCIA
CREATE OR REPLACE TYPE TIPO_PERSON AS OBJECT(
       codigo                   NUMBER,
       dni                      NUMBER,
       nombre                   VARCHAR2(20),
       telefono                 NUMBER(10),
       tipo_dni                 VARCHAR2(1),
       genero                   VARCHAR2(1)
)
NOT INSTANTIABLE NOT FINAL;

--OBJETO CLIENTE HEREDADO DE PERSONA
CREATE OR REPLACE TYPE TIPO_CLIENTE UNDER TIPO_PERSON(
  Informacion VARCHAR2(250)
);

--TABLA DE CLIENTES
CREATE TABLE CLIENTES OF TIPO_CLIENTE(PRIMARY KEY (CODIGO),
CHECK (GENERO IN ('F'/*FEMENINO*/,'M'/*MASCULINO*/)AND GENERO = UPPER(GENERO)),
CHECK (TIPO_DNI IN ('C'/*CEDULA DE CIUDADANIA*/,'E'/*CEDULA EXTRANJERA*/,'T'/*TARJETA DE IDENTIDAD*/)AND TIPO_DNI = UPPER(TIPO_DNI)));

--INCERSION
INSERT INTO CLIENTES VALUES(TIPO_CLIENTE (1, 1049645321, 'Pedro Hernandez',3132567840,'C','M','Piel sensible')); 

--CONSULTA
select * from clientes;









CREATE OR REPLACE TABLE TATOOARTIST
(
       codigo                   NUMBER not null,
       nick                     VARCHAR2(20)not null,
       email                    VARCHAR2(20) not null,
       dni                      number not null,
       nombre                   VARCHAR2(20) not null,
       telefono                 NUMBER(10) not null,
       tipo_dni                 VARCHAR2(1) default 'C' not null
       genero                   VARCHAR2(1) default 'F' not null
);
ALTER TABLE TATOOARTIST ADD(
      CONSTRAINT PK_TATOOARTIST PRIMARY KEY (CODIGO),
      CONSTRAINT CKC_GENERO_TATOOARTIST CHECK (GENERO IN ('F'/*FEMENINO*/,'M'/*MASCULINO*/)AND GENERO = UPPER(GENERO))
      CONSTRAINT CKC_TIPO_DNI CHECK (TIPO_DNI IN ('C'/*CEDULA DE CIUDADANIA*/,'E'/*CEDULA EXTRANJERA*/,'T'/*TARJETA DE IDENTIDAD*/)AND TIPO_DNI = UPPER(TIPO_DNI))
)

CREATE OR REPLACE TABLE CLIENT
(
       codigo                   NUMBER not null,
       dni                      number not null,
       nombre                   VARCHAR2(20) not null,
       telefono                 NUMBER(10) not null,
       genero                   VARCHAR2(1) default 'F' not null
       tipo_dni                 VARCHAR2(1) default 'C' not null
);
ALTER TABLE CLIENT ADD(
      CONSTRAINT PK_CLIENT PRIMARY KEY (CODIGO),
      CONSTRAINT CKC_GENERO_CLIENT CHECK (GENERO IN ('F'/*FEMENINO*/,'M'/*MASCULINO*/)AND GENERO = UPPER(GENERO))
      CONSTRAINT CKC_TIPO_DNI CHECK (TIPO_DNI IN ('C'/*CEDULA DE CIUDADANIA*/,'E'/*CEDULA EXTRANJERA*/,'T'/*TARJETA DE IDENTIDAD*/)AND TIPO_DNI = UPPER(TIPO_DNI))
)

CREATE OR REPLACE TABLE CONTRACT
(
       CODIGO           NUMBER NOT NULL,
       FECHA_INICIO     TIMESTAMP NOT NULL,
       FECHA_FIN        TIMESTAMP,
       DESCRIPCION      VARCHAR2,
       TIPO             VARCHAR2(1) default 'F' not null
)
ALTER TABLE CONTRACT ADD(
      CONSTRAINT PK_CONTRACT PRIMARY KEY (CODIGO),
      CONSTRAINT CKC_TIPO CHECK (TIPO IN ('F'/*FIXED TERM*/,'I'/*INDEFINITE TERM*/,'D'/*DELIVERY SERVICES*/)AND TIPO_DNI = UPPER(TIPO_DNI))
)

CREATE OR REPLACE TABLE PAYMENT
(
       CODIGO           NUMBER NOT NULL,
       FECHA            TIMESTAMP NOT NULL,
       PAGO             DECIMAL NOT NULL
)
ALTER TABLE PAYMENT ADD(
      CONSTRAINT PK_PAYMENT PRIMARY KEY (CODIGO)
)

CREATE OR REPLACE TABLE APPOINMENT
(
       CODIGO                  NUMBER NOT NULL,
       FECHA_ASIGNACION        TIMESTAMP NOT NULL,
       FECHA_CITA              TIMESTAMP NOT NULL
)
ALTER TABLE APPOINMENT ADD(
      CONSTRAINT PK_APPOINMENT PRIMARY KEY (CODIGO)
)

CREATE OR REPLACE TABLE TATOOWORK 
(
       CODIGO                  NUMBER NOT NULL,
       COSTO_TOTAL             DECIMAL NOT NULL
)

ALTER TABLE TATOOWORK ADD(
      CONSTRAINT PK_TATOOWORK PRIMARY KEY (CODIGO)
)



