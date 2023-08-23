/*

    Basic loop structure encloses sequence of statements in between the LOOP and END LOOP statements.
    With each iteration, the sequence of statements is executed and then control resumes at the top of the loop.

    The following code will printout:
    10
    20
    30
    40
    50
    After Exit x is: 60

 */

DECLARE
    x number := 10;
BEGIN
    LOOP
        dbms_output.put_line(x);
        x := x + 10;
        IF x > 50 THEN
            exit;
        END IF;
    END LOOP;
   -- after exit, control resumes here
   dbms_output.put_line('After Exit x is: ' || x);
END;
/
