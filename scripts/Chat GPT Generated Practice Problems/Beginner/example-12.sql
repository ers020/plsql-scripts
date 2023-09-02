/*

Create a trigger that prevents the deletion of a department if it contains employees.
Display an error message if a delete operation is attempted on such departments.

*/

 -- Step 1: create table
alter table employee
    add department_no number;

update employee
set department_no = 1;

commit;


 -- Step 2: create trigger

CREATE OR REPLACE TRIGGER delete_stop_gap
    BEFORE DELETE ON department_tbl
    FOR EACH ROW
    DECLARE
    v_has_employee number;
BEGIN
    SELECT count(*) INTO v_has_employee FROM employee WHERE department_no = :OLD.department_id;
    IF v_has_employee > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Cannot delete department with active employees');
    END IF;
END;
/

delete from department_tbl where department_id = 1;
