/*

    Create a PL/SQL block that transfers an amount from one account to another.
    Handle exceptions related to insufficient balance and ensure proper rollback
    in case of errors.

*/
-- Step 1: create table
create table account_table (
                               account_id number primary key,
                               balance number
);

insert into account_table values (1, 3000);
insert into account_table values (2, 300);

commit;

-- Step 2: create block
DECLARE
    from_acc number := 1;
    to_acc number := 2;
    amount number := 3000;
    bal number;
BEGIN
    select balance into bal from account_table where account_id = from_acc;
    IF bal >= amount THEN
        UPDATE account_table SET balance = balance - bal WHERE account_id = from_acc;
        UPDATE account_table SET balance = balance + bal where account_id = to_acc;
        COMMIT;
    else
        --   in this particular error item, -20001 will be the error code, and the message will be the printout
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance');
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

COMMIT;
-- run
