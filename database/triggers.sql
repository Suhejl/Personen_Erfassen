use persondata;
show tables;

desc companydata;

desc personaldata;
desc companydata;

/* Create AUDIT Table */

CREATE TABLE personaldata_audit(
	id INT AUTO_INCREMENT,
    personaldata_id INT NOT NULL,
    changedate DATETIME NOT NULL,
    action VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

/* Create Triggers */

CREATE TRIGGER after_personaldata_insert
	AFTER INSERT ON personaldata
	FOR EACH ROW
	INSERT INTO personaldata_audit
	SET 
		action = 'insert',
		personaldata_id = NEW.Personaldata_ID,
		changedate = NOW();

CREATE TRIGGER before_personaldata_update
	BEFORE UPDATE ON personaldata
    FOR EACH ROW
    INSERT INTO personaldata_audit
    SET
		action = 'update',
        personaldata_id = OLD.Personaldata_ID,
        changedate = NOW();

CREATE TRIGGER before_personaldata_delete
	BEFORE DELETE ON personaldata
    FOR EACH ROW
    INSERT INTO personaldata_audit
    SET
		action = 'delete',
        personaldata_id = OLD.Personaldata_ID,
        changedate = NOW();

/* SELECT DATA */
SELECT * FROM personaldata;
SELECT * FROM personaldata_audit;

/* Test */
INSERT INTO personaldata(Firstname, Lastname, Birthday, Email, AHV, Personalnumber, Phonenumber, ID_Companydata) 
VALUES('Suhejl', 'Asani', NOW(), 'suhejl.asani.17@gmail.com', 'ASDFGHJ', 123, 'fsd', 1);

UPDATE personaldata SET Firstname = "Culi" WHERE Personaldata_ID = 3;

DELETE FROM personaldata WHERE Personaldata_ID = 3;