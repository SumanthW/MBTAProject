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

set serveroutput on
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
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where station_id = '||v_station_id||' and line_id = '||v_line_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_STATION_LINE_'||v_station_id||'_'||v_line_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where station_id = '||v_station_id||' and line_id = '||v_line_id||'; END;',
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
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where station_id = '||v_station_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_STATION_'||v_station_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where station_id = '||v_station_id||'; END;',
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
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where line_id = '||v_line_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_LINE_'||v_line_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where line_id = '||v_line_id||'; END;',
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
            job_action         => 'BEGIN UPDATE RECHARGE_DEVICE SET status = ''Inactive'' where recharge_device_id = '||v_recharge_device_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_RECHARGE_DEVICE_'||v_recharge_device_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE RECHARGE_DEVICE SET status = ''Active'' where recharge_device_id = '||v_recharge_device_id||'; END;',
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
            job_action         => 'BEGIN UPDATE TRANSIT SET status = ''Inactive'' where transit_id = '||v_transit_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_TRANSIT_'||v_transit_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSIT SET status = ''Active'' where transit_id = '||v_transit_id||'; END;',
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
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where transaction_device_id = '||v_transaction_device_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_TRANSACTION_DEVICE_'||v_transaction_device_id||'_OP_ID_'||v_OPERATION_ID,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where transaction_device_id = '||v_transaction_device_id||'; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
       END;
    ELSE 
        dbms_output.put_line('INVALID OPERATION. REVERTING OPERATIOON '||v_station_id||' - Nothing');
        --delete from OPERATIONS where operation_id = v_OPERATION_ID;
        --insert into failure_logs(message) values('Failed at Operation logs: Invalid id given');
    END IF;
    ELSE
    dbms_output.put_line('START TIME CANNOT BE LATER THAN END TIME. REVERTING OPERATION');
        --delete from operations where operation_id = v_OPERATION_ID;
        --insert into failure_logs(message) values('Failed at Operation logs: START TIME IS LATER THAN END TIME');
    END IF;
    exception 
    when others then
        dbms_output.put_line('INVALID OPERATION. REVERTING OPERATION ID:'||v_OPERATION_ID||' ID='||:new.operation_id ||' ERROR:'|| sqlerrm);
        --delete from OPERATIONS where operation_id = v_OPERATION_ID;
        --insert into failure_logs(message) select 'Failed at Operation logs: SQL EXCEPTION' from dual;
END;

/

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
    select line_id into v_id_present from operations where line_id = facility_id and systimestamp AT TIME ZONE 'GMT'  between start_time and end_time;
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
    select station_id into v_id_present from operations where station_id = facility_id and systimestamp AT TIME ZONE 'GMT' between start_time and end_time;
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
    select recharge_device_id into v_id_present from operations where recharge_device_id = facility_id and systimestamp AT TIME ZONE 'GMT'  between start_time and end_time;
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
    select transaction_device_id into v_id_present from operations where transaction_device_id = facility_id and systimestamp AT TIME ZONE 'GMT'  between start_time and end_time;
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
        join pass p on c.card_id = p.card_id and systimestamp AT TIME ZONE 'GMT' between valid_from and pass_expiry;
        
        RETURN v_present;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_present := NULL;
    END;
    BEGIN
        select 'Ride' into v_present from
        wallet w join ticket t on w.wallet_id =t.wallet_id  and w.wallet_id=i_wallet_id and t.rides>0 and w.wallet_expiry >= systimestamp AT TIME ZONE 'GMT';
    
        RETURN v_present;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        v_present := NULL;
    END;
    BEGIN
        select 'Balance' into v_present from
        wallet w join card c on w.wallet_id = c.wallet_id  and w.wallet_id=i_wallet_id and c.balance>0 and w.wallet_expiry >= systimestamp AT TIME ZONE 'GMT'; 
    
        RETURN v_present;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        v_present := NULL;
    END;
        
    

RETURN v_present;
END;
/

CREATE OR REPLACE PROCEDURE recharge_card (p_wallet_id NUMBER, p_value_of_transaction NUMBER,recharge_type varchar)
IS
BEGIN
if recharge_type = 'Top-up'
then
  UPDATE CARD
     SET Balance = Balance + p_value_of_transaction
   WHERE wallet_id = p_wallet_id;
end if
END recharge_card;


-- Gayatri Trigger ON INSERT to Wallet(New wallet creation should lead to creation of ticket or card) --
-- Create the trigger
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

-- Gayatri function --
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

