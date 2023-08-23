/*
    It is always legal in PL/SQL programming to nest the IF-ELSE statements,
    which means you can use one IF or ELSE IF statement inside another IF or ELSE IF statement(s).

    The following code will print out:

    Value of a is 100 and b is 200
    Exact value of a is : 100
    Exact value of b is : 200

*/

DECLARE
    a number(3) := 100;
    b number(3) := 200;
BEGIN
    -- check the boolean condition
    IF( a = 100 ) THEN
    -- if condition is true then check the following
        IF( b = 200 ) THEN
            -- if condition is true then print the following
            dbms_output.put_line('Value of a is 100 and b is 200' );
        END IF;
    END IF;
    dbms_output.put_line('Exact value of a is : ' || a );
    dbms_output.put_line('Exact value of b is : ' || b );
END;
/
