/*

    Write a PL/SQL block that takes a department_id as input and
    uses dynamic SQL to retrieve the department name and location
    using EXECUTE IMMEDIATE.

*/

-- Step 1: Update department table
ALTER TABLE department
ADD COLUMN location varchar(200);

UPDATE department
SET location = 'Here';

commit;


-- Step 2: Create PL/SQL Block
DECLARE
    dep_id number := 1;
    Type DepCurType IS REF CURSOR;
    dep_cur DepCurType;
    dep_ref department%ROWTYPE;
    sql_stmt varchar2(1000);
BEGIN
    sql_stmt := 'SELECT * FROM department where department_id = :dep_id';
    OPEN dep_cur FOR sql_stmt USING dep_id;
    LOOP
        FETCH dep_cur INTO dep_ref;
        EXIT WHEN dep_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Department: ' || dep_ref.name || ', Location: ' || dep_ref.location);
    END LOOP;
    CLOSE dep_cur;
END;
/

 -- alternative way
DECLARE
    dep_id number := 1;
    dep_name department.name%TYPE;
    dep_location department.location%TYPE;
    sql_stmt varchar2(1000);
BEGIN
    sql_stmt := 'SELECT name, location FROM department where department_id = :id  OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY';
    DBMS_OUTPUT.PUT_LINE('SQL STMT: ' || sql_stmt);
    DBMS_OUTPUT.PUT_LINE('dep Id: ' || dep_id);
EXECUTE IMMEDIATE sql_stmt into dep_name, dep_location USING dep_id;

DBMS_OUTPUT.PUT_LINE('Department: ' || dep_name || ', Location: ' || dep_location);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Department not found');
END;
/
