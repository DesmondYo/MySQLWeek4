-- Write 5 stored procedures for the employees database.
-- Write a description of what each stored procedure does and how to use it.
-- Procedures should use constructs you learned about from your research 
-- assignment and be more than just queries.

#1 This Procedure shows all the employees.
DELIMITER //

CREATE PROCEDURE employee(IN employees int)
BEGIN
	SELECT * FROM employees LIMIT employees;
END //
DELIMITER;
CALL employee(5);

#2 This procedure will return all of the salaries for an employee
DELIMITER //

CREATE PROCEDURE FindSalary(
	IN lv_emp_no int(11)
)
BEGIN
	SELECT e.emp_no, s.salary, e.first_name, e.last_name, e.gender, e.hire_date
	FROM employees e
	INNER JOIN salaries s ON s.emp_no = e.emp_no
	WHERE lv_emp_no = e.emp_no;
END //
DELIMITER ;
CALL FindSalary(10012);

#3 This procedure will return an employees current salary
DELIMITER //

CREATE PROCEDURE CurrentSalary(
	IN lv_first_name varchar(20),
	IN lv_last_name varchar(20)
)
BEGIN
	SELECT s.salary
	FROM employees e
	INNER JOIN salaries s ON s.emp_no = e.emp_no
	WHERE e.first_name = lv_first_name
	AND e.last_name = lv_last_name
	AND to_date < curdate() 
	ORDER BY to_date desc LIMIT 1;
END //
DELIMITER ;
CALL CurrentSalary('Aloys','Kinley');

#4 This procedure will add each employee with a higher salary than 50000
DELIMITER //

CREATE PROCEDURE HigherSalary( 
)
BEGIN
	SELECT salary
	FROM salaries
	WHERE salary > 100000 
	ORDER BY salary desc LIMIT 25;
END // 
DELIMITER ;
CALL HigherSalary();

#5 This procedure will return every employee with a specific title
DELIMITER //

CREATE PROCEDURE SpecificTitle(
	IN lv_title varchar(50)
)
BEGIN
	SELECT e.first_name, e.last_name, t.title
	FROM titles t
	INNER JOIN employees e on t.emp_no = e.emp_no
	WHERE t.title = lv_title LIMIT 10;
END // 
DELIMITER ;
CALL SpecificTitle('Staff');








