/*

    Write a PL/SQL block that takes a department_id as input and uses dynamic
    SQL to retrieve the department name and location using EXECUTE IMMEDIATE.

*/

-- Step 1: update table

alter table  employee
    add job_id varchar(100);

commit;

-- Step 2: make PL/SQL block
DECLARE
    TYPE SalaryList IS TABLE OF number;
    emp_ids SalaryList := SalaryList(1, 2);
BEGIN
    -- create temp table
    EXECUTE IMMEDIATE 'CREATE GLOBAL TEMPORARY TABLE temp_emp_ids (employee_id NUMBER) ON COMMIT DELETE ROWS';
    -- insert the ids
    FOR i IN 1..emp_ids.COUNT LOOP
        EXECUTE IMMEDIATE 'INSERT INTO temp_emp_ids (employee_id) VALUES (:id)' USING emp_ids(i);
    END LOOP;
    -- use the temp table in the query
    EXECUTE IMMEDIATE 'UPDATE employees set job_id =''MANAGER'' where employee_id IN (SELECT employee_id FROM temp_emp_ids)';
    -- drop the temp table
    EXECUTE IMMEDIATE 'DROP TABLE temp_emp_ids';
    COMMIT;
END;
/

select * from employee;
