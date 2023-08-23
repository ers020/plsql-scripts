/*
    The LENGTHB function is used to calculate the number of bytes in a given string expression.
    It's particularly useful when dealing with multi-byte character sets like UTF-8.

    The following code will printout:
    Number of bytes in the string: 33

*/
DECLARE
    input_string VARCHAR2(100) := 'Hello, 你好, नमस्ते';
    bytes_count NUMBER;
BEGIN
    bytes_count := LENGTHB(input_string);
    DBMS_OUTPUT.PUT_LINE('Number of bytes in the string: ' || bytes_count);
END;
/
