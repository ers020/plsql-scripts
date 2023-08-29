/*

    Write a PL/SQL block that uses a cursor to retrieve employee details
    (employee_id, first_name, last_name) and store them in a record type.
    Display the details of all employees using the record.

*/
-- Simple enough, set it up.
SET SERVEROUTPUT ON;

DECLARE
    CURSOR emp_cur is
        select employee_id, first_name, last_name
        from employee;
    emp_rec emp_cur%rowtype;
BEGIN
    OPEN emp_cur;
    LOOP
    FETCH emp_cur into emp_rec;
    EXIT WHEN emp_cur%notfound;
        dbms_output.put_line(emp_rec.employee_id || ' ' || emp_rec.first_name || ' ' || emp_rec.last_name);
    END LOOP;
END;
/


-- alternatively
DECLARE
    CURSOR emp_cur is
        select employee_id, first_name, last_name
        from employee;
    TYPE EmployeeRecord IS RECORD (
        id employee.employee_id%type,
        f_name employee.first_name%type,
        l_name employee.last_name%type
    );
    emp_rec EmployeeRecord;
BEGIN
    OPEN emp_cur;
    LOOP
    FETCH emp_cur into emp_rec;
        EXIT WHEN emp_cur%notfound;
    dbms_output.put_line('Employee Id: '|| emp_rec.id || ' First Name: ' || emp_rec.f_name || ' Last Name: ' || emp_rec.l_name);
    END LOOP;
    CLOSE emp_cur;
END;
/
