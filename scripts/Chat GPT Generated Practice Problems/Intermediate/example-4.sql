/*

    Write a PL/SQL block to find the average salary of employees in a department.

*/

SET SERVEROUTPUT ON;

DECLARE
    dep_id number := 1;
    average number := 0;
    dep_sum number := 0;
    dep_count number := 0;
BEGIN
    SELECT COUNT(*), SUM(salary) INTO dep_count, dep_sum FROM employee where department_no = dep_id;
    IF dep_count > 0 AND dep_sum > 0 THEN
        average := dep_sum / dep_count;
        dbms_output.put_line('The average salary for department ' || dep_id || ' is ' || average ||'.');
    ELSE
        dbms_output.put_line('Department not found.');
    END IF;
END;
/

