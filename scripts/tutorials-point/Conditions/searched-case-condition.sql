/*
 The searched CASE statement has no selector and the WHEN clauses of the statement contain
 search conditions that give Boolean values.

 The following code will print out:

 Very Good
 */
DECLARE
    grade char(1) := 'B';
BEGIN
    case
        when grade = 'A' then dbms_output.put_line('Excellent');
        when grade = 'B' then dbms_output.put_line('Very good');
        when grade = 'C' then dbms_output.put_line('Well done');
        when grade = 'D' then dbms_output.put_line('You passed');
        when grade = 'F' then dbms_output.put_line('Better try again');
        else dbms_output.put_line('No such grade');
    end case;
END;
