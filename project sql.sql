create database PROJECT;
USE PROJECT;
CREATE TABLE EMPLOYEE (
    Empno INT NOT NULL PRIMARY KEY,
    Ename VARCHAR(10),
    Job VARCHAR(9),
    Mgr INT,
    Hiredate DATE,
    Sal DECIMAL(7,2),
    Comm DECIMAL(7,2),
    Deptno INT
);
CREATE TABLE DEPARTMENT (
    Deptno INT NOT NULL PRIMARY KEY,
    Dname VARCHAR(14),
    Loc VARCHAR(13)
);
CREATE TABLE STUDENT (
    Rno INT NOT NULL PRIMARY KEY,
    Sname VARCHAR(14),
    City VARCHAR(20),
    State VARCHAR(20)
);
CREATE TABLE EMP_LOG (
    Emp_id INT NOT NULL,
    Log_date DATE,
    New_salary INT,
    Action VARCHAR(20),
    FOREIGN KEY (Emp_id) REFERENCES EMP(Empno)
);
INSERT INTO DEPARTMENT (Deptno, Dname, Loc) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');
SELECT*FROM DEPARTMENT;

INSERT INTO EMPLOYEE (Empno, Ename, Job, Mgr, Hiredate, Sal, Comm, Deptno) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17',  800.00,  NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD',  'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER',  7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN','SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER',  7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER',  7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST',  7566, '1987-06-11', 3000.00, NULL, 20),
(7839, 'KING',  'PRESIDENT',NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER','SALESMAN', 7698, '1981-08-09', 1500.00,    0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-03-12',  950.00, NULL, 30),
(7902, 'FORD',  'ANALYST', 7566, '1981-03-12', 3000.00, NULL, 20),
(7934, 'MILLER','CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);
SELECT*FROM EMPLOYEE;
truncate table employee;
INSERT INTO EMP (Empno, Ename, Job, Mgr, Hiredate, Sal, Comm, Deptno) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17',  800.00,  NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD',  'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER',  7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN','SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER',  7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER',  7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST',  7566, '1987-06-11', 3000.00, NULL, 20),
(7839, 'KING',  'PRESIDENT',NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER','SALESMAN', 7698, '1981-08-09', 1500.00,    0.00, 30),
(7876, 'ADAMS', 'CLERK',    7788, '1987-07-13', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK',    7698, '1981-03-12',  950.00, NULL, 30),
(7902, 'FORD',  'ANALYST',  7566, '1981-03-12', 3000.00, NULL, 20),
(7934, 'MILLER','CLERK',    7782, '1982-01-23', 1300.00, NULL, 10);

/*Q1. Select unique job from EMP table.*/ 
SELECT DISTINCT JOB 
FROM EMP;

/*Q2. List the details of the emps in asc order of the Dptnos and desc of Jobs?*/
SELECT *
FROM EMP
ORDER BY Deptno ASC,
 Job DESC;

/*3. Display all the unique job groups in the descending order?*/
SELECT DISTINCT Job
FROM EMP
ORDER BY Job DESC;

/*Q4. List the emps who joined before 1981.*/
SELECT *
FROM EMP
WHERE Hiredate < '1981-01-01';

/*Q5. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of AnnUal.*/
SELECT 
    Empno,
    Ename,
    Sal,
ROUND((Sal * 12) / 365, 2) AS Daily_Sal,
(Sal * 12) AS Annual
FROM EMP
ORDER BY Annual ASC;

/*Q6.List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369. */
SELECT 
    Empno,
    Ename,
    Sal,
    TIMESTAMPDIFF(YEAR, Hiredate, CURDATE()) AS Exp
FROM EMP
WHERE Mgr = 7369;
#RESULT-( no employee has Mgr = 7369 in your EMP table.
               #7369 = SMITH (Clerk)
		 #Clerks don’t manage anyone in this dataset, so nobody reports to him).
         

/*Q7.Display all the details of the emps who’s Comm. Is more than their Sal?*/
SELECT *
FROM EMP
WHERE Comm > sal;

/*Q8.List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.*/
SELECT *
FROM EMP
WHERE Job IN ('CLERK', 'ANALYST')
ORDER BY Job DESC;

/*Q9.List the emps Whose Annual sal ranging from 22000 and 45000.*/
SELECT 
    Empno, 
    Ename, 
    Sal, 
    (Sal * 12) AS Annual_Sal
FROM EMP
WHERE (Sal * 12) BETWEEN 22000 AND 45000
ORDER BY Annual_Sal;

/*Q10.List the Enames those are starting with ‘S’ and with five characters.*/
SELECT Ename
FROM EMP
WHERE Ename LIKE 'S____';

/*Q11.List the emps whose Empno not starting with digit78.*/
SELECT *
FROM EMP
WHERE Empno NOT LIKE '78%';

/*Q12. List all the Clerks of Deptno 20.*/
SELECT *
FROM EMP
WHERE Job = 'CLERK'
  AND Deptno = 20;

/*Q13.List the Emps who are senior to their own MGRS.*/
SELECT e.Empno, e.Ename, e.Job, e.Hiredate, e.Mgr
FROM EMP e
JOIN EMP m ON e.Mgr = m.Empno
WHERE e.Hiredate < m.Hiredate;

/*Q14. List the Emps of Deptno 20 who’s Jobs are same as Deptno10. */
SELECT *
FROM EMP
WHERE Deptno = 20
  AND Job IN (
      SELECT DISTINCT Job
      FROM EMP
      WHERE Deptno = 10);

/*Q15. List the Emps who’s Sal is same as FORD or SMITH in desc order of Sal.*/
SELECT *
FROM EMP
WHERE Sal IN (
    SELECT Sal
    FROM EMP
    WHERE Ename IN ('FORD', 'SMITH'))
ORDER BY Sal DESC;

/*Q16. List the emps whose jobs same as SMITH or ALLEN.*/
SELECT *
FROM EMP
WHERE Job IN (
    SELECT Job
    FROM EMP
    WHERE Ename IN ('SMITH', 'ALLEN')
);

/*Q17. Any jobs of deptno 10 those that are not found in deptno 20.*/
SELECT DISTINCT Job
FROM EMP
WHERE Deptno = 10
  AND Job NOT IN (
      SELECT Job
      FROM EMP
      WHERE Deptno = 20
  );

/*Q18. Find the highest sal of EMP table.*/
SELECT MAX(Sal) AS Highest_Sal
FROM EMP;

/*Q19. Find details of highest paid employee. */
SELECT *
FROM EMP
WHERE Sal = (SELECT MAX(Sal) FROM EMP);

/*Q20. Find the total sal given to the MGR. */
SELECT SUM(Sal) AS Total_Manager_Sal
FROM EMP
WHERE Job = 'MANAGER';

/*Q21.List the emps whose names contains ‘A’.*/
SELECT *
FROM EMP
WHERE Ename LIKE '%A%';

/*Q22. Find all the emps who earn the minimum Salary for each job wise in ascending order. */
SELECT *
FROM EMP e
WHERE Sal = (
    SELECT MIN(Sal)
    FROM EMP
    WHERE Job = e.Job
)
ORDER BY Sal ASC;

/*Q23. List the emps whose sal greater than Blake’s sal.*/
SELECT *
FROM EMP
WHERE Sal > (
    SELECT Sal
    FROM EMP
    WHERE Ename = 'BLAKE'
);

/*Q24. Create view v1 to select ename, job, dname, loc whose deptno are same. */
CREATE VIEW v1 AS
SELECT 
    e.Ename,
    e.Job,
    d.Dname,
    d.Loc
FROM EMP e
JOIN DEPARTMENT d ON e.Deptno = d.Deptno;
SELECT*FROM v1;

/*Q25.Create a procedure with dno as input parameter to fetch ename and dname. */
DELIMITER $$
CREATE PROCEDURE GetEmpByDept(IN Deptno INT)
BEGIN
    SELECT EMP.Ename, DEPARTMENT.dname
    FROM EMP 
    JOIN DEPARTMENT  ON EMP.deptno = DEPARTMENT.Deptno
    WHERE EMP.deptno = Deptno;
END $$
DELIMITER ;
call GetEmpByDept(20);

/*Q26.Add column Pin with bigint data type in table student.*/
ALTER TABLE STUDENT
ADD COLUMN Pin BIGINT;

/*Q27.Modify the student table to change the sname length from 14 to 40.
Create trigger to insert data in emp_log table whenever any update of sal in EMP table. 
You can set action as ‘New Salary’.*/
ALTER TABLE STUDENT
MODIFY COLUMN Sname VARCHAR(40);
show triggers;
DELIMITER $$
CREATE TRIGGER trg_UpdateSal
AFTER UPDATE ON EMP
FOR EACH ROW
BEGIN
    -- Only insert into EMP_LOG if salary actually changed
    IF OLD.Sal <> NEW.Sal THEN
        INSERT INTO EMP_LOG (Emp_id, Log_date, New_salary, Action)
        VALUES (NEW.Empno, CURDATE(), NEW.Sal, 'New Salary');
    END IF;
END $$
DELIMITER ;
UPDATE EMP
SET Sal = 4000
WHERE Empno = 7566; 

UPDATE EMP
SET Sal = 3200
WHERE Empno = 7788;
# After every salary update, EMP_LOG will automatically track the employee ID, date, new salary, and action.