
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
    "AHV" character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
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
    
CREATE TABLE public.personaldata_audit (
	"id" INT GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Personaldata_id" INT NOT NULL,
    "changedate" DATE NOT NULL,
    action VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

-- Functions

CREATE FUNCTION trigger_insert()
    RETURNS trigger
    LANGUAGE plpgsql
AS $FUNCTION$
BEGIN
    INSERT INTO log (personaldata_id, changedate, action)
    VALUES (NEW.Personaldata_ID, current_timestamp, 'insert');
    RETURN new;
END;
$FUNCTION$;

CREATE FUNCTION trigger_update()
    RETURNS trigger
    LANGUAGE plpgsql
AS $FUNCTION$
BEGIN
    INSERT INTO log (personaldata_id, changedate, action)
    VALUES (OLD.Personaldata_ID, current_timestamp, 'update');
    RETURN new;
END;
$FUNCTION$;

CREATE FUNCTION trigger_delete()
    RETURNS trigger
    LANGUAGE plpgsql
AS $FUNCTION$
BEGIN
    INSERT INTO log (personaldata_id, changedate, action)
    VALUES (OLD.Personaldata_ID, current_timestamp, 'delete');
    RETURN new;
END;
$FUNCTION$;

-- Triggers

CREATE TRIGGER after_personaldata_insert
	AFTER INSERT ON personaldata
	FOR EACH ROW EXECUTE FUNCTION trigger_insert();
    
    CREATE TRIGGER before_personaldata_update
	BEFORE UPDATE ON personaldata
	FOR EACH ROW EXECUTE FUNCTION trigger_update();
    
    CREATE TRIGGER before_personaldata_delete
	BEFORE DELETE ON personaldata
	FOR EACH ROW EXECUTE FUNCTION trigger_delete();
    
/*INSERT INTO personaldata("Firstname", "Lastname", "Birthday", "Email", "AHV", "Personalnumber", "Phonenumber", "ID_Companydata") 
VALUES("Suhejl", "Asani", CURRENT_TIMESTAMP, "suhejl.asani.17@gmail.com", "ASDFGHJ", 123, fsd, 1);
UPDATE personaldata SET Firstname = "Culi" WHERE Personaldata_ID = 3;
DELETE FROM personaldata WHERE Personaldata_ID = 3;*/
    
-- Stored Procedures

CREATE PROCEDURE Stored_Procedure_SEeweweweLECT_INSERT_UPDATE_DELETE (IN ID INT,  
                                          IN firstname VARCHAR(50),  
                                          IN lastname VARCHAR(50),  
                                          IN birthday DATE, 
                                          IN email VARCHAR(50),
                                          IN ahv VARCHAR(50),
                                          IN personalnumber INT,
										  IN phonenumber VARCHAR(50),
                                          IN id_Companydata INT,
                                          IN Action VARCHAR(50))
AS $$
BEGIN
		IF Action = 'INSERT' THEN
				INSERT INTO personaldata  
							(Firstname,  
							 Lastname,  
							 Birthday,  
							 Email,
               AHV,
               Personalnumber,
               Phonenumber,
               ID_Companydata)
							 
				VALUES (firstname,  
							lastname,  
							birthday,  
							email,
              ahv,
              personalnumber,
              phonenumber,
              id_Companydata);

	  ELSEIF Action = 'SELECTBYID' THEN
            SELECT p.Personaldata_ID as "Personaldata_ID", p.Firstname as "Firstname", p.Lastname as "Lastname", p.Birthday as "Birthday", p.Email as "Email", p.AHV as "AHV", p.Personalnumber as "Personalnumber", p.Phonenumber as "Phonenumber",
			 p.ID_Companydata as "ID_Companydata", c.Companyname as "Companyname", c.Departement as "Departement", c.Jobtitle as "Jobtitle", c.Jobdescription as "Jobdescription" FROM personaldata p JOIN companydata c ON p.ID_Companydata = c.Companydata_ID WHERE Personaldata_ID = ID;

      ELSEIF Action = 'SELECT' THEN
            SELECT p.Personaldata_ID as "Personaldata_ID", p.Firstname as "Firstname", p.Lastname as "Lastname", p.Birthday as "Birthday", p.Email as "Email", p.AHV as "AHV", p.Personalnumber as "Personalnumber", p.Phonenumber as "Phonenumber",
			 p.ID_Companydata as "ID_Companydata", c.Companyname as "Companyname", c.Departement as "Departement", c.Jobtitle as "Jobtitle", c.Jobdescription as "Jobdescription" FROM personaldata p JOIN companydata c ON p.ID_Companydata = c.Companydata_ID;
            
	   ELSEIF Action = 'UPDATE' THEN
				UPDATE personaldata  
				SET    Firstname=firstname,  
					   Lastname=lastname,  
					   Birthday=birthday,  
					   Email=email,
                       AHV=ahv,
                       Personalnumber=personalnumber,
                       Phonenumber=phonenumber
				WHERE  Personaldata_ID=ID;
                
		  ELSEIF Action = 'DELETE' THEN
				DELETE FROM personaldata  
				WHERE Personaldata_ID = ID;
		END IF;
END;
$$ LANGUAGE plpgsql;