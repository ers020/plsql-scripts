/*
    The LPAD function in PL/SQL is used to left-pad a string with a specified character
    or a space to reach a desired width. The optional pad_string parameter allows you to
    specify the character to use for padding; if not provided, spaces are used by default.

    The following code will printout:
    Original string: 123
    Padded string: 0000000123
*/

DECLARE
    original_string VARCHAR2(20) := '123';
    padded_string VARCHAR2(20);
BEGIN
    padded_string := LPAD(original_string, 10, '0');
    DBMS_OUTPUT.PUT_LINE('Original string: ' || original_string);
    DBMS_OUTPUT.PUT_LINE('Padded string: ' || padded_string);
END;
/
