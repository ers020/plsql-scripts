/*
    Returns the character with the ASCII value of x.

    The following code will printout:
    The character corresponding to ASCII value 65 is A

*/

DECLARE
    ascii_value number := 65;
    character_var char(1);
BEGIN
    character_var := CHR(ascii_value);
    dbms_output.put_line('The character corresponding to ASCII value ' || ascii_value || ' is ' || character_var);
END;
/
