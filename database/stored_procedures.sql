DELIMITER $$
CREATE PROCEDURE `Stored_Procedure_SELECT_INSERT_UPDATE_DELETE` (IN ID INT,  
                                          IN firstname VARCHAR(50),  
                                          IN lastname VARCHAR(50),  
                                          IN birthday DATE, 
                                          IN email VARCHAR(50),
                                          IN ahv VARCHAR(50),
                                          IN personalnumber INT,
										  IN phonenumber VARCHAR(50),
                                          IN id_Companydata INT,
                                          IN Action VARCHAR(50))										
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
							 
				VALUES     (firstname,  
							lastname,  
							birthday,  
							email,
                            ahv,
                            personalnumber,
                           	phonenumber,
                            id_Companydata);

	  ELSEIF Action = 'SELECTBYID' THEN
            SELECT * FROM personaldata WHERE Personaldata_ID = ID;

      ELSEIF Action = 'SELECT' THEN
            SELECT p.Personaldata_ID as 'Personaldata_ID', p.Firstname as 'Firstname', p.Lastname as 'Lastname', p.Birthday as 'Birthday', p.Email as 'Email', p.AHV as 'AHV', p.Personalnumber as 'Personalnumber', p.Phonenumber as 'Phonenumber',
			 p.ID_Companydata as 'ID_Companydata', c.Companyname as 'Companyname', c.Departement as 'Departement', c.Jobtitle as 'Jobtitle', c.Jobdescription as 'Jobdescription' FROM personaldata p JOIN companydata c ON p.ID_Companydata = c.Companydata_ID;
            
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
END