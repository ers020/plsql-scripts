/*
    Relational operators compare two expressions or values and return a Boolean result.

    The following code will print out:

    10 > 2 is TRUE
    10 < 2 is FALSE
    10 = 2 is FALSE
    10 != 2 is TRUE
 */
DECLARE
    a number := 10;
    b number := 2;
    -- can use > or >= depending on how you wish to approach the logic
    greater boolean := (a > b);
    -- can use < or <= depending on how you wish to approach the logic
    lesser boolean := (a < b);
    equals boolean := (a = b);
    -- can be written as !=, <>, or ~=
    not_equal boolean := (a <> b);
    greater_str varchar2(10);
    lesser_str varchar2(10);
    equal_str varchar2(10);
    not_equal_str varchar2(10);
BEGIN
    IF greater THEN
        greater_str := 'TRUE';
ELSE
        greater_str := 'FALSE';
END IF;
    IF lesser THEN
        lesser_str := 'TRUE';
ELSE
        lesser_str := 'FALSE';
END IF;
    IF equals THEN
        equal_str := 'TRUE';
ELSE
        equal_str := 'FALSE';
END IF;

    IF not_equal THEN
        not_equal_str := 'TRUE';
ELSE
        not_equal_str := 'FALSE';
END IF;

    dbms_output.put_line(a || ' > ' || b || ' is ' || greater_str);
    dbms_output.put_line(a || ' < ' || b || ' is ' || lesser_str);
    dbms_output.put_line(a || ' = ' || b || ' is ' || equal_str);
    dbms_output.put_line(a || ' != ' || b || ' is ' || not_equal_str);
END;
/
