/*

    Create a PL/SQL function that calculates and returns the age of an employee (based on the birthdate)
    when given the employee_id as input.

*/

-- Step 1 Update the table
ALTER TABLE employee
    ADD dob DATE;

UPDATE employee
SET dob = TO_DATE('1986-10-23', 'yyyy-mm-dd') where employee_id = 1;

commit;

-- Step 2 Function
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION age_calc
    ( emp_id IN number)
RETURN number IS
    age number;
    birthdate DATE;
BEGIN
SELECT dob INTO birthdate FROM employee WHERE employee_id = emp_id;
age := FLOOR(MONTHS_BETWEEN(SYSDATE, birthdate) / 12);
return age;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        return null;
END;
/

commit;

 -- Step 3: Call it
DECLARE
    c number;
BEGIN
    c := age_calc(1);
    dbms_output.put_line('Age of employee: ' || c);
END;
/

