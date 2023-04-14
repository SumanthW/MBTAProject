set serveroutput on
--  Function to check if the facility is active or inactive --
CREATE OR REPLACE FUNCTION is_facility_up
(facility IN varchar2,
facility_id IN number)
RETURN varchar2
IS 
v_id_present number;
BEGIN

IF facility = 'Transit' THEN
    BEGIN
    select transit_id into v_id_present from transit where transit_id = facility_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        v_id_present := NULL;
    END;
    IF (v_id_present IS NOT NULL) THEN
        RETURN 'True';
    ELSE
        RETURN 'False';
    END IF;
ELSIF facility = 'Line' THEN
    BEGIN
    select line_id into v_id_present from operations where line_id = facility_id and systimestamp AT TIME ZONE 'AMERICA/NEW_YORK'  between start_time and end_time;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        v_id_present := NULL;
    END;
    IF (v_id_present IS NULL) THEN
        RETURN 'True';
    ELSE
        RETURN 'False';
    END IF;
ELSIF facility = 'Station' THEN
    BEGIN
    select station_id into v_id_present from operations where station_id = facility_id and systimestamp AT TIME ZONE 'AMERICA/NEW_YORK' between start_time and end_time;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        v_id_present := NULL;
    END;
    IF (v_id_present IS NULL) THEN
        RETURN 'True';
    ELSE
        RETURN 'False';
    END IF;
ELSIF facility = 'Recharge_device' THEN
    BEGIN
    select recharge_device_id into v_id_present from operations where recharge_device_id = facility_id and systimestamp AT TIME ZONE 'AMERICA/NEW_YORK'  between start_time and end_time;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        v_id_present := NULL;
    END;
    IF (v_id_present IS NULL) THEN
        RETURN 'True';
    ELSE
        RETURN 'False';
    END IF;
ELSIF facility = 'Transaction_device' THEN
    BEGIN
    select transaction_device_id into v_id_present from operations where transaction_device_id = facility_id and systimestamp AT TIME ZONE 'AMERICA/NEW_YORK'  between start_time and end_time;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        v_id_present := NULL;
    END;
    IF (v_id_present IS NULL) THEN
        RETURN 'True';
    ELSE
        RETURN 'False';
    END IF;
ELSE
 RETURN 'False';
END IF;

END;
/

-- Function to check whether the wallet is able to do transaction or not --
CREATE OR REPLACE FUNCTION can_transact
(i_wallet_id number)
RETURN varchar2
IS
v_present varchar2(20);
BEGIN
v_present := NULL;

    BEGIN
        select 'Pass' into v_present from 
        wallet w join card c on w.wallet_id = c.wallet_id and w.wallet_id=i_wallet_id
        join pass p on c.card_id = p.card_id and systimestamp AT TIME ZONE 'AMERICA/NEW_YORK' between valid_from and pass_expiry;
        
        RETURN v_present;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_present := NULL;
    END;
    BEGIN
        select 'Ride' into v_present from
        wallet w join ticket t on w.wallet_id =t.wallet_id  and w.wallet_id=i_wallet_id and t.rides>0 and w.wallet_expiry >= systimestamp AT TIME ZONE 'AMERICA/NEW_YORK';
    
        RETURN v_present;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        v_present := NULL;
    END;
    BEGIN
        select 'Balance' into v_present from
        wallet w join card c on w.wallet_id = c.wallet_id  and w.wallet_id=i_wallet_id and c.balance>0 and w.wallet_expiry >= systimestamp AT TIME ZONE 'AMERICA/NEW_YORK'; 
    
        RETURN v_present;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        v_present := NULL;
    END;
        
    

RETURN v_present;
END;
/

-- Function to check which transit the station belongs --
CREATE OR REPLACE FUNCTION which_transit(i_station_id number)
RETURN varchar2
IS
v_transit_type varchar2(20);
BEGIN
    select max(t.name) into v_transit_type from transit t join line l on t.transit_id = l.transit_id
    join line_station_connections ls on ls.line_id = l.line_id
    join station s on s.station_id = ls.station_id and s.station_id = i_station_id;
    
    RETURN v_transit_type;
EXCEPTION
    WHEN NO_DATA_FOUND THEN    
    RETURN NULL;
