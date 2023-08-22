DECLARE
/*
    SUBTYPE is a usernamed subset of another data type.
    This allows us to create and use as we would a normal TYPE
    of the PL/SQL language.

    This allows developers to still perform the same valid operations
    as it's base type, but only a subset of it's valid values.
*/
SUBTYPE name IS char(20);
   SUBTYPE message IS varchar2(100);
   salutation name;
   greetings message;
BEGIN
   salutation := 'Reader ';
   greetings := 'Welcome to the World of PL/SQL';
   dbms_output.put_line('Hello ' || salutation || greetings);
END;
/
