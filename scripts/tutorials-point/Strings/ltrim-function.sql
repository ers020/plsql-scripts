/*
    The LTRIM function in PL/SQL is used to remove leading (left-side) characters from
    a string. The optional trim_string parameter allows you to specify the characters
    you want to remove from the beginning of the string; if not provided, spaces are
    trimmed by default.

    You can also use the trim_string parameter to specify a custom set of characters you want to remove.

    The following code block, Example 1, will printout:
    Original string: "   Hello, World!"
    Trimmed string: "Hello, World!"

    The following code block, Example 2, will printout:
    Original string: "---Hello---"
    Trimmed string: "Hello---"

*/

-- Example 1
DECLARE
    original_string VARCHAR2(20) := '   Hello, World!';
    trimmed_string VARCHAR2(20);
BEGIN
    trimmed_string := LTRIM(original_string);
    DBMS_OUTPUT.PUT_LINE('Original string: "' || original_string || '"');
    DBMS_OUTPUT.PUT_LINE('Trimmed string: "' || trimmed_string || '"');
END;
/


-- Example 2
DECLARE
    original_string VARCHAR2(20) := '---Hello---';
    trimmed_string VARCHAR2(20);
BEGIN
    trimmed_string := LTRIM(original_string, '-');
    DBMS_OUTPUT.PUT_LINE('Original string: "' || original_string || '"');
    DBMS_OUTPUT.PUT_LINE('Trimmed string: "' || trimmed_string || '"');
END;
/
