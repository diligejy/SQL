CREATE TABLE Student_raw (
    Student_id VARCHAR(512),
    Name VARCHAR(512),
    Fees INT,
    Section VARCHAR(512)
);

INSERT INTO Student_raw (Student_id, Name, Fees, Section) VALUES ('14EAR1', 'Rohan', '2000', 'B');
INSERT INTO Student_raw (Student_id, Name, Fees, Section) VALUES ('14EAR2', 'Navdeep', '1500', 'A');
INSERT INTO Student_raw (Student_id, Name, Fees, Section) VALUES ('14EAR3', 'Sohan', '2000', 'B');
INSERT INTO Student_raw (Student_id, Name, Fees, Section) VALUES ('14EAR4', 'Mohan', '5000', 'C');
INSERT INTO Student_raw (Student_id, Name, Fees, Section) VALUES ('14EAR5', 'Swapnil', '4000', 'D');
INSERT INTO Student_raw (Student_id, Name, Fees, Section) VALUES ('14EAR6', 'Tapu', '5000', 'C');
INSERT INTO Student_raw (Student_id, Name, Fees, Section) VALUES ('14EAR7', 'Goli', '4000', 'D');


-- figure out those records for which fees and sections are same but the names and studentid can be different

-- 1. SELF JOIN 
SELECT t1.student_id 
--	, t2.student_id 
	, t1."name" 
--	, t2.name
	, t1.fees 
--	, t2.fees 
	, t1."section"
--	, t2."section" 
FROM student_raw AS t1
LEFT JOIN student_raw AS t2 ON t1.fees = t2.fees AND t1.SECTION = t2.SECTION AND t1.student_id  != t2.student_id
WHERE t2.name IS NOT NULL;

-- 2. 
WITH STEP_1 AS (
SELECT *
	, ROW_NUMBER() over(PARTITION BY fees, sr.SECTION ORDER BY name) AS rownum
FROM student_raw sr)
SELECT t1.student_id 
	, t1."name" 
	, t1.fees 
	, t1."section" 
FROM student_raw AS t1 
JOIN step_1 AS t2 ON t1.fees = t2.fees AND t1.SECTION = t2.SECTION
WHERE rownum = 2