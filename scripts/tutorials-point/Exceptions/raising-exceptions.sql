/*

    Exceptions are raised by the database server automatically whenever there is any internal
    database error, but exceptions can be raised explicitly by the programmer by using the
    command RAISE.

    The following code will printout:
    Error starting at line : 1 in command -
    DECLARE
       exception_name EXCEPTION;
    BEGIN
       IF condition THEN
          RAISE exception_name;
       END IF;
    EXCEPTION
       WHEN exception_name THEN
       statement;
    END;
    Error report -
    ORA-06550: line 4, column 7:
    PLS-00201: identifier 'CONDITION' must be declared
    ORA-06550: line 4, column 4:
    PL/SQL: Statement ignored
    ORA-06550: line 9, column 4:
    PLS-00201: identifier 'STATEMENT' must be declared
    ORA-06550: line 9, column 4:
    PL/SQL: Statement ignored
    06550. 00000 -  "line %s, column %s:\n%s"
    *Cause:    Usually a PL/SQL compilation error.
    *Action:

*/
DECLARE
    exception_name EXCEPTION;
BEGIN
    IF condition THEN
        RAISE exception_name;
    END IF;
EXCEPTION
    WHEN exception_name THEN
    statement;
END;
/
