/*
    The PL/SQL programming language provides a data structure called the VARRAY,
    which can store a fixed-size sequential collection of elements of the same type.
    A varray is used to store an ordered collection of data, however it is often
    better to think of an array as a collection of variables of the same type.

    Please note −

        In Oracle environment, the starting index for varrays is always 1.

        You can initialize the varray elements using the constructor method of the varray type,
        which has the same name as the varray.

        Varrays are one-dimensional arrays.

        A varray is automatically NULL when it is declared and must be initialized before its
        elements can be referenced.

    Example One:

    The following code for Example One will printout:
    Total 5 Students
    Student: Kavita  Marks: 98
    Student: Pritam  Marks: 97
    Student: Ayan  Marks: 78
    Student: Rishav  Marks: 87
    Student: Aziz  Marks: 92

    For Example Two:
        Elements of a varray could also be a %ROWTYPE of any database table or %TYPE of any database table field.
        The following example illustrates the concept.

    The following code for Example Two will printout:
    Customer(1):Ramesh
    Customer(2):Khilan
    Customer(3):Kaushik
    Customer(4):Chaitali
    Customer(5):Hardik
    Customer(6):Komal

*/

-- Example One
DECLARE
    type namesarray IS VARRAY(5) OF VARCHAR2(10);
    type grades IS VARRAY(5) OF INTEGER;
    names namesarray;
    marks grades;
    total integer;
BEGIN
    names := namesarray('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
    marks:= grades(98, 97, 78, 87, 92);
    total := names.count;
    dbms_output.put_line('Total '|| total || ' Students');
    FOR i in 1 .. total LOOP
        dbms_output.put_line('Student: ' || names(i) || '  Marks: ' || marks(i));
    END LOOP;
END;
/

-- Example Two
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
    CURSOR c_customers is
    SELECT  name FROM customers;
    type c_list is varray (6) of customers.name%type;
    name_list c_list := c_list();
    counter integer :=0;
BEGIN
    FOR n IN c_customers LOOP
        counter := counter + 1;
        name_list.extend;
        name_list(counter)  := n.name;
        dbms_output.put_line('Customer('||counter ||'):'||name_list(counter));
    END LOOP;
END;
/

--clean up
DROP TABLE customers;

Commit;
