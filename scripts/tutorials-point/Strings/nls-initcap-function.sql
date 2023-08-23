/*
    The NLS_INITCAP function in PL/SQL is used to capitalize the first letter
    of each word in a string, based on the rules of the specified language and
    territory settings.

    The following code is printout:
    Input string: hello world
    Initcap string: Hello World
*/

DECLARE
    input_string VARCHAR2(100) := 'hello world';
    initcap_string VARCHAR2(100);
BEGIN
    initcap_string := NLS_INITCAP(input_string);
    DBMS_OUTPUT.PUT_LINE('Input string: ' || input_string);
    DBMS_OUTPUT.PUT_LINE('Initcap string: ' || initcap_string);
END;
/
