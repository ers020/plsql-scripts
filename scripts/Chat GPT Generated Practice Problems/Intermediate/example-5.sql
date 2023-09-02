/*

    Create a PL/SQL function that calculates the Fibonacci series up to a given number.

*/

CREATE OR REPLACE FUNCTION fibonacci(n NUMBER) RETURN NUMBER IS
BEGIN
  IF n <= 0 THEN
    RETURN 0;
  ELSIF n = 1 THEN
    RETURN 1;
ELSE
    RETURN fibonacci(n - 1) + fibonacci(n - 2);
END IF;
END;
/

SELECT fibonacci(4) FROM DUAL;
