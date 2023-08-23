/*
    A WHILE LOOP statement in PL/SQL programming language repeatedly executes a target statement as long as a
    given condition is true.

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
*/


DECLARE
    a number(2) := 10;
BEGIN
   WHILE a < 20 LOOP
      dbms_output.put_line('value of a: ' || a);
      a := a + 1;
    END LOOP;
END;
/
