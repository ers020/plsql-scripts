/*

    Triggers are stored programs, which are automatically executed or fired when some events occur.
    Triggers are, in fact, written to be executed in response to any of the following events:

        A database manipulation (DML) statement (DELETE, INSERT, or UPDATE)
        A database definition (DDL) statement (CREATE, ALTER, or DROP)
        A database operation (SERVERERROR, LOGON, LOGOFF, STARTUP, or SHUTDOWN)

    Benefits of Triggers
    Triggers can be written for the following purposes −

        Generating some derived column values automatically
        Enforcing referential integrity
        Event logging and storing information on table access
        Auditing
        Synchronous replication of tables
        Imposing security authorizations
        Preventing invalid transactions

    The following code will printout:

    -- Add New Record:
        Old salary:
        New salary: 7500
        Salary difference:

    -- Update existing Record:
        Old salary: 1500
        New salary: 2000
        Salary difference: 500


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

CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON customers
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
sal_diff number;
BEGIN
   sal_diff := :NEW.salary  - :OLD.salary;
   dbms_output.put_line('Old salary: ' || :OLD.salary);
   dbms_output.put_line('New salary: ' || :NEW.salary);
   dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/

-- Add New Record
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (7, 'Kriti', 22, 'HP', 7500.00 );

-- Update existing Record
UPDATE customers
SET salary = salary + 500
WHERE id = 2;
