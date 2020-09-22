-- Database: postgres

-- DROP DATABASE postgres;

CREATE DATABASE postgres
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'German_Switzerland.1252'
    LC_CTYPE = 'German_Switzerland.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE postgres
    IS 'default administrative connection database';
    
-- Table: public.companydata

-- DROP TABLE public.companydata;

CREATE TABLE public.companydata
(
    "Companydata_ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Companyname" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Departement" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Jobtitle" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Jobdescription" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT companydata_pkey PRIMARY KEY ("Companydata_ID"),
    CONSTRAINT "Departement" UNIQUE ("Departement")
)

TABLESPACE pg_default;

ALTER TABLE public.companydata
    OWNER to postgres;
    
-- Table: public.personaldata

-- DROP TABLE public.personaldata;

CREATE TABLE public.personaldata
(
    "Personaldata_ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Firstname" character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    "Lastname" character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    "Birthday" date[] NOT NULL,
    "Email" character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    "AVH" character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    "Personalnumber" integer NOT NULL,
    "Phonenumber" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "ID_Companydata" integer NOT NULL,
    CONSTRAINT personaldata_pkey PRIMARY KEY ("Personaldata_ID"),
    CONSTRAINT "Personalnumber" UNIQUE ("Personalnumber"),
    CONSTRAINT "companydata_Companydata_ID_fkey" FOREIGN KEY ("ID_Companydata")
        REFERENCES public.companydata ("Companydata_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.personaldata
    OWNER to postgres;