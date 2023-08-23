/*

    A GOTO statement in PL/SQL programming language provides an unconditional jump from the GOTO
    to a labeled statement in the same subprogram.

    NOTE − The use of GOTO statement is not recommended in any programming language because it makes it
    difficult to trace the control flow of a program, making the program hard to understand and hard to modify.
    Any program that uses a GOTO can be rewritten so that it doesn't need the GOTO.

    The following code will printout:
    value of a: 10
    value of a: 11
    value of a: 12
    value of a: 13
    value of a: 14
    value of a: 16
    value of a: 17
    value of a: 18
    value of a: 19

*/

DECLARE
    a number(2) := 10;
BEGIN
    <<loopstart>>
    -- while loop execution
    WHILE a < 20 LOOP
        dbms_output.put_line ('value of a: ' || a);
        a := a + 1;
        IF a = 15 THEN
            a := a + 1;
        GOTO loopstart;
        END IF;
    END LOOP;
END;
/
