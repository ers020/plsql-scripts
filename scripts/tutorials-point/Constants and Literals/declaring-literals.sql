/*
    A literal is an explicit numeric, character, string, or Boolean value not represented by an identifier.
    For example, TRUE, 786, NULL, 'tutorialspoint' are all literals of type Boolean, number, or string.
    PL/SQL, literals are case-sensitive. PL/SQL supports the following kinds of literals −

        - Numeric Literals
        - Character Literals
        - String Literals
        - BOOLEAN Literals
        - Date and Time Literals
*/
-- literal example
DECLARE
    -- to put an apostrophe into the string, you'll just need to place two apostrophes together
    message  varchar2(30):= 'That''s tutorialspoint.com!';
BEGIN
    dbms_output.put_line(message);
END;
/
