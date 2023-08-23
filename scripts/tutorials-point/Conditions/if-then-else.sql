/*
    Pretty standard, IF THEN ELSE. Found in a lot of languages.

    The following printout is:
    a now is 15
*/


DECLARE
    a number := 20;
BEGIN
    IF a < 20 THEN
    a := a + 20;
ELSE
    a := a - 5;
END IF;

    dbms_output.put_line('a now is ' || a);

END;
/
