/*
    In Oracle PL/SQL, the LENGTH function is used to determine the length of a
    string in terms of the number of characters it contains.

    The following code will printout:

    Length of string1: 13
    Length of string2: 6
*/

DECLARE
    string1 varchar2(50) := 'Hello, world!';
    string2 varchar2(50) := '你好，世界！';
    length1 number;
    length2 number;
BEGIN
    length1 := LENGTH(string1);
    length2 := LENGTH(string2);
    dbms_output.put_line('Length of string1: ' || length1);
    dbms_output.put_line('Length of string2: ' || length2);
END;
/
