/*
    Logic Operators supported by PL/SQL are
        - and
        - or
        - not
    We will reuse some old code to incorporate the logical operators

    The following code will printout:

    TRUE AND TRUE is True
    FALSE OR TRUE is True
    NOT(FALSE AND FALSE) is True
 */
DECLARE
    a number := 10;
    b number := 2;
    greater boolean := (a > b);
    lesser boolean := (a < b);
    equal boolean := (a = b);
    not_equal boolean := (a <> b);
    greater_str varchar2(10);
    lesser_str varchar2(10);
    equal_str varchar2(10);
    not_equal_str varchar2(10);
    g_and_ne boolean := greater AND not_equal;
    l_or_ne boolean := lesser OR not_equal;
    l_not_ne boolean := NOT (lesser AND equal);
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
    IF equal THEN
            equal_str := 'TRUE';
    ELSE
            equal_str := 'FALSE';
    END IF;

    IF not_equal THEN
            not_equal_str := 'TRUE';
    ELSE
            not_equal_str := 'FALSE';
    END IF;

   /*
        dbms_output.put_line(a || ' > ' || b || ' is ' || greater_str);
        dbms_output.put_line(a || ' < ' || b || ' is ' || lesser_str);
        dbms_output.put_line(a || ' = ' || b || ' is ' || equal_str);
        dbms_output.put_line(a || ' != ' || b || ' is ' || not_equal_str);
    */
    IF g_and_ne THEN
            dbms_output.put_line(greater_str || ' AND ' || not_equal_str || ' is True ');
    ELSE
            dbms_output.put_line(greater_str || ' AND ' || not_equal_str || ' is False ');
    END IF;

    IF l_or_ne THEN
            dbms_output.put_line(lesser_str || ' OR ' || not_equal_str || ' is True ');
    ELSE
            dbms_output.put_line(lesser_str || ' OR ' || not_equal_str || ' is False ');
    END IF;

    IF l_not_ne THEN
            dbms_output.put_line('NOT(' || lesser_str || ' AND ' || equal_str || ') is True ');
    ELSE
            dbms_output.put_line('NOT(' || lesser_str || ' AND ' || equal_str || ') is False ');

    END IF;

END;
/
