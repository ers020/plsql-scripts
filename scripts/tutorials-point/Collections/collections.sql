/*

    A collection is an ordered group of elements having the same data type. Each element
    is identified by a unique subscript that represents its position in the collection.

    PL/SQL provides three collection types:
        Index-by tables or Associative array
        Nested table
        Variable-size array or Varray

    Collection Information:

        --Format:
        Collection Type
            Number of Elements
            Subscript Type
            Dense or Sparse	Where Created
            Can Be Object Type Attribute

        Associative array (or index-by table)
            Unbounded
            String or integer
            Either
            Only in PL/SQL block
            No

        Nested table
            Unbounded
            Integer
            Starts dense, can become sparse
            Either in PL/SQL block or at schema level
            Yes

        Variablesize array (Varray)
            Bounded
            Integer
            Always dense
            Either in PL/SQL block or at schema level
            Yes

    Index-By Table
        An index-by table (also called an associative array) is a set of key-value pairs.
        Each key is unique and is used to locate the corresponding value. The key can be
        either an integer or a string.

        An index-by table is created using the following syntax. Here, we are creating an
        index-by table named table_name, the keys of which will be of the subscript_type
        and associated values will be of the element_type

    -- Example One: Index-By Table

    The following code for Index-By Table will printout:
    Salary of James is 78000
    Salary of Martin is 100000
    Salary of Minakshi is 75000
    Salary of Rajnish is 62000

    -- Example Two: Nested Tables

        A nested table is like a one-dimensional array with an arbitrary number of elements. However,
        a nested table differs from an array in the following aspects −

        An array has a declared number of elements, but a nested table does not. The size of a nested
        table can increase dynamically.

        An array is always dense, i.e., it always has consecutive subscripts. A nested array is dense
        initially, but it can become sparse when elements are deleted from it.

    The following code Nested Tables will printout:
    Total 5 Students
    Student:Kavita, Marks:98
    Student:Pritam, Marks:97
    Student:Ayan, Marks:78
    Student:Rishav, Marks:87
    Student:Aziz, Marks:92

*/

-- Index-By Table
DECLARE
    TYPE salary IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    salary_list salary;
    name   VARCHAR2(20);
BEGIN
    -- adding elements to the table
    salary_list('Rajnish') := 62000;
    salary_list('Minakshi') := 75000;
    salary_list('Martin') := 100000;
    salary_list('James') := 78000;

    -- printing the table
    name := salary_list.FIRST;
    WHILE name IS NOT null LOOP
        dbms_output.put_line
        ('Salary of ' || name || ' is ' || TO_CHAR(salary_list(name)));
        name := salary_list.NEXT(name);
    END LOOP;
END;
/



-- Nested Table
DECLARE
    TYPE names_table IS TABLE OF VARCHAR2(10);
    TYPE grades IS TABLE OF INTEGER;
    names names_table;
    marks grades;
    total integer;
BEGIN
    names := names_table('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
    marks:= grades(98, 97, 78, 87, 92);
    total := names.count;
    dbms_output.put_line('Total '|| total || ' Students');
    FOR i IN 1 .. total LOOP
        dbms_output.put_line('Student:'||names(i)||', Marks:' || marks(i));
    end loop;
END;
/
