/*
    PL/SQL does allow nested blockes (
    i.e.
        DECLARE
        x number:= 1;
        BEGIN
            DECLARE
                y number:= 2;
            BEGIN
            END
        END
    )

    This does variables a scope of usability.
        - x is in the outer-most portion of the blocks, so it can be used throughout the PL/SQL statement
        - y is in the inner-most and cannot be used in the outer-block
 */
DECLARE
-- Global variables
    num1 number := 95;
    num2 number := 85;
BEGIN
    -- the printouts will match the global variable values
    dbms_output.put_line('Outer Variable num1: ' || num1);
    dbms_output.put_line('Outer Variable num2: ' || num2);
        DECLARE
            -- Local variables
            num1 number := 195;
            num2 number := 185;
        BEGIN
            -- the printouts will match the local variable values
            dbms_output.put_line('Inner Variable num1: ' || num1);
            dbms_output.put_line('Inner Variable num2: ' || num2);
        END;
    -- the print outs will once again match the global variable values
    dbms_output.put_line('Outer Variable num1: ' || num1);
    dbms_output.put_line('Outer Variable num2: ' || num2);
END;
/
