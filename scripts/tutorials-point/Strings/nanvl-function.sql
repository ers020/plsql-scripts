/*
    The NANVL function in PL/SQL is used to replace NaN (Not-a-Number) values with a
    specified default value. This is particularly useful when working with numeric data
    where you might encounter division by zero or other operations that result in NaN
    values.

    The following code will printout:
    Result: 0
*/

DECLARE
    dividend NUMBER := 0;
    divisor NUMBER := 0;
    result NUMBER;
BEGIN
    result := dividend / divisor;
    result := NANVL(result, 0); -- Replace NaN with 0
    DBMS_OUTPUT.PUT_LINE('Result: ' || result);
END;
/
