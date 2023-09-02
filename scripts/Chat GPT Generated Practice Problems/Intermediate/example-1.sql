/*

    Create a PL/SQL block that calculates the factorial of a given number.

*/

SET SERVEROUTPUT ON;

DECLARE
num number :=5;
    factoral number :=1;
BEGIN
FOR i IN REVERSE 1..num LOOP
    factoral := factoral * i;
END LOOP;
    dbms_output.put_line('factoral of ' || num || ' is ' || factoral);
END;
/
