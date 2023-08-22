/*
    Arithmetic operators are pretty straight forward:
        - + is addition
        - - is subtraction
        - * is multiply
        - / is division
        - ** is exponent (power)

    Here following code will printout:
    10 + 2 equals 12
    10 - 2 equals 8
    10 * 2 equals 20
    10 / 2 equals 5
    10 to the power of 2 equals 100
 */


DECLARE
    first number:= 10;
    second number:= 2;
    adds number;
    subs number;
    multi number;
    divs number;
    expo number;
BEGIN
    adds:= first + second;
    subs:= first - second;
    multi:= first * second;
    divs:= first / second;
    expo:= first ** second;

    dbms_output.put_line(first || ' + ' || second || ' equals ' || adds);
    dbms_output.put_line(first || ' - ' || second || ' equals ' || subs);
    dbms_output.put_line(first || ' * ' || second || ' equals ' || multi);
    dbms_output.put_line(first || ' / ' || second || ' equals ' || divs);
    dbms_output.put_line(first || ' to the power of ' || second || ' equals ' || expo);
END;
/
