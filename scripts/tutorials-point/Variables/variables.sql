/*
    Variables can be made for PL/SQL statements. They should be:
        - Made in the declare block or within the package (if global is desired)
        - Should be declared as a letter followed optionally by more letters, numerals, dollar signs, underscores and/or number signs
        - They should NOT exceed 30 characters
        - By default names are not case-sensitive
        - They CANNOT be a reserved-word used in SQL (i.e. cannot name it integer, rowid, etc.)

    Syntax: variable_name [CONSTANT] datatype [NOT NULL] [:= | DEFAULT initial_value]
*/
DECLARE

-- original example had single letters, I changed the names
alpha integer := 10;
   beta integer := 20;
   charlie integer;
   foxtrot real;
BEGIN
    -- the following should print out 30
   charlie := alpha + beta;
   dbms_output.put_line('Value of charlie: ' || charlie);
   -- this portion will print out 23.3 repeating.
   foxtrot := 70.0/3.0;
   dbms_output.put_line('Value of foxtrot: ' || foxtrot);
END;
/
