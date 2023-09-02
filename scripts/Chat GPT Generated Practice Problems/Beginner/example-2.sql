/*
    Create a PL/SQL function that takes an employee_id as input and
    returns the full name (first name and last name) of the employee.

*/


CREATE OR REPLACE FUNCTION customerName(id IN number)
RETURN varchar IS
    employee_name varchar(2000) := '';
BEGIN
SELECT CONCAT(first_name || ' ', last_name) INTO employee_name
FROM employee WHERE employee_id = id;

RETURN employee_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Employee not found';
END;
/

commit;

SELECT customerName(1) FROM dual;
