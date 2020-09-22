DELIMITER $$
CREATE PROCEDURE Masterinsertupdatedelete (IN `Personaldata_ID` INT,  
                                          IN `Firstname` VARCHAR(50),  
                                          IN `Lastname` VARCHAR(50),  
                                          IN `Birtday` DATE, 
                                          IN `Email` VARCHAR(50),
                                          IN `AHV` VARCHAR(16),
                                          IN `Personalnumber` VARCHAR(16),
										  IN `Phonenumber` INT,
                                          IN `ID_Companydata` INT,
                                          IN `StatementType` VARCHAR(50))										
BEGIN
		  IF `StatementType` = 'Insert' THEN
				INSERT INTO personaldata  
							(Firstname,  
							 Lastname,  
							 Birtday,  
							 Email,
                             AHV,
                             Personalnumber,
                             Phonenumber,
                             ID_Companydata)
							 
				VALUES     (`Firstname`,  
							`Lastname`,  
							`Birtday`,  
							`Email`,
                            `AHV`,
                            `Personalnumber`,
                            `Phonenumber`,
                            `ID_Companydata`);
		END IF;

      IF `StatementType` = 'Select' THEN
            SELECT * FROM personaldata JOIN companydata ON ID_Companydata = Companydata_ID;
        END IF;

	  IF `StatementType` = 'SelectById' THEN
            SELECT * FROM personaldata JOIN companydata ON ID_Companydata = Companydata_ID WHERE Personaldata_ID=`Personaldata_ID`;
		END IF;

            
	   IF `StatementType` = 'Update' THEN
				UPDATE personaldata  
				SET    Firstname=`Firstname`,  
					   Lastname=`Lastname`,  
					   Birtday=`Birtday`,  
					   Email=`Email`,
                       AHV=`AHV`,
                       Personalnumber=`Personalnumber`,
                       Phonenumber=`Phonenumber`
				WHERE  Personaldata_ID=`Personaldata_ID`;
		END IF;
                
		  IF `StatementType` = 'Delete' THEN
				DELETE FROM personaldata  
				WHERE Personaldata_ID = `Personaldata_ID`;
		END IF;
END