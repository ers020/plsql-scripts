/*
    Each PL/SQL subprogram has a name, and may also have a parameter list. Like anonymous PL/SQL blocks,
    the named blocks will also have the following three parts:

        Declarative Part

        It is an optional part. However, the declarative part for a subprogram does not start with
        the DECLARE keyword. It contains declarations of types, cursors, constants, variables,
        exceptions, and nested subprograms. These items are local to the subprogram and cease to
        exist when the subprogram completes execution.

        Executable Part

        This is a mandatory part and contains statements that perform the designated action.

        Exception-handling

        This is again an optional part. It contains the code that handles run-time errors.

        The following code will printout:
        Hello World!
*/

CREATE OR REPLACE PROCEDURE greetings
AS
BEGIN
   dbms_output.put_line('Hello World!');
END;
/

EXECUTE greetings;

-- cleanup
DROP PROCEDURE greetings;
