/*

    Create a PL/SQL block that uses a cursor to fetch the department names
    and locations of all departments and displays them using a loop.

*/

-- using table from previous creation. No location so using message


SET SERVEROUTPUT ON;

DECLARE
d_id departments.department_id%type;
    d_msg departments.message%type;
CURSOR d_departments is
SELECT department_id, message FROM departments;
BEGIN
OPEN d_departments;
LOOP
FETCH d_departments INTO d_id, d_msg;
        EXIT WHEN  d_departments%notfound;
            dbms_output.put_line(d_id || ' ' || d_msg);
END LOOP;
CLOSE d_departments;
END;
/

