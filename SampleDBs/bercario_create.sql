-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-01-30 13:05:04.309

-- tables
-- Table: bebe
CREATE TABLE bebe (
    id serial  NOT NULL,
    id_mae int  NOT NULL,
    id_medico int  NOT NULL,
    nome_bebe varchar(60)  NOT NULL,
    data_nasc_bebe date  NOT NULL,
    altura_nasc_bebe int  NOT NULL,
    peso_nasc_bebe int  NOT NULL,
    CONSTRAINT bebe_pk PRIMARY KEY (id)
);

-- Table: especialidades
CREATE TABLE especialidades (
    id serial  NOT NULL,
    nome_especialidade varchar(60)  NOT NULL,
    CONSTRAINT especialidades_pk PRIMARY KEY (id)
);

-- Table: maeid
CREATE TABLE mae (
    id serial  NOT NULL,
    nome_mae varchar(1500)  NOT NULL,
    logradouro varchar(60)  NOT NULL,
    numero varchar(20)  NOT NULL,
    cep char(8)  NOT NULL,
    data_nascimento_mae date  NOT NULL,
    CONSTRAINT mae_pk PRIMARY KEY (id)
);

-- Table: medico
CREATE TABLE medico (
    id serial  NOT NULL,
    CRM char(10)  NOT NULL,
    nome varchar(60)  NOT NULL,
    id_especialidade int  NOT NULL,
    CONSTRAINT medico_pk PRIMARY KEY (id)
);

-- Table: telefone_mae
CREATE TABLE telefone_mae (
    id serial  NOT NULL,
    id_mae int  NOT NULL,
    telefone varchar(13)  NOT NULL,
    CONSTRAINT telefone_mae_pk PRIMARY KEY (id)
);

-- Table: telefone_medico
CREATE TABLE telefone_medico (
    id serial  NOT NULL,
    medico_id int  NOT NULL,
    telefone varchar(13)  NOT NULL,
    CONSTRAINT telefone_medico_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: bebe_mae (table: bebe)
ALTER TABLE bebe ADD CONSTRAINT bebe_mae
    FOREIGN KEY (id_mae)
    REFERENCES mae (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: bebe_medico (table: bebe)
ALTER TABLE bebe ADD CONSTRAINT bebe_medico
    FOREIGN KEY (id_medico)
    REFERENCES medico (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: medico_especialidades (table: medico)
ALTER TABLE medico ADD CONSTRAINT medico_especialidades
    FOREIGN KEY (id_especialidade)
    REFERENCES especialidades (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: telefone_mae (table: telefone_mae)
ALTER TABLE telefone_mae ADD CONSTRAINT telefone_mae
    FOREIGN KEY (id_mae)
    REFERENCES mae (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: telefone_medico_medico (table: telefone_medico)
ALTER TABLE telefone_medico ADD CONSTRAINT telefone_medico_medico
    FOREIGN KEY (medico_id)
    REFERENCES medico (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

