/*
    The INSTRB function in Oracle PL/SQL is used to find the byte position of a substring within a string.
    This function is used when dealing with multibyte character sets, where a single character can take up
    more than one byte of storage.

    The following code will printout:
    Byte position of "??" in the string: 10
*/
DECLARE
    main_string varchar2(50) := '你好，世界！Hello, world!';
    find_string varchar2(10) := '世界';
    position number;
BEGIN
    position := INSTRB(main_string, find_string);
    dbms_output.put_line('Byte position of "' || find_string || '" in the string: ' || position);
END;
/
