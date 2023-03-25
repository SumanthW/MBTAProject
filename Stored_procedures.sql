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

CREATE OR REPLACE TRIGGER Operations_sequence_trigger
    AFTER INSERT OR UPDATE ON OPERATIONS
    FOR EACH ROW
DECLARE
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
    IF :new.station_id IS NOT NULL AND :new.line_id IS NOT NULL THEN
        v_station_id := :new.station_id;
        v_line_id := :new.line_id;
        
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_STATION_LINE_'||v_station_id||'_'||v_line_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where station_id = '||v_station_id||' and line_id = '||v_line_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_STATION_LINE_'||v_station_id||'_'||v_line_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where station_id = '||v_station_id||' and line_id = '||v_line_id||'; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
        
    ELSIF :new.station_id IS NOT NULL THEN
        
            v_station_id := :new.station_id;
        
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_STATION_'||v_station_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where station_id = '||v_station_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_STATION_'||v_station_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where station_id = '||v_station_id||'; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
        
    ELSIF :new.line_id IS NOT NULL THEN
        
            v_line_id := :new.line_id;
       
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_LINE_'||v_line_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where line_id = '||v_line_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_LINE_'||v_line_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where line_id = '||v_line_id||'; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
        
    ELSIF :new.recharge_device_id IS NOT NULL THEN
            v_recharge_device_id := :new.recharge_device_id;
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_RECHARGE_DEVICE_'||v_recharge_device_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE RECHARGE_DEVICE SET status = ''Inactive'' where recharge_device_id = '||v_recharge_device_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_RECHARGE_DEVICE_'||v_recharge_device_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE RECHARGE_DEVICE SET status = ''Active'' where recharge_device_id = '||v_recharge_device_id||'; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
        
    ELSIF :new.transit_id IS NOT NULL THEN
       v_transit_id := :new.transit_id;
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_TRANSIT_'||v_transit_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSIT SET status = ''Inactive'' where transit_id = '||v_transit_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_TRANSIT_'||v_transit_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSIT SET status = ''Active'' where transit_id = '||v_transit_id||'; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
       
    ELSIF :new.transaction_device_id IS NOT NULL THEN
        v_transaction_device_id := :new.transaction_device_id;
        DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_INACTIVE_TRANSACTION_DEVICE_'||v_transaction_device_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Inactive'' where transaction_device_id = '||v_transaction_device_id||'; END;',
            start_date         => v_start_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Inactive'
            );
            DBMS_SCHEDULER.CREATE_JOB (
            job_name           => 'STATUS_ACTIVE_TRANSACTION_DEVICE_'||v_transaction_device_id,
            job_type           => 'PLSQL_BLOCK',
            job_action         => 'BEGIN UPDATE TRANSACTION_DEVICE SET status = ''Active'' where transaction_device_id = '||v_transaction_device_id||'; END;',
            start_date         => v_end_time,
            enabled            => TRUE,
            auto_drop          => TRUE,
            comments           => 'Job to set status as Active'
            );
       
    ELSE 
        dbms_output.put_line('INVALID OPERATION. REVERTING OPERATION');
        delete from OPERATIONS where operation_id = v_OPERATION_ID;
    END IF;
    exception 
    when others then
        dbms_output.put_line('INVALID OPERATION. REVERTING OPERATION');
        delete from OPERATIONS where operation_id = v_OPERATION_ID;
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

