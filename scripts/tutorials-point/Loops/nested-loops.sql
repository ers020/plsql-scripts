/*
    PL/SQL allows using one loop inside another loop.

    The following code will printout:
    2 is prime
    3 is prime
    5 is prime
    7 is prime
    11 is prime
    13 is prime
    17 is prime
    19 is prime
    23 is prime
    29 is prime
    31 is prime
    37 is prime
    41 is prime
    43 is prime
    47 is prime
*/
DECLARE
    i number(3);
    j number(3);
BEGIN
    i := 2;
    LOOP
        j:= 2;
        LOOP
            exit WHEN ((mod(i, j) = 0) or (j = i));
            j := j + 1;
        END LOOP;
        IF (j = i ) THEN
            dbms_output.put_line(i || ' is prime');
        END IF;
        i := i + 1;
        exit WHEN i = 50;
    END LOOP;
END;
/
