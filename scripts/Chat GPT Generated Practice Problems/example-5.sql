/*

    Create a trigger that automatically updates the "last_modified" column of
    an employee whenever their salary is updated.

*/

-- Step 1: add column to table
ALTER TABLE employee
    ADD last_modified TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL;

-- Step 2: create trigger

CREATE OR REPLACE TRIGGER update_last_modified
    BEFORE UPDATE OF salary ON employee
    FOR EACH ROW
BEGIN
    :new.last_modified := SYSTIMESTAMP;
END;
/

commit;

-- Step 3 run a test
UPDATE EMPLOYEE SET SALARY = 3000.00 WHERE EMPLOYEE_ID = 1;

COMMIT;
