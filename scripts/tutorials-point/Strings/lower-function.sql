/*
    The LOWER function in PL/SQL is used to convert a string into lowercase characters.

    The following code will printout:
    Original string: Hello World
    Lowercase string: hello world

*/

DECLARE
    original_string VARCHAR2(100) := 'Hello World';
    lowercase_string VARCHAR2(100);
BEGIN
    lowercase_string := LOWER(original_string);
    DBMS_OUTPUT.PUT_LINE('Original string: ' || original_string);
    DBMS_OUTPUT.PUT_LINE('Lowercase string: ' || lowercase_string);
END;
/
