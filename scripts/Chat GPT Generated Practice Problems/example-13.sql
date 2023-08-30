/*

    Write a PL/SQL block that calculates the average salary of employees in a department.
    Use nested blocks to handle exceptions and display appropriate messages.

    - Need to get the count and sum of the salaries for a department
    - Capture the values
    -       Should handle if there are no return results
*/

DECLARE
d_count number :=0;
    d_sum number := 0;
    d_total number := 0;
    d_id number := 2;
BEGIN
SELECT COUNT(*), SUM(salary) INTO d_count, d_sum FROM employee where department_no = d_id;
IF d_count > 0 AND d_sum > 0 THEN
        d_total := d_sum / d_count;
        DBMS_OUTPUT.PUT_LINE('The average salary is: '|| (d_sum / d_count));
ELSE
        DBMS_OUTPUT.PUT_LINE('Department not found.');
END IF;
END;
/
