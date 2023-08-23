/*

    The string in PL/SQL is actually a sequence of characters with an optional size specification.
    The characters could be numeric, letters, blank, special characters or a combination of all.
    PL/SQL offers three kinds of strings −

    Fixed-length strings − In such strings, programmers specify the length while declaring the string.
    The string is right-padded with spaces to the length so specified.

    Variable-length strings − In such strings, a maximum length up to 32,767, for the string
    is specified and no padding takes place.

    Character large objects (CLOBs) − These are variable-length strings that can be up to 128 terabytes.

    Stirng Examples:

    The following code will printout:
    Sven Svenson
    Drama Inc.
    Hello! I'm Sven Svenson from Drama Inc.

*/

DECLARE
    name varchar2(20);
    company varchar2(30);
    introduction clob;
    choice char(1);
BEGIN
    name := 'Sven Svenson';
    company := 'Drama Inc.';
    introduction := 'Hello! I''m ' || name || ' from ' || company;
    choice := 'y';
    IF choice = 'y' THEN
        dbms_output.put_line(name);
        dbms_output.put_line(company);
        dbms_output.put_line(introduction);
    END IF;
END;
/
