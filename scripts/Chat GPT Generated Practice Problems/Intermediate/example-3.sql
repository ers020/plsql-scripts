/*

    Create a PL/SQL procedure that accepts an employee ID as input and
    updates their salary by a specified percentage.

*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE update_salary_by_percentage (
    emp_id in NUMBER,
    salary_percent in NUMBER
) IS
BEGIN
UPDATE employee
SET salary = salary * (1 + salary_percent / 100)
WHERE employee_id = emp_id;
COMMIT;
EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