END;
/
-- Function to check if the pass is active or inactive --
CREATE OR REPLACE FUNCTION check_pass_valid(
 pass_id1 NUMBER
)
RETURN VARCHAR2
IS 
 valid_date date;
BEGIN
  -- CHECKING PASS VALID OR NOT
  select to_date(pass_expiry,'DD-MM-YY') into valid_date from pass where pass_id = pass_id1;
  if valid_date >= trunc(sysdate) then
        return 'Valid';
      else
        return 'Invalid';
  end if;
  exception when others then return 'Invalid';

END;
/
-- Recharge Wallet Procedure --
create or replace procedure RECHARGE_WALLET(
pi_wallet_id NUMBER, 
pi_value_of_transaction recharge.value_of_transaction%TYPE, 
pi_recharge_type varchar2, 
pi_recharge_device_id NUMBER,
pi_transit_id NUMBER)
AS
 v_transaction_time date;
 v_wallet_id NUMBER;
 v_wallet_type varchar2(10);
 v_wallet_status varchar2(10);
 v_rides NUMBER;
 v_type_price NUMBER;
 v_recharge_device_status varchar2(10);
 v_Number_of_days PASS_TYPE.no_of_days%TYPE;
 v_PASS_TYPE PASS_TYPE.pass_type_id%TYPE;
 v_CARD_ID NUMBER;
