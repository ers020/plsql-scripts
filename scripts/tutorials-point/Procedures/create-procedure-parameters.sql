/*

    The following items list out the parameter modes in PL/SQL subprograms:

        IN

        An IN parameter lets you pass a value to the subprogram. It is a read-only parameter.
        Inside the subprogram, an IN parameter acts like a constant. It cannot be assigned a value.
        You can pass a constant, literal, initialized variable, or expression as an IN parameter.
        You can also initialize it to a default value; however, in that case, it is omitted from the
        subprogram call. It is the default mode of parameter passing. Parameters are passed by reference.

        OUT

        An OUT parameter returns a value to the calling program. Inside the subprogram, an OUT parameter
        acts like a variable. You can change its value and reference the value after assigning it. The actual
        parameter must be variable and it is passed by value.

        IN OUT

        An IN OUT parameter passes an initial value to a subprogram and returns an updated value to the caller.
        It can be assigned a value and the value can be read.

        The actual parameter corresponding to an IN OUT formal parameter must be a variable, not a constant
        or an expression. Formal parameter must be assigned a value. Actual parameter is passed by value.

    The following code for Example One will printout:
    Minimum of (23, 45) : 23

    The following code for Example Two will printout:
    Square of (23): 529

*/

-- Example One
DECLARE
    a number;
    b number;
    c number;
    PROCEDURE findMin(x IN number, y IN number, z OUT number) IS
BEGIN
    IF x < y THEN
        z:= x;
    ELSE
        z:= y;
    END IF;
END;
BEGIN
    a:= 23;
    b:= 45;
    findMin(a, b, c);
    dbms_output.put_line(' Minimum of (23, 45) : ' || c);
END;
/

-- Example Two
DECLARE
    a number;
    PROCEDURE squareNum(x IN OUT number) IS
BEGIN
    x := x * x;
END;
BEGIN
    a:= 23;
    squareNum(a);
    dbms_output.put_line(' Square of (23): ' || a);
END;
