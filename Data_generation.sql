set serveroutput on;
declare
    v_loops NUMBER;
    v_counter NUMBER;
begin
    --GENERATE DATA FOR RECHARGE: ENTER value for v_loops for amount of data
    v_loops := 300;
    v_counter := 0;
    WHILE v_loops > v_counter
    
        LOOP
            --SKELETON -> recharge_wallet(p_wallet_id,p_transaction_value,type_of_recharge,recharge_device_id,transit_id for ticket);
            recharge_wallet(null,round(dbms_random.value(1,50)),'Ride',round(dbms_random.value(1,513)),round(dbms_random.value(1,4)));
            recharge_wallet(null,round(dbms_random.value(1,100)),'Pass',round(dbms_random.value(1,513)),round(dbms_random.value(1,4)));
            recharge_wallet(round(dbms_random.value),19,'Ride',round(dbms_random.value(1,513)),2);
            recharge_wallet(round(dbms_random.value),round(dbms_random.value(1,50)),'Balance',round(dbms_random.value(1,513)),1);
            recharge_wallet(round(dbms_random.value),30,'Ride',round(dbms_random.value(1,513)),4);
            recharge_wallet(null,90,'Pass',round(dbms_random.value(1,513)),round(dbms_random.value(1,4)));
            recharge_wallet(null,180,'Pass',round(dbms_random.value(1,513)),round(dbms_random.value(1,4)));
            v_counter := v_counter +1;
        END LOOP;
    update recharge set transaction_time = to_date(transaction_time - round(dbms_random.value(0,2000))) where to_date(transaction_time+1) = to_date(sysdate +1);
    commit;
exception
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line('Something went wrong! ' || sqlerrm);
end;
/
declare
    v_loops NUMBER;
    v_counter NUMBER;
begin
    --GENERATE DATA FOR TAP TRANSACTION: ENTER value for v_loops for amount of data
    v_loops := 300;
    v_counter := 0;
    WHILE v_loops > v_counter
    
        LOOP
            --SKELETON -> process_transaction(p_wallet_id,p_transaction_device_id);
            process_transaction(round(dbms_random.value(1,100)),round(dbms_random.value(1,2000)));
            process_transaction(round(dbms_random.value(1,1000)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(400,1000)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(200,800)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(1000,2000)),round(dbms_random.value(1,2000)));
            process_transaction(round(dbms_random.value(1000,1100)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(1000,1200)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(1000,1300)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(1000,1050)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(1000,1100)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(1000,1100)),round(dbms_random.value(1,890)));
            process_transaction(round(dbms_random.value(100,2000)),round(dbms_random.value(1,2000)));
            v_counter := v_counter +1;
        END LOOP;
    update transaction set swipe_time = to_date(swipe_time - round(dbms_random.value(0,2000))) where to_date(swipe_time+1) = to_date(sysdate +1);
    commit;
exception
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line('Something went wrong! ' || sqlerrm);
end;