BEGIN
    select status into v_recharge_device_status from recharge_device where recharge_device_id = pi_recharge_device_id  and pi_value_of_transaction >0;
    IF v_recharge_device_status = 'Active' THEN

    begin
        select wallet_id 
        into v_wallet_id
        from wallet
        WHERE wallet_id = pi_wallet_id;

        select wallet_type 
        into v_wallet_type
        from wallet
        WHERE wallet_id = pi_wallet_id;

        select status 
        into v_wallet_status
        from wallet
        WHERE wallet_id = pi_wallet_id;

        BEGIN
            IF pi_recharge_type = 'Ride' THEN
                DBMS_OUTPUT.put_line('Existing Ticket cannot be recharged/Cards cannot purchase rides, choose top-up option.');

            elsif pi_recharge_type = 'Pass' and v_wallet_type = 'Card' and v_wallet_status = 'Active' THEN
                
                BEGIN
                select price into v_type_price from pass_type where price = pi_value_of_transaction;
                select MAX(pass_type_id) INTO v_PASS_TYPE from PASS_TYPE where price = pi_value_of_transaction;
                select MAX(no_of_days) INTO v_Number_of_days from PASS_TYPE where price = pi_value_of_transaction;
                select MAX(card_id) INTO v_CARD_ID from CARD where wallet_id = pi_wallet_id;

                INSERT INTO RECHARGE(recharge_id,value_of_transaction,wallet_id,transaction_time,recharge_type,recharge_device_id) 
                values (recharge_id_seq.nextval,pi_value_of_transaction,pi_wallet_id, systimestamp AT TIME ZONE 'AMERICA/NEW_YORK','Pass',pi_recharge_device_id);
                INSERT INTO Pass(pass_id,card_id,pass_expiry,pass_type_id, recharge_id, valid_from) values (pass_id_seq.nextval,v_CARD_ID,SYSDATE+v_Number_of_days,v_PASS_TYPE,recharge_id_seq.currval,SYSDATE);
                --Pass trigger to take care of pass addition
                commit;
                    DBMS_OUTPUT.put_line('Transaction Successful');
                EXCEPTION when no_data_found then
                    DBMS_OUTPUT.put_line('Transaction value should match the price of appropriate pass');

                END;
            elsif pi_recharge_type = 'Top-up' and v_wallet_type = 'Card' and v_wallet_status = 'Active' THEN
                BEGIN 
                    UPDATE card set Balance = Balance + pi_value_of_transaction where wallet_id = pi_wallet_id;
                    INSERT INTO RECHARGE(recharge_id,value_of_transaction,wallet_id,transaction_time,recharge_type,recharge_device_id) 
                    values (recharge_id_seq.nextval,pi_value_of_transaction,pi_wallet_id,systimestamp AT TIME ZONE 'AMERICA/NEW_YORK','Top-up',pi_recharge_device_id);
                    commit;
                    DBMS_OUTPUT.put_line('Transaction Successful');
                EXCEPTION
                when others then
                    DBMS_OUTPUT.put_line('Oops! Transaction was not Successful');
                END;
            else
                DBMS_OUTPUT.put_line('Invalid wallet for recharge type selected');

            end if;
        END;
    exception
        when no_data_found then
            IF pi_recharge_type = 'Ride' THEN
                BEGIN
                    select price_per_ride into v_type_price from transit where transit_id = pi_transit_id;
                    IF MOD(pi_value_of_transaction,v_type_price) = 0 THEN
                        BEGIN 
                            INSERT INTO wallet (wallet_id, wallet_type, wallet_expiry, start_date, status)  VALUES (wallet_id_seq.nextval, 'Ticket', SYSDATE, SYSDATE+90, 'Active');
                            v_wallet_id := wallet_id_seq.currval;
                            INSERT INTO TICKET(ticket_id,wallet_id,rides,transit_id) values (ticket_id_seq.nextval,wallet_id_seq.currval,pi_value_of_transaction/v_type_price,pi_transit_id);

                            --UPDATE ticket set rides = pi_value_of_transaction/v_type_price where wallet_id = v_wallet_id;
                            INSERT INTO RECHARGE(recharge_id,value_of_transaction,wallet_id,transaction_time,recharge_type,recharge_device_id) 
                            values (recharge_id_seq.nextval,pi_value_of_transaction,wallet_id_seq.currval,systimestamp AT TIME ZONE 'AMERICA/NEW_YORK','Ride',pi_recharge_device_id);
                            commit;
                            DBMS_OUTPUT.put_line('Transaction Successful');
                        END;
                    ELSE
                        DBMS_OUTPUT.put_line('Transaction value should be multiple of ride price for the transit selected');
                    end if;
                EXCEPTION when no_data_found then
                    DBMS_OUTPUT.put_line('Invalid transit selected');
                END;
            elsif pi_recharge_type = 'Pass' THEN

                BEGIN
                    select price into v_type_price from pass_type where price = pi_value_of_transaction;
                    INSERT INTO wallet (wallet_id, wallet_type, wallet_expiry, start_date, status)  VALUES (wallet_id_seq.nextval, 'Card', SYSDATE, SYSDATE+365, 'Active');
                    INSERT INTO CARD (card_id, balance,wallet_id) values (card_id_seq.nextval,0,wallet_id_seq.currval);
                    select MAX(pass_type_id) INTO v_PASS_TYPE from PASS_TYPE where price = pi_value_of_transaction;
                    select MAX(no_of_days) INTO v_Number_of_days from PASS_TYPE where price = pi_value_of_transaction;

                    INSERT INTO RECHARGE(recharge_id,value_of_transaction,wallet_id,transaction_time,recharge_type,recharge_device_id) 
                    values (recharge_id_seq.nextval,pi_value_of_transaction,wallet_id_seq.currval,systimestamp AT TIME ZONE 'AMERICA/NEW_YORK','Pass',pi_recharge_device_id);
                    INSERT INTO Pass(pass_id,card_id,pass_expiry,pass_type_id, recharge_id, valid_from) values (pass_id_seq.nextval,card_id_seq.currval,SYSDATE+v_Number_of_days,v_PASS_TYPE,recharge_id_seq.currval,SYSDATE);
                    commit;
                    DBMS_OUTPUT.put_line('Transaction Successful');
                    --Pass trigger to take care of pass addition

                EXCEPTION when no_data_found then
                    DBMS_OUTPUT.put_line('Transaction value should match the price of appropriate pass');

                END;
            elsif pi_recharge_type = 'Top-up' THEN
                BEGIN 
                    INSERT INTO wallet (wallet_id, wallet_type, wallet_expiry, start_date, status)  VALUES (wallet_id_seq.nextval, 'Card', SYSDATE, SYSDATE+365, 'Active');
                    v_wallet_id := wallet_id_seq.currval;
                    INSERT INTO CARD (card_id, balance,wallet_id) values (card_id_seq.nextval,pi_value_of_transaction,wallet_id_seq.currval);
                    --UPDATE card set Balance = Balance + pi_value_of_transaction where wallet_id = v_wallet_id;
                    DBMS_OUTPUT.put_line('Trying to add recharge');
                    INSERT INTO RECHARGE(recharge_id,value_of_transaction,wallet_id,transaction_time,recharge_type,recharge_device_id) 
                    values (recharge_id_seq.nextval,pi_value_of_transaction,wallet_id_seq.currval,systimestamp AT TIME ZONE 'AMERICA/NEW_YORK','Top-up',pi_recharge_device_id);
                    commit;
                    DBMS_OUTPUT.put_line('Transaction Successful');
                END;
            end if;
        when others then
            DBMS_OUTPUT.put_line(sqlerrm);
    end;
    ELSE
        DBMS_OUTPUT.put_line('Recharge device is down');
    END IF;
    EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('Invalid recharge');
