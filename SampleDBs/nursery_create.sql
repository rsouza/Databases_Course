DROP DATABASE IF EXISTS Nursery;
CREATE DATABASE IF NOT EXISTS Nursery;
USE Nursery;

CREATE TABLE Nursery.baby (
    id int AUTO_INCREMENT NOT NULL,
    id_mother int NOT NULL,
    id_doctor int NOT NULL,
    name_baby varchar(60) NOT NULL,
    date_baby date NOT NULL,
    height_baby int NULL,
    weight_baby int NULL,
    CONSTRAINT baby_pk PRIMARY KEY (id)
);

CREATE TABLE Nursery.specializations (
    id int AUTO_INCREMENT NOT NULL,
    name_specialization varchar(60) NOT NULL,
    CONSTRAINT specializations_pk PRIMARY KEY (id)
);

CREATE TABLE Nursery.mother (
    id int AUTO_INCREMENT NOT NULL,
    name_mother varchar(1500) NOT NULL,
    street varchar(60) NULL,
    streetnumber varchar(20) NULL,
    zip char(8) NULL,
    date_mother date NULL,
    CONSTRAINT mother_pk PRIMARY KEY (id)
);

CREATE TABLE Nursery.doctor (
    id int AUTO_INCREMENT NOT NULL,
    register char(10) NOT NULL,
    name varchar(60) NOT NULL,
    id_specialization int NOT NULL,
    CONSTRAINT doctor_pk PRIMARY KEY (id)
);

CREATE TABLE Nursery.phone_mother (
    id int AUTO_INCREMENT NOT NULL,
    id_mother int NOT NULL,
    phone varchar(13) NOT NULL,
    CONSTRAINT phone_mother_pk PRIMARY KEY (id)
);

CREATE TABLE Nursery.phone_doctor (
    id int AUTO_INCREMENT NOT NULL,
    id_doctor int NOT NULL,
    phone varchar(13) NOT NULL,
    CONSTRAINT phone_doctor_pk PRIMARY KEY (id)
);

ALTER TABLE baby ADD CONSTRAINT baby_mother FOREIGN KEY baby_mother (id_mother)
    REFERENCES Nursery.mother (id);

ALTER TABLE baby ADD CONSTRAINT baby_doctor FOREIGN KEY baby_doctor (id_doctor)
    REFERENCES Nursery.doctor (id);

ALTER TABLE doctor ADD CONSTRAINT doctor_specializations FOREIGN KEY doctor_specializations (id_specialization)
    REFERENCES Nursery.specializations (id);

ALTER TABLE phone_mother ADD CONSTRAINT phone_mother FOREIGN KEY phone_mother (id_mother)
    REFERENCES Nursery.mother (id);

ALTER TABLE phone_doctor ADD CONSTRAINT phone_doctor FOREIGN KEY phone_doctor (id_doctor)
    REFERENCES Nursery.doctor (id);
