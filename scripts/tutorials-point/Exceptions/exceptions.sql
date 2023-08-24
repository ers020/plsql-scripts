/*

    An exception is an error condition during a program execution. PL/SQL supports programmers
    to catch such conditions using EXCEPTION block in the program and an appropriate action is
    taken against the error condition.

    There are two types of exceptions:
        System-defined exceptions
        User-defined exceptions

    The following code will printout:
    No such customer!

*/
DECLARE
    c_id customers.id%type := 8;
    c_name customerS.Name%type;
    c_addr customers.address%type;
BEGIN
    SELECT  name, address INTO  c_name, c_addr
    FROM customers
    WHERE id = c_id;
    DBMS_OUTPUT.PUT_LINE ('Name: '||  c_name);
    DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No such customer!');
    WHEN others THEN
        dbms_output.put_line('Error!');
END;
/
