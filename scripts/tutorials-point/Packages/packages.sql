/*

    Packages are schema objects that groups logically related PL/SQL types, variables, and subprograms.

    A package will have two mandatory parts:
        Package specification
        Package body or definition

    Package Specification:

        The specification is the interface to the package. It just DECLARES the types, variables,
        constants, exceptions, cursors, and subprograms that can be referenced from outside the package.
        In other words, it contains all information about the content of the package, but excludes
        the code for the subprograms.

        All objects placed in the specification are called public objects. Any subprogram not in the
        package specification but coded in the package body is called a private object.

    Package Body:

        The package body has the codes for various methods declared in the package specification
        and other private declarations, which are hidden from the code outside the package.

        The CREATE PACKAGE BODY Statement is used for creating the package body.

    The following code will printout:
    Customer(1)Ramesh
    Customer(2)Khilan
    Customer(3)Kaushik
    Customer(4)Chaitali
    Customer(5)Hardik
    Customer(6)Komal
    Customer(7)Rajnish
    Customer(8)Subham
    Customer(1)Ramesh
    Customer(2)Khilan
    Customer(3)Kaushik
    Customer(4)Chaitali
    Customer(5)Hardik
    Customer(6)Komal
    Customer(7)Rajnish

*/

CREATE OR REPLACE PACKAGE c_package AS
   -- Adds a customer
   PROCEDURE addCustomer(c_id   customers.id%type,
   c_name customers.Name%type,
   c_age  customers.age%type,
   c_addr customers.address%type,
   c_sal  customers.salary%type);

   -- Removes a customer
   PROCEDURE delCustomer(c_id  customers.id%TYPE);
   --Lists all customers
   PROCEDURE listCustomer;

END c_package;
/


CREATE OR REPLACE PACKAGE BODY c_package AS
   PROCEDURE addCustomer(c_id  customers.id%type,
      c_name customers.Name%type,
      c_age  customers.age%type,
      c_addr  customers.address%type,
      c_sal   customers.salary%type)
   IS
    BEGIN
        INSERT INTO customers (id,name,age,address,salary)
            VALUES(c_id, c_name, c_age, c_addr, c_sal);
    END addCustomer;

    PROCEDURE delCustomer(c_id   customers.id%type) IS
    BEGIN
        DELETE FROM customers
        WHERE id = c_id;
    END delCustomer;

   PROCEDURE listCustomer IS
   CURSOR c_customers is
        SELECT  name FROM customers;
    TYPE c_list is TABLE OF customers.Name%type;
    name_list c_list := c_list();
    counter integer :=0;
    BEGIN
        FOR n IN c_customers LOOP
        counter := counter +1;
        name_list.extend;
        name_list(counter) := n.name;
        dbms_output.put_line('Customer(' ||counter|| ')'||name_list(counter));
        END LOOP;
    END listCustomer;

END c_package;
/



DECLARE
code customers.id%type:= 8;
BEGIN
   c_package.addcustomer(7, 'Rajnish', 25, 'Chennai', 3500);
   c_package.addcustomer(8, 'Subham', 32, 'Delhi', 7500);
   c_package.listcustomer;
   c_package.delcustomer(code);
   c_package.listcustomer;
END;
/
