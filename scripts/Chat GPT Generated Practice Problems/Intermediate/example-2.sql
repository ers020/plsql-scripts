/*

    Write a PL/SQL block to find the largest element in an array.

*/

SET SERVEROUTPUT ON;

DECLARE
    TYPE num_array IS TABLE OF NUMBER;
    nums num_array := num_array(5, 10, 1, 12, 55, 2, 5, 2, 1);
    large number := 0;
BEGIN
    FOR i IN 2..nums.COUNT LOOP
        IF nums(i) > large THEN
        large := nums(i);
        END IF;
        END LOOP;
    dbms_output.put_line('The largest number is '|| large);
END;
/
