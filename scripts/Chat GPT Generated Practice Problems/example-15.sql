/*

    Write a PL/SQL function that returns the number of employees in a given department.
    Use this function in a SELECT statement to retrieve department-wise employee counts.


*/

CREATE OR REPLACE FUNCTION get_dep_count (
    department_id IN NUMBER
) RETURN NUMBER
    IS emp_count number;
BEGIN
SELECT COUNT(*) INTO emp_count FROM employee WHERE department_no = department_id;
RETURN emp_count;
EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/
