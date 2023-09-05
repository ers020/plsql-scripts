/*

    Write a PL/SQL trigger that automatically sets the hire date for a new employee to the current date
    when a new employee record is inserted into the employees table.

    Write a trigger that prevents employees from being assigned to multiple departments simultaneously.
    It should check if an employee is already assigned to a department (based on the department_id) before
    allowing an update to the department_id in the employees table.

*/

CREATE OR REPLACE TRIGGER employee_hire_date
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
   :NEW.hire_date :=SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER employee_department
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF :OLD.department_id IS NOT NULL AND :NEW.department_id <> :OLD.department_id THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee is already assigned to a department');
END IF;
END;
/

commit;
