/*
    A function is same as a procedure except that it returns a value. Therefore,
    all the discussions of the previous chapter are true for functions too.

    Example One:

    The following code for Example One will printout:
    Total no. of Customers: 6

    Example Two:

    The following example demonstrates Declaring, Defining, and Invoking a Simple PL/SQL
    Function that computes and returns the maximum of two values.

    The following code for Example Two will printout:
    Maximum of (23,45): 45

    Example Three:

        We have seen that a program or subprogram may call another subprogram. When a subprogram
        calls itself, it is referred to as a recursive call and the process is known as recursion.

    The following code for Example Three will printout:
    Factorial 6 is 720
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

CREATE OR REPLACE FUNCTION totalCustomers
RETURN number IS
   total number(2) := 0;
BEGIN
SELECT count(*) into total
FROM customers;

RETURN total;
END;
/

DECLARE
    c number(2);
BEGIN
    c := totalCustomers();
    dbms_output.put_line('Total no. of Customers: ' || c);
END;
/


-- Example Two
DECLARE
    a number;
    b number;
    c number;
FUNCTION findMax(x IN number, y IN number)
RETURN number
IS
    z number;
BEGIN
    IF x > y THEN
        z:= x;
    ELSE
        Z:= y;
    END IF;
    RETURN z;
END;
BEGIN
    a:= 23;
    b:= 45;
    c := findMax(a, b);
    dbms_output.put_line(' Maximum of (23,45): ' || c);
END;
/

-- Example Three
DECLARE
    num number;
    factorial number;

FUNCTION fact(x number)
RETURN number
IS
    f number;
    BEGIN
        IF x=0 THEN
        f := 1;
    ELSE
        f := x * fact(x-1);
    END IF;
    RETURN f;
END;

BEGIN
   num:= 6;
   factorial := fact(num);
   dbms_output.put_line(' Factorial '|| num || ' is ' || factorial);
END;
/
