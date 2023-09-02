/*

    Create a PL/SQL package that contains a procedure to calculate the total
    salary for a specific department, given the department_id as input.


*/

-- Step 1 make a department table : weird make to play with the summing.
SET SERVEROUTPUT ON;

CREATE TABLE DEPARTMENT (
                            NAME VARCHAR2(1000) PRIMARY KEY,
                            DEPARTMENT_ID NUMBER,
                            BUDGET NUMBER
);

INSERT INTO DEPARTMENT VALUES ('Dep 1', 1, 4500);
INSERT INTO DEPARTMENT VALUES ('Dep 1A', 1, 4750);
INSERT INTO DEPARTMENT VALUES ('Dep 2', 2, 4500);
INSERT INTO DEPARTMENT VALUES ('Dep 2A', 2, 4400);
INSERT INTO DEPARTMENT VALUES ('Dep 3', 3, 4493);
INSERT INTO DEPARTMENT VALUES ('Dep 4', 4, 7410);


commit;

-- Step 2 make PL/SQL package and package body.

CREATE OR REPLACE PACKAGE d_package AS
    PROCEDURE sumDepartment( dep_id IN NUMBER );

END d_package;
/

CREATE OR REPLACE PACKAGE BODY d_package AS
    PROCEDURE sumDepartment( dep_id IN NUMBER )
    IS
        total_sal number := 0;
    BEGIN
        SELECT SUM(budget)
        INTO total_sal
        FROM DEPARTMENT where DEPARTMENT_ID = dep_id;
        dbms_output.put_line('Total Salary for Department ' || dep_id || ' is ' || total_sal);
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Department not found.');
    END sumDepartment;
END d_package;
/

COMMIT;

-- Step 3: Call the procedure

BEGIN
  d_package.sumDepartment(1);
END;