END RECHARGE_WALLET;
/

--Updating status of the expired wallet --
CREATE OR REPLACE PROCEDURE update_wallet_status
IS
BEGIN
  -- Update wallet status to inactive for expired wallets
  UPDATE wallet
  SET status = 'inactive'
  WHERE wallet_expiry < SYSDATE; 
END;
/


-- Stored procedure for Transaction --
CREATE OR REPLACE PROCEDURE process_transaction (
  p_wallet_id        IN wallet.wallet_id%TYPE,
  p_transaction_device_id IN transaction_device.transaction_device_id%TYPE
)
IS
  v_wallet_status           wallet.status%TYPE;
  v_transaction_device_status transaction_device.status%TYPE;
  v_station_id              transaction_device.station_id%TYPE;
  v_line_id                 transaction_device.line_id%TYPE;
  v_transit_id              line.transit_id%TYPE;
  v_transit_price_per_ride  transit.price_per_ride%TYPE;
  v_wallet_type             wallet.wallet_type%TYPE;
  v_card_balance            card.balance%TYPE;
  v_ticket_rides            ticket.rides%TYPE;
  v_pass_id                 NUMBER;
BEGIN
  -- Check if wallet is active
  
  BEGIN
    SELECT status INTO v_wallet_status FROM wallet WHERE wallet_id = p_wallet_id and status = 'Active';
  
    -- Check if transaction device is active and get station and line ids
    SELECT status, station_id, line_id INTO v_transaction_device_status, v_station_id, v_line_id
    FROM transaction_device WHERE transaction_device_id = p_transaction_device_id and status = 'Active';
    
    --Checking if transit is active
    select t.transit_id into v_transit_id from transaction_device td join line l on td.line_id = l.line_id and td.transaction_device_id = p_transaction_device_id
    join transit t on l.transit_id = t.transit_id and t.Status = 'Active';
    BEGIN
        -- Get transit price per ride
        SELECT price_per_ride INTO v_transit_price_per_ride FROM transit WHERE transit_id = v_transit_id;
        
        -- Check if wallet is card or ticket
        SELECT wallet_type INTO v_wallet_type FROM wallet WHERE wallet_id = p_wallet_id;
        
        IF v_wallet_type = 'Card' THEN
            -- Check if card has pass
            BEGIN
                SELECT MAX(pass_id) into v_pass_id from PASS P join CARD C on C.card_id=P.card_id 
                join WALLET W on W.wallet_id = C.wallet_id and W.wallet_id = p_wallet_id
                where P.pass_expiry >= SYSDATE;
                INSERT INTO transaction(transaction_id,transaction_type, swipe_time, wallet_id, value, transaction_device_id)
                VALUES(transaction_id_seq.nextval,'Pass', SYSTIMESTAMP AT TIME ZONE 'AMERICA/NEW_YORK', p_wallet_id, 0, p_transaction_device_id);
                COMMIT;
                DBMS_OUTPUT.put_line('Transaction successful. Enjoy your ride!');
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                --PASS IS NOT AVAILABLE so check balance
                BEGIN
                select C.Balance into v_card_balance from WALLET W join CARD C 
                on W.wallet_id = C.wallet_id and W.wallet_id = p_wallet_id and C.Balance >= v_transit_price_per_ride;
                UPDATE CARD set BALANCE = BALANCE - v_transit_price_per_ride where wallet_id = p_wallet_id;
                INSERT INTO transaction(transaction_id,transaction_type, swipe_time, wallet_id, value, transaction_device_id)
                VALUES(transaction_id_seq.nextval,'Balance', SYSTIMESTAMP AT TIME ZONE 'AMERICA/NEW_YORK', p_wallet_id, v_transit_price_per_ride, p_transaction_device_id);
                COMMIT;
                DBMS_OUTPUT.put_line('Transaction successful. Enjoy your ride!');
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        DBMS_OUTPUT.put_line('Insufficient balance on the card!');
                END;
                
            END;
        ELSE 
            --Ticket block
            BEGIN 
                SELECT T.rides into v_ticket_rides from TICKET T where T.wallet_id = p_wallet_id and T.rides >= 1 and T.transit_id = v_transit_id;
                UPDATE TICKET set rides = rides -1 where wallet_id = p_wallet_id;
                INSERT INTO transaction(transaction_id,transaction_type, swipe_time, wallet_id, value, transaction_device_id)
                VALUES(transaction_id_seq.nextval,'Ride', SYSTIMESTAMP AT TIME ZONE 'AMERICA/NEW_YORK', p_wallet_id, v_transit_price_per_ride, p_transaction_device_id);
                COMMIT;
                DBMS_OUTPUT.put_line('Transaction successful. Enjoy your ride!');
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                        DBMS_OUTPUT.put_line('The ticket has no rides left!');
            END;
        END IF;
    END;
  EXCEPTION 
    WHEN NO_DATA_FOUND
        THEN 
    DBMS_OUTPUT.put_line('Transaction declined due to facility being down or wallet is invalid.');
    
 
  END;
