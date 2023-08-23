/*

    The EXIT statement in PL/SQL programming language has the following two usages −

        When the EXIT statement is encountered inside a loop, the loop is immediately
        terminated and the program control resumes at the next statement following the loop.

        If you are using nested loops (i.e., one loop inside another loop), the EXIT statement
        will stop the execution of the innermost loop and start executing the next line of code
        after the block.

    The following code will printout:
    value of a: 10
    value of a: 11
    value of a: 12
    value of a: 13
    value of a: 14
    value of a: 15

*/

DECLARE
    a number(2) := 10;
BEGIN
    -- while loop execution
    WHILE a < 20 LOOP
        dbms_output.put_line ('value of a: ' || a);
        a := a + 1;
        IF a > 15 THEN
            -- terminate the loop using the exit statement
            EXIT;
        END IF;
    END LOOP;
END;
/
