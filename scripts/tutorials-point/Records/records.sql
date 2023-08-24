/*

    A record is a data structure that can hold data items of different kinds.
    Records consist of different fields, similar to a row of a database table.

    PL/SQL can handle the following types of records:
        Table-based
        Cursor-based records
        User-defined records

    Example One: Table-Based Records

    The %ROWTYPE attribute enables a programmer to create table-based and cursor-based records.

    The following code for Example One will printout:
    Customer ID: 5
    Customer Name: Hardik
    Customer Address: Bhopal
    Customer Salary: 8500


    Example Two: Cursor-Based Records

    The following example illustrates the concept of cursor-based records

    The following code for Example Two will printout:
    1 Ramesh
    2 Khilan
    3 Kaushik
    4 Chaitali
    5 Hardik
    6 Komal

    Example Three: User-Defined Records

    PL/SQL provides a user-defined record type that allows you to define the different record structures.

    Accessing Fields
        To access any field of a record, we use the dot (.) operator. The member access operator
        is coded as a period between the record variable name and the field that we wish to access.

    The following code for Example Three will printout:
    Book 1 title : C Programming
    Book 1 author : Nuha Ali
    Book 1 subject : C Programming Tutorial
    Book 1 book_id : 6495407
    Book 2 title : Telecom Billing
    Book 2 author : Zara Ali
    Book 2 subject : Telecom Billing Tutorial
    Book 2 book_id : 6495700

    Example Four: Records as Subprogram Parameters

    You can pass a record as a subprogram parameter just as you pass any other variable.

    The following code for Example Four will printout:
    Book  title :  C Programming
    Book  author : Nuha Ali
    Book  subject : C Programming Tutorial
    Book book_id : 6495407
    Book  title :  Telecom Billing
    Book  author : Zara Ali
    Book  subject : Telecom Billing Tutorial
    Book book_id : 6495700


*/

-- Example One

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
    customer_rec customers%rowtype;
BEGIN
    SELECT * into customer_rec
        FROM customers
        WHERE id = 5;
    dbms_output.put_line('Customer ID: ' || customer_rec.id);
    dbms_output.put_line('Customer Name: ' || customer_rec.name);
    dbms_output.put_line('Customer Address: ' || customer_rec.address);
    dbms_output.put_line('Customer Salary: ' || customer_rec.salary);
END;
/


-- Example Two
DECLARE
    CURSOR customer_cur is
        SELECT id, name, address
        FROM customers;
    customer_rec customer_cur%rowtype;
BEGIN
    OPEN customer_cur;
    LOOP
    FETCH customer_cur into customer_rec;
          EXIT WHEN customer_cur%notfound;
          DBMS_OUTPUT.put_line(customer_rec.id || ' ' || customer_rec.name);
    END LOOP;
END;
/


-- Example Three
DECLARE
    type books is record
          (title varchar(50),
          author varchar(50),
          subject varchar(100),
          book_id number);
    book1 books;
    book2 books;
BEGIN
   -- Book 1 specification
   book1.title  := 'C Programming';
   book1.author := 'Nuha Ali ';
   book1.subject := 'C Programming Tutorial';
   book1.book_id := 6495407;
   -- Book 2 specification
   book2.title := 'Telecom Billing';
   book2.author := 'Zara Ali';
   book2.subject := 'Telecom Billing Tutorial';
   book2.book_id := 6495700;

  -- Print book 1 record
   dbms_output.put_line('Book 1 title : '|| book1.title);
   dbms_output.put_line('Book 1 author : '|| book1.author);
   dbms_output.put_line('Book 1 subject : '|| book1.subject);
   dbms_output.put_line('Book 1 book_id : ' || book1.book_id);

   -- Print book 2 record
   dbms_output.put_line('Book 2 title : '|| book2.title);
   dbms_output.put_line('Book 2 author : '|| book2.author);
   dbms_output.put_line('Book 2 subject : '|| book2.subject);
   dbms_output.put_line('Book 2 book_id : '|| book2.book_id);
END;
/


-- Example Four
DECLARE
type books is record
      (title  varchar(50),
      author  varchar(50),
      subject varchar(100),
      book_id   number);
   book1 books;
   book2 books;
PROCEDURE printbook (book books) IS
BEGIN
   dbms_output.put_line ('Book  title :  ' || book.title);
   dbms_output.put_line('Book  author : ' || book.author);
   dbms_output.put_line( 'Book  subject : ' || book.subject);
   dbms_output.put_line( 'Book book_id : ' || book.book_id);
END;

BEGIN
   -- Book 1 specification
   book1.title  := 'C Programming';
   book1.author := 'Nuha Ali ';
   book1.subject := 'C Programming Tutorial';
   book1.book_id := 6495407;

   -- Book 2 specification
   book2.title := 'Telecom Billing';
   book2.author := 'Zara Ali';
   book2.subject := 'Telecom Billing Tutorial';
   book2.book_id := 6495700;

   -- Use procedure to print book info
   printbook(book1);
   printbook(book2);
END;
/
