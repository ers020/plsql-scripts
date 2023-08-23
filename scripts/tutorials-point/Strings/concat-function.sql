/*
    In Oracle PL/SQL, the CONCAT function is used to concatenate two strings together.

    The following code will printout:
    Hello, world!
*/

DECLARE
    string1 varchar2(20) := 'Hello, ';
    string2 varchar2(20) := 'world!';
    result varchar2(40);
BEGIN
    result := CONCAT(string1, string2);
    dbms_output.put_line('Concatenated result: ' || result);
END;
/
