/*
    Create a PL/SQL block that inserts a new department record
    into the departments table. Handle exceptions related to
    duplicate department IDs and display an appropriate message.

    Extra Credit - Make a Package and Package Body
*/

 -- Step One: make the table

create table departments (
                             department_id number primary key,
                             message varchar2(1000)
);


insert into departments values (1, 'derp');

commit;



 -- Step Two: create PL/SQL block

CREATE OR REPLACE PACKAGE dep_package AS

    PROCEDURE addDepartmentInfo(
        dep_id       departments.department_id%type,
        dep_message  departments.message%type
    );

    PROCEDURE delDepartmentInfo(
        dep_id       departments.department_id%type
    );
END dep_package;
/

CREATE OR REPLACE PACKAGE BODY dep_package AS
    PROCEDURE addDepartmentInfo(
        dep_id       departments.department_id%type,
        dep_message  departments.message%type
    )
    IS
BEGIN
INSERT INTO departments VALUES (dep_id, dep_message);
COMMIT;
EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
            dbms_output.put_line('Cannot Insert. Primary key of ' || dep_id || ' already exists.');
WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
END addDepartmentInfo;

    PROCEDURE delDepartmentInfo(
        dep_id       departments.department_id%type
    )
IS
BEGIN
DELETE FROM departments
WHERE department_id = dep_id;
END delDepartmentInfo;

END dep_package;
/


commit;

 -- Step Three - run the following and get the printout.
DECLARE
BEGIN
    dep_package.addDepartmentInfo(1, 'herp');
    dep_package.addDepartmentInfo(2, 'herp');
END;
/
