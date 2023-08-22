/*
 Comparison operators are used for comparing one expression to another. The result is always either TRUE, FALSE or NULL.

 The following code will print out:
        Zuul Air LIKE Z% A_r is TRUE
        10 BETWEEN 5 AND 20 is TRUE
        10 IN (7, 8, 9) is TRUE
        10 IS NULL is FALSE
 */
DECLARE
    a varchar2(10) := 'Zuul Air';
    b varchar2(10) := 'Z% A_r';
    c boolean := a LIKE b;
    c_str varchar2(10);

    x number := 10;
    btwn_str varchar2(10);
    in_str varchar2(10);
    null_str varchar2(10);
BEGIN
    IF c THEN
            c_str := 'TRUE';
    ELSE
            c_str := 'FALSE';
    END IF;

    IF x BETWEEN 5 AND 10 THEN
            btwn_str := 'TRUE';
    ELSE
            btwn_str := 'FALSE';
    END IF;

    IF x IN(7, 8, 9) THEN
            in_str := 'TRUE';
    ELSE
            in_str := 'FALSE';
    END IF;

    IF x IS NULL THEN
            null_str := 'TRUE';
    ELSE
            null_str := 'FALSE';
    END IF;

    dbms_output.put_line(a || ' LIKE ' || b || ' is ' || c_str);
    dbms_output.put_line(x || ' BETWEEN 5 AND 20 is ' || btwn_str);
    dbms_output.put_line(x || ' IN (7, 8, 9) is ' || btwn_str);
    dbms_output.put_line(x || ' IS NULL is ' || null_str);

END;
/
