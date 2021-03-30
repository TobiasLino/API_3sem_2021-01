--liquibase formatted sql

--changeset tslino:1
drop table if exists MOM_BLOCO cascade;
drop table if exists MOM_DOCUMENTO cascade;
drop table if exists MOM_DOC_BLOCO cascade;
drop sequence if exists MOM_DOCUMENTO_SQ;
drop sequence if exists MOM_BLOCO_SQ;

--changeset tslino:2
--comment: Create table MOM.MOM_DOC
CREATE TABLE MOM_DOCUMENTO (
   DOC_COD SERIAL CONSTRAINT PK_DOC_COD PRIMARY KEY,
   DOC_DATA_CRIA DATE DEFAULT CURRENT_DATE,
   DOC_NOME VARCHAR(30) NOT NULL,
   DOC_PN INTEGER NOT NULL,
   DOC_TRACO INTEGER NOT NULL,

   CONSTRAINT UK_DOC_PN_TRACO_NOM UNIQUE (DOC_NOME, DOC_PN, DOC_TRACO)
);
CREATE SEQUENCE MOM_DOCUMENTO_SQ start with 1 increment by 1 maxvalue 9999999999 no cycle;


--changeset tslino:3
--comment: Create table MOM_BLOCO
CREATE TABLE MOM_BLOCO (
   BLC_COD SERIAL CONSTRAINT PK_BLOCO_COD PRIMARY KEY,
   BLC_SECAO VARCHAR(10) NOT NULL,
   BLC_SUB_SECAO VARCHAR(10),
   BLC_NUMERO INTEGER NOT NULL,
   BLC_NOME VARCHAR(30),
   BLC_CODIGO INTEGER NOT NULL,
   BLC_ORDER INTEGER
);
CREATE SEQUENCE mom.MOM_BLOCO_SQ;

--changeset tslino:4
--comment: Create intermediate table between MOM_DOCUMENT and MOM_BLOCO as MOM_DOC_BLOCO
CREATE TABLE MOM_DOC_BLOCO (
   DOC_COD SERIAL CONSTRAINT FK_DOC_BLOCO_DOC_COD REFERENCES MOM_DOCUMENTO(DOC_COD),
   BLC_COD SERIAL CONSTRAINT FK_DOC_BLOCO_BLC_COD REFERENCES MOM_BLOCO(BLC_COD)
);