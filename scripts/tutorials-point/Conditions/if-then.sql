/*
    Pretty standard, IF-THEN-ELSIF. Found in a lot of languages.
    This will allow for multiple scenarios to occur in the IF... ELSE block

    The following printout is:
    a now is 20
*/


DECLARE
    a number := 20;
BEGIN
    IF a < 20 THEN
    a := a + 20;
    END IF;

    dbms_output.put_line('a now is ' || a);

END;
/
