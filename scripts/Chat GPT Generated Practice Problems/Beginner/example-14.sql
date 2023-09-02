/*

    Create a PL/SQL procedure that takes an array of department IDs and deletes
    all employees belonging to those departments using a PL/SQL table.

*/

CREATE OR REPLACE PROCEDURE delete_employees (
    dep_ids IN sys.odcinumberlist
)
IS
BEGIN
FOR i IN 1..dep_ids.COUNT LOOP
DELETE FROM employee where department_no = dep_ids(i);
END LOOP;
COMMIT;
EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
