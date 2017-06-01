CREATE OR REPLACE TABLE TATOO
(
       codigo                    NUMBER not null,
       nombre                    VARCHAR2(20) not null,
       descripcion               VARCHAR2(150),
       ruta                      VARCHAR2(20) not null
);
ALTER TABLE TATTO ADD(
      CONSTRAINT PK_TATOO PRIMARY KEY (CODIGO)
)

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



