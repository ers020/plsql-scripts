/*
    Returns the ASCII value of the character x.

    The following code will printout:
    The ASCII value of A is 65
*/

DECLARE
    character_var char(1) := 'A';
    ascii_value number;
BEGIN
    ascii_value := ASCII(character_var);
    dbms_output.put_line('The ASCII value of ' || character_var || ' is ' || ascii_value);
END;
/
