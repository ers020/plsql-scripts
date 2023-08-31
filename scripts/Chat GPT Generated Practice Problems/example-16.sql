/*

    Design a PL/SQL package that includes procedures to insert, update, and delete employees.
    Implement a logging mechanism to record these operations in a separate table.

*/

    -- Step 1: make a package
CREATE OR REPLACE PACKAGE p_employees AS
    -- add an employee
    PROCEDURE add_employee(
        emp_id      IN employee.employee_id%type,
        f_name      IN employee.first_name%type,
        l_name      IN employee.last_name%type,
        sal         IN employee.salary%type,
        l_mod       IN employee.last_modified%type,
        dob         IN employee.dob%type,
        j_id        IN employee.job_id%type,
        d_no        IN employee.department_no%type
    );

    -- update an employee
    PROCEDURE update_employee(
        emp_id     IN  employee.employee_id%type,
        f_name     IN  employee.first_name%type,
        l_name     IN  employee.last_name%type
    );

    --delete an employee
    PROCEDURE delete_employee (
        emp_id     IN employee.employee_id%type
    );
END p_employees;
/

commit;

    -- Step 2: make a package body
CREATE OR REPLACE PACKAGE BODY p_employees AS
    PROCEDURE add_employee(
        emp_id      IN employee.employee_id%type,
        f_name      IN employee.first_name%type,
        l_name      IN employee.last_name%type,
        sal         IN employee.salary%type,
        l_mod       IN employee.last_modified%type,
        dob         IN employee.dob%type,
        j_id        IN employee.job_id%type,
        d_no        IN employee.department_no%type
    )
    IS
BEGIN
INSERT INTO employee
(employee_id, first_name, last_name, salary, last_modified, dob, job_id, department_no)
VALUES (emp_id, f_name, l_name, sal, l_mod, dob, j_id, d_no);
COMMIT;
END add_employee;

    PROCEDURE update_employee (
        emp_id     IN  employee.employee_id%type,
        f_name     IN  employee.first_name%type,
        l_name     IN  employee.last_name%type
    ) IS
BEGIN
UPDATE employee
SET first_name = f_name, last_name = l_name
WHERE employee_id = emp_id;
COMMIT;
END update_employee;

    PROCEDURE delete_employee (
        emp_id     IN employee.employee_id%type
    ) IS
BEGIN
DELETE FROM employee WHERE employee_id = emp_id;
COMMIT;
END delete_employee;
END p_employees;
/

commit;
