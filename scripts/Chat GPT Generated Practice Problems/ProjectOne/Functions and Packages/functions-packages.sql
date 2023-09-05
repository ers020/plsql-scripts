/*
    Part 1:
    Create a PL/SQL function named calculate_salary that takes an employee's job_id as input
    and returns the calculated salary based on predefined salary rules. Use a package to encapsulate this function.

    Part 2:
    Create a package named employee_management that includes procedures for adding, updating, and deleting
    employee records. These procedures should perform necessary validations and error handling.

*/

-- Par 1:
-- create function
CREATE OR REPLACE FUNCTION calculate_salary (job_id IN varchar2) RETURN NUMBER IS
    salary NUMBER;
BEGIN
    CASE job_id
        WHEN 'Manager' THEN salary:= 140000;
        WHEN 'Developer' THEN salary:= 110000;
        WHEN 'Analyst' THEN salary:= 100000;
        WHEN 'Designer' THEN salary:= 90000;
        WHEN 'Engineer' THEN salary:= 85000;
        ELSE RAISE_APPLICATION_ERROR(-20001, 'Job Id is not defined');
    END CASE;
    return salary;
END;
/

--create the package it goes into

CREATE OR REPLACE PACKAGE e_sal_package AS
    FUNCTION calculate_salary (job_id IN VARCHAR2) RETURN NUMBER;
END e_sal_package;
/

CREATE OR REPLACE PACKAGE BODY e_sal_package AS
    FUNCTION calculate_salary (job_id IN varchar2) RETURN NUMBER IS
        salary NUMBER;
    BEGIN
        CASE job_id
            WHEN 'Manager' THEN salary:= 140000;
            WHEN 'Developer' THEN salary:= 110000;
            WHEN 'Analyst' THEN salary:= 100000;
            WHEN 'Designer' THEN salary:= 90000;
            WHEN 'Engineer' THEN salary:= 85000;
            ELSE RAISE_APPLICATION_ERROR(-20001, 'Job Id is not defined');
            END CASE;
        return salary;
    END calculate_salary;
end e_sal_package;
/
commit;


-- Part 2:
CREATE OR REPLACE PACKAGE e_manip_package AS
    PROCEDURE add_emp(
        f_name          IN employee.first_name%type,
        l_name          IN employee.last_name%type,
        j_id            IN employee.job_id%type,
        d_id            IN employee.department_id%type
    );

    PROCEDURE up_emp_com(
        emp_id          IN employee.employee_id%type,
        f_name          IN employee.first_name%type,
        l_name          IN employee.last_name%type,
        j_id            IN employee.job_id%type
    );

    PROCEDURE up_emp_dep(
        emp_id          IN employee.employee_id%type,
        d_id            IN employee.department_id%type
    );

    PROCEDURE del_emp (
        emp_id          IN employee.employee_id%type
    );
END e_manip_package;
/


CREATE OR REPLACE PACKAGE BODY e_manip_package AS
    PROCEDURE add_emp(
        f_name          IN employee.first_name%type,
        l_name          IN employee.last_name%type,
        j_id            IN employee.job_id%type,
        d_id            IN employee.department_id%type
    ) IS
    BEGIN
    INSERT INTO employee
        (first_name, last_name, job_id, department_id)
        VALUES (f_name, l_name, j_id, d_id);
        COMMIT;
    END add_emp;

    PROCEDURE up_emp_com(
        emp_id          IN employee.employee_id%type,
        f_name          IN employee.first_name%type,
        l_name          IN employee.last_name%type,
        j_id            IN employee.job_id%type
    ) IS
    BEGIN
    UPDATE employee
    SET first_name = f_name, last_name = l_name, job_id = j_id
    WHERE employee_id = emp_id;
    COMMIT;
    END up_emp_com;


    PROCEDURE up_emp_dep(
        emp_id          IN employee.employee_id%type,
        d_id            IN employee.department_id%type
    ) IS
    BEGIN
    UPDATE employee
    SET department_id = d_id
    WHERE employee_id = emp_id;
    COMMIT;
    END up_emp_dep;

    PROCEDURE del_emp (
        emp_id          IN employee.employee_id%type
    ) IS
    BEGIN
    DELETE FROM employee WHERE employee_id = emp_id;
    COMMIT;
    END del_emp;
END e_manip_package;
/

commit;
