DECLARE
-- simple message
message varchar(20):= 'Hello, World!';
BEGIN
    /*  Simple print out but note
        the multiline comment format
    */
    dbms_output.put_line(message);
END;
/
