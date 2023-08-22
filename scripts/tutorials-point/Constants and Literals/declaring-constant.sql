/*
 Making a constant is as simple as using the CONSTANT keyword.
 Much like declaring a final in Java or a const in JavaScript/TypeScript, once it is set, it cannot be changed.

 The printout of the below PL/SQL Statement will be:
    Radius: 9.5
    Diameter: 19
    Circumference: 59.69
    Area: 283.53
 */

DECLARE
   -- constant declaration
pi constant number := 3.141592654;
   -- other declarations
   radius number(5,2);
   dia number(5,2);
   circumference number(7, 2);
   area number (10, 2);
BEGIN
   -- processing
   radius := 9.5;
   dia := radius * 2;
   circumference := 2.0 * pi * radius;
   area := pi * radius * radius;
   -- output
   dbms_output.put_line('Radius: ' || radius);
   dbms_output.put_line('Diameter: ' || dia);
   dbms_output.put_line('Circumference: ' || circumference);
   dbms_output.put_line('Area: ' || area);
END;
/
