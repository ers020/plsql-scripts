/*
    In Oracle PL/SQL, the INSTR function is used to find the position of a substring within a string.

    The following code will printout:
    Position of "how" in the string: 8

*/
DECLARE
    main_string varchar2(50) := 'Hello, how are you? How are things?';
    find_string varchar2(10) := 'how';
    position number;
BEGIN
    position := INSTR(main_string, find_string);
    dbms_output.put_line('Position of "' || find_string || '" in the string: ' || position);
END;
/
