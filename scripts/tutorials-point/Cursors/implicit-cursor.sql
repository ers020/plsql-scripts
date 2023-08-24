/*

    Implicit cursors are automatically created by Oracle whenever an SQL statement
    is executed, when there is no explicit cursor for the statement. Programmers cannot
    control the implicit cursors and the information in it.

    Whenever a DML statement (INSERT, UPDATE and DELETE) is issued, an implicit cursor
    is associated with this statement. For INSERT operations, the cursor holds the data
    that needs to be inserted. For UPDATE and DELETE operations, the cursor identifies
    the rows that would be affected.

    In PL/SQL, you can refer to the most recent implicit cursor as the SQL cursor,
    which always has attributes such as %FOUND, %ISOPEN, %NOTFOUND, and %ROWCOUNT.
    The SQL cursor has additional attributes, %BULK_ROWCOUNT and %BULK_EXCEPTIONS,
    designed for use with the FORALL statement.

    The following code for will printout:
    6 customers selected

    1	Ramesh	    32	Ahmedabad	2500
    2	Khilan	    25	Delhi	    2000
    3	Kaushik	    23	Kota	    2500
    4	Chaitali	25	Mumbai	    7000
    5	Hardik	    27	Bhopal	    9000
    6	Komal	    22	MP	        5000
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
total_rows number(2);
BEGIN
UPDATE customers
SET salary = salary + 500;
IF sql%notfound THEN
            dbms_output.put_line('no customers selected');
        ELSIF sql%found THEN
            total_rows := sql%rowcount;
            dbms_output.put_line( total_rows || ' customers selected ');
END IF;
END;
/

-- see the customers have updated
select * from customers;
