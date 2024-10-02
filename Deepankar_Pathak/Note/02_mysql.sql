USE query_test;
CREATE TABLE data_raw (
    Id INT,
    Name VARCHAR(512),
    Email VARCHAR(512)
);
 
INSERT INTO data_raw (Id, Name, Email) VALUES ('1', 'Ravi Krishan', '_ravi_krishan@abc.com"');
INSERT INTO data_raw (Id, Name, Email) VALUES ('2', 'Ranjan', '_ranjan_123@abc.com"');
INSERT INTO data_raw (Id, Name, Email) VALUES ('3', 'Sonali Gupta', '_sonali_gupta_1@abc.com"');
INSERT INTO data_raw (Id, Name, Email) VALUES ('4', 'Dines Gupta', '_Dinesh_gupta_9@xyz.com"');

-- locate + substring
SELECT 
	id, name, substring(email1, 1,  locate('"', email1) - 1) AS email2
FROM 
(SELECT id, name, substring(email FROM locate('_', email) + 1) AS email1
FROM data_raw) AS t ;
