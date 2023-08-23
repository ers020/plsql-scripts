/*
    A FOR LOOP is a repetition control structure that allows you to efficiently write
    a loop that needs to execute a specific number of times.

    The following code will printout:
    value of a: 10
    value of a: 11
    value of a: 12
    value of a: 13
    value of a: 14
    value of a: 15
    value of a: 16
    value of a: 17
    value of a: 18
    value of a: 19
    value of a: 20
*/
DECLARE
    a number(2);
BEGIN
    FOR a in 10 .. 20 LOOP
          dbms_output.put_line('value of a: ' || a);
    END LOOP;
END;
/
