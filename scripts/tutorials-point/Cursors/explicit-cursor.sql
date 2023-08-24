/*

    Explicit cursors are programmer-defined cursors for gaining more control over the context area.
    An explicit cursor should be defined in the declaration section of the PL/SQL Block. It is created
    on a SELECT Statement which returns more than one row.

    Working with an explicit cursor includes the following steps:

        Declaring the cursor for initializing the memory
        Opening the cursor for allocating the memory
        Fetching the cursor for retrieving the data
        Closing the cursor to release the allocated memory

    The following code will printout:
    1 Ramesh Ahmedabad
    2 Khilan Delhi
    3 kaushik Kota
    4 Chaitali Mumbai
    5 Hardik Bhopal
    6 Komal MP

*/
CREATE TABLE customers (
                           ID NUMBER PRIMARY KEY,
                           NAME VARCHAR2(50),
                           AGE NUMBER,
                           ADDRESS VARCHAR2(100),
                           SALARY NUMBER(10, 2)
);
INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00);

INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00);

INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (3, 'Kaushik', 23, 'Kota', 2000.00);

INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00);

INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00);

INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (6, 'Komal', 22, 'MP', 4500.00);

Commit;


DECLARE
    c_id customers.id%type;
    c_name customers.name%type;
    c_addr customers.address%type;
    CURSOR c_customers is
        SELECT id, name, address FROM customers;
BEGIN
    OPEN c_customers;
    LOOP
    FETCH c_customers into c_id, c_name, c_addr;
        EXIT WHEN c_customers%notfound;
        dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
    END LOOP;
    CLOSE c_customers;
END;
/