END process_transaction;
  /

-- Trigger for pass recharge --
CREATE OR REPLACE TRIGGER pass_recharge
    AFTER INSERT ON RECHARGE
    FOR EACH ROW
    WHEN (new.recharge_type = 'Pass')
DECLARE
    v_Recharge_Value RECHARGE.value_of_transaction%TYPE;
    v_RECHARGE_ID RECHARGE.recharge_id%TYPE;
    v_CARD_ID CARD.card_id%TYPE;
    v_Number_of_days PASS_TYPE.no_of_days%TYPE;
    v_PASS_TYPE PASS_TYPE.pass_type_id%TYPE;
BEGIN
    v_Recharge_Value := :new.value_of_transaction;
    v_RECHARGE_ID := :new.recharge_id;
    select MAX(card_id) INTO v_CARD_ID from CARD where wallet_id = :new.wallet_id;
    select MAX(pass_type_id) INTO v_PASS_TYPE from PASS_TYPE where price = v_Recharge_Value;
    select MAX(no_of_days) INTO v_Number_of_days from PASS_TYPE where price = v_Recharge_Value;
    
    INSERT INTO Pass(card_id,pass_expiry,pass_type_id, recharge_id, valid_from) values (v_CARD_ID,SYSDATE+v_Number_of_days,v_PASS_TYPE,v_RECHARGE_ID,SYSDATE);
    exception
        when others then
            dbms_output.put_line('INVALID TRANSACTION. REVERTING TRANSACTION');
            delete from RECHARGE where recharge_id = v_RECHARGE_ID;
END;
/
--DISABLE TRIGGER pass_recharge ON RECHARGE;
ALter Trigger pass_recharge DISABLE;
--Note: Disabling trigger since this action is taken care in Recharge_Wallet stored procedure

-- Trigger for Operations sequence--
CREATE OR REPLACE TRIGGER Operations_sequence_trigger
    AFTER INSERT ON OPERATIONS
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_station_id OPERATIONS.station_id%TYPE;
    v_line_id OPERATIONS.line_id%TYPE;
    v_recharge_device_id OPERATIONS.recharge_device_id%TYPE;
    v_transaction_device_id OPERATIONS.transaction_device_id%TYPE;
    v_start_time OPERATIONS.start_time%TYPE;
    v_end_time OPERATIONS.end_time%TYPE;
    v_active_query VARCHAR2(300);
    v_inactive_query VARCHAR2(300);
    v_OPERATION_ID OPERATIONS.operation_id%TYPE;
    v_transit_id OPERATIONS.transit_id%TYPE;
