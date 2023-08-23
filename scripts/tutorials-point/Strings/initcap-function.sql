/*
    In Oracle PL/SQL, the INITCAP function is used to capitalize the first letter
    of each word in a string and convert the rest of the letters to lowercase.

    The following code will printout:
    Original string: hello world! how are you?
    Capitalized string: Hello World! How Are You?
*/

DECLARE
    original_string varchar2(50) := 'hello world! how are you?';
    capitalized_string varchar2(50);
BEGIN
    capitalized_string := INITCAP(original_string);
    dbms_output.put_line('Original string: ' || original_string);
    dbms_output.put_line('Capitalized string: ' || capitalized_string);
END;
/
