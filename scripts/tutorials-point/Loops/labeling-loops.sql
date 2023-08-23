/*
    PL/SQL loops can be labeled. The label should be enclosed by double angle brackets (<< and >>)
    and appear at the beginning of the LOOP statement. The label name can also appear at the end of
    the LOOP statement. You may use the label in the EXIT statement to exit from the loop.

    The following code will printout:
    i is: 1 and j is: 1
    i is: 1 and j is: 2
    i is: 1 and j is: 3
    i is: 2 and j is: 1
    i is: 2 and j is: 2
    i is: 2 and j is: 3
    i is: 3 and j is: 1
    i is: 3 and j is: 2
    i is: 3 and j is: 3

*/
DECLARE
    i number(1);
    j number(1);
BEGIN
    << outer_loop >>
    FOR i IN 1..3 LOOP
        << inner_loop >>
        FOR j IN 1..3 LOOP
            dbms_output.put_line('i is: '|| i || ' and j is: ' || j);
        END loop inner_loop;
    END loop outer_loop;
END;
/