BEGIN
    
    v_start_time := :new.start_time;
    v_end_time := :new.end_time;
    v_OPERATION_ID := :new.operation_id;
    
    IF v_end_time > v_start_time THEN
        
    IF :new.station_id IS NOT NULL AND :new.line_id IS NOT NULL THEN
        v_station_id := :new.station_id;
        v_line_id := :new.line_id;
        BEGIN
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_STATION_LINE_'||v_station_id||'_'||v_line_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where station_id = '||v_station_id||' and line_id = '||v_line_id||'; commit;  END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_STATION_LINE_'||v_station_id||'_'||v_line_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where station_id = '||v_station_id||' and line_id = '||v_line_id||'; commit;  END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
        END;
    ELSIF :new.station_id IS NOT NULL THEN
        
            v_station_id := :new.station_id;
        BEGIN
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_STATION_'||v_station_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where station_id = '||v_station_id||'; commit;  END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_STATION_'||v_station_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where station_id = '||v_station_id||'; commit;  END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
       END; 
    ELSIF :new.line_id IS NOT NULL THEN
        
            v_line_id := :new.line_id;
       BEGIN
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_LINE_'||v_line_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where line_id = '||v_line_id||'; commit;  END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_LINE_'||v_line_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where line_id = '||v_line_id||';  commit; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
       END; 
    ELSIF :new.recharge_device_id IS NOT NULL THEN
            v_recharge_device_id := :new.recharge_device_id;
       BEGIN DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_RECHARGE_DEVICE_'||v_recharge_device_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE RECHARGE_DEVICE SET status = ''Inactive'' where recharge_device_id = '||v_recharge_device_id||'; commit;  END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_RECHARGE_DEVICE_'||v_recharge_device_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE RECHARGE_DEVICE SET status = ''Active'' where recharge_device_id = '||v_recharge_device_id||'; commit;  END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
        END;
    ELSIF :new.transit_id IS NOT NULL THEN
       v_transit_id := :new.transit_id;
           BEGIN DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_TRANSIT_'||v_transit_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSIT SET status = ''Inactive'' where transit_id = '||v_transit_id||'; commit; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_TRANSIT_'||v_transit_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSIT SET status = ''Active'' where transit_id = '||v_transit_id||'; commit; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
       END;
    ELSIF :new.transaction_device_id IS NOT NULL THEN
        v_transaction_device_id := :new.transaction_device_id;
        BEGIN DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_TRANSACTION_DEVICE_'||v_transaction_device_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where transaction_device_id = '||v_transaction_device_id||'; commit; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_TRANSACTION_DEVICE_'||v_transaction_device_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where transaction_device_id = '||v_transaction_device_id||'; commit;END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
       END;
    ELSE 
        dbms_output.put_line('INVALID OPERATION. REVERTING OPERATIOON '||v_station_id||' - Nothing');
        delete from OPERATIONS where operation_id = v_OPERATION_ID;
        --insert into failure_logs(message) values('Failed at Operation logs: Invalid id given');
    END IF;
    ELSE
    dbms_output.put_line('START TIME CANNOT BE LATER THAN END TIME. REVERTING OPERATION');
        delete from operations where operation_id = v_OPERATION_ID;
        --insert into failure_logs(message) values('Failed at Operation logs: START TIME IS LATER THAN END TIME');
    END IF;
    commit;
    exception 
    when others then
        dbms_output.put_line('INVALID OPERATION. REVERTING OPERATION ID:'||v_OPERATION_ID||' ID='||:new.operation_id ||' ERROR:'|| sqlerrm);
        delete from OPERATIONS where operation_id = v_OPERATION_ID;
        --insert into failure_logs(message) select 'Failed at Operation logs: SQL EXCEPTION' from dual;
    commit;    
END;
/

--Trigger ON INSERT to Wallet(New wallet creation should lead to creation of ticket or card) --
CREATE OR REPLACE TRIGGER wallet_trigger
AFTER INSERT ON wallet
FOR EACH ROW
BEGIN
  IF :NEW.wallet_type = 'Card' THEN
    INSERT INTO card (balance, wallet_id)
    VALUES (0, :NEW.wallet_id);
  ELSIF :NEW.wallet_type = 'Ticket' THEN
    INSERT INTO ticket (wallet_id, rides, transit_id)
    VALUES (:NEW.wallet_id, NULL, NULL);
  END IF;
END;
/
ALTER TRIGGER  wallet_trigger DISABLE;
--Note: Disabling trigger since this action is taken care in recharge_wallet stored procedure
