/*
    The EXIT-WHEN statement allows the condition in the WHEN clause to be evaluated.
    If the condition is true, the loop completes and control passes to the statement
    immediately after the END LOOP.

    Following are the two important aspects for the EXIT WHEN statement −

        Until the condition is true, the EXIT-WHEN statement acts like a NULL statement,
        except for evaluating the condition, and does not terminate the loop.

        A statement inside the loop must change the value of the condition.

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
        -- terminate the loop using the exit when statement
    EXIT WHEN a > 15;
    END LOOP;
END;
/
