--CLEAN UP SCRIPT
set serveroutput on
declare
    v_table_exists varchar(1) := 'Y';
    v_sql varchar(2000);
begin
   dbms_output.put_line('Start schema cleanup');
   for i in (select 'TRANSIT' table_name from dual union all
             select 'WALLET' table_name from dual union all
             select 'TICKET' table_name from dual union all
             select 'STATION' table_name from dual union all
             select 'CARD' table_name from dual union all
             select 'RECHARGE_DEVICE' table_name from dual union all
             select 'RECHARGE' table_name from dual union all
             select 'PASS' table_name from dual union all
             select 'PASS_TYPE' table_name from dual union all
             select 'LINE' table_name from dual union all
             select 'TRANSACTION_DEVICE' table_name from dual union all
             select 'TRANSACTION' table_name from dual union all
             select 'LINE_STATION_CONNECTIONS' table_name from dual union all
             select 'OPERATIONS' table_name from dual

   )
   loop
   dbms_output.put_line('....Dropping table '||i.table_name);
   begin
       select 'Y' into v_table_exists
       from USER_TABLES
       where TABLE_NAME=i.table_name;

       v_sql := 'drop table '||i.table_name || ' cascade constraints';
       execute immediate v_sql;
       dbms_output.put_line('........Table '||i.table_name||' dropped successfully');
       
   exception
       when no_data_found then
           dbms_output.put_line('........Table already dropped');
   end;
   end loop;
   dbms_output.put_line('Schema cleanup successfully completed');
exception
   when others then
      dbms_output.put_line('Failed to execute code:'||sqlerrm);
end;
/

-- TABLE CREATION

CREATE TABLE TRANSIT (transit_id number constraint transit_pk primary key, name varchar(30), status varchar2(8), start_date date, price_per_ride float,CONSTRAINT transit_status_options CHECK (status in ('Active','Inactive')));
CREATE TABLE WALLET(wallet_id number constraint wallet_pk primary key, wallet_type varchar2(6), wallet_expiry date, start_date date, status varchar2(8), CONSTRAINT wallet_type_options CHECK (wallet_type in ('Card','Ticket')), CONSTRAINT wallet_status_options CHECK (status in ('Active','Inactive')));
CREATE TABLE TICKET(ticket_id number constraint ticket_pk primary key, wallet_id number, rides number, transit_id number, FOREIGN KEY(wallet_id) REFERENCES WALLET(wallet_id), FOREIGN KEY(transit_id) REFERENCES TRANSIT(transit_id));
CREATE TABLE STATION (station_id number constraint station_pk primary key, name varchar (30), construction_date date);
CREATE TABLE CARD(card_id number constraint card_pk primary key, Balance number, wallet_id number,FOREIGN KEY(wallet_id) REFERENCES WALLET(wallet_id));
CREATE TABLE RECHARGE_DEVICE(recharge_device_id number constraint recharge_device_pk primary key, station_id number, status varchar2(8), FOREIGN KEY (station_id) REFERENCES STATION(station_id),  CONSTRAINT recharge_device_status_options CHECK (status in ('Active','Inactive')));
CREATE TABLE RECHARGE(recharge_id number constraint recharge_pk primary key, value_of_transaction number, wallet_id number, transaction_time timestamp, recharge_type VARCHAR2(6), recharge_device_id number, FOREIGN KEY(wallet_id) REFERENCES WALLET(wallet_id), FOREIGN KEY(recharge_device_id) REFERENCES RECHARGE_DEVICE(recharge_device_id), CONSTRAINT recharge_type_options CHECK (recharge_type in ('Top-up','Ride','Pass')));
CREATE TABLE PASS_TYPE(pass_type_id number constraint pass_type_pk primary key, price number, no_of_days number, name varchar(12));
CREATE TABLE PASS(pass_id number constraint pass_pk primary key, card_id number, pass_expiry date, pass_type_id number, valid_from date, recharge_id number, FOREIGN KEY(card_id) REFERENCES CARD(card_id), FOREIGN KEY(pass_type_id) REFERENCES PASS_TYPE(pass_type_id), FOREIGN KEY(recharge_id) REFERENCES RECHARGE(recharge_id));
CREATE TABLE LINE(line_id number constraint line_pk primary key, transit_id number, name varchar (30), start_date timestamp, FOREIGN KEY(transit_id) REFERENCES TRANSIT(transit_id));
CREATE TABLE TRANSACTION_DEVICE(transaction_device_id number constraint transaction_device_pk primary key, station_id number, line_id number, status varchar2(8), FOREIGN KEY (station_id) REFERENCES STATION(station_id), FOREIGN KEY (line_id) REFERENCES LINE(line_id),  CONSTRAINT transaction_device_status_options CHECK (status in ('Active','Inactive')));
CREATE TABLE TRANSACTION(transaction_id number constraint transaction_pk primary key, transaction_type varchar(10), swipe_time timestamp, wallet_id number not null, value number, transaction_device_id number, FOREIGN KEY (wallet_id) REFERENCES wallet(wallet_id), FOREIGN KEY (transaction_device_id) REFERENCES TRANSACTION_DEVICE(transaction_device_id), CONSTRAINT transaction_type_options CHECK (transaction_type in ('Pass','Ride','Card_Balance')));
CREATE TABLE LINE_STATION_CONNECTIONS(connection_id number constraint line_station_pk primary key,line_id number,station_id number, FOREIGN KEY(line_id) REFERENCES LINE(line_id), FOREIGN KEY(station_id) REFERENCES STATION(station_id));
CREATE TABLE OPERATIONS(operation_id number constraint operations_pk primary key, start_time timestamp, end_time timestamp, reason varchar(50), 
log_timestamp timestamp, transit_id number, line_id number, station_id number,recharge_device_id number, transaction_device_id number,FOREIGN KEY(transit_id) REFERENCES Transit(transit_id),FOREIGN KEY(line_id) REFERENCES Line(line_id),FOREIGN KEY (station_id) REFERENCES STATION(station_id), FOREIGN KEY (recharge_device_id) REFERENCES RECHARGE_DEVICE(Recharge_Device_id),FOREIGN KEY(transaction_device_id) REFERENCES Transaction_device(transaction_device_id));
/

insert into TRANSIT (name, status , start_date, price_per_ride)
select 'Subway', 'Active', to_date('16-01-2000','dd-mm-yyyy'), 2.9 from dual union all
select 'Bus', 'Active', to_date('29-01-2000','dd-mm-yyyy'), 1.9 from dual union all
select 'Commuter Rail', 'Active', to_date('20-01-2000','dd-mm-yyyy'), 10 from dual union all
select 'Ferry', 'Inactive', to_date('30-01-2000','dd-mm-yyyy'), 30 from dual;

insert into WALLET(wallet_id, wallet_type, wallet_expiry, start_date, status)
select 1, 'Card', to_date('16-01-2020','dd-mm-yyyy'), to_date('16-01-2000','dd-mm-yyyy'), 'Active' from dual union all
select 2, 'Ticket', to_date('01-01-2020','dd-mm-yyyy'), to_date('16-07-2000','dd-mm-yyyy'), 'Inactive' from dual union all
select 3, 'Card', to_date('09-01-2020','dd-mm-yyyy'), to_date('16-09-2000','dd-mm-yyyy'), 'Active' from dual union all
select 4, 'Ticket', to_date('16-09-2020','dd-mm-yyyy'), to_date('19-01-2000','dd-mm-yyyy'), 'Active' from dual;

insert into TICKET (ticket_id, wallet_id, rides, transit_id)
select 1,2,10,1 from dual union all
select 2,2,15,2 from dual union all
select 3,2,4,1 from dual union all
select 4,2,7,3 from dual union all
select 5,2,2,2 from dual;

insert into STATION (station_id, name, construction_date)
select 1,'Ruggles',  to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 2,'BackBay', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 3,'Chinatown', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 4,'Downtown Crossing', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 5,'ForestHill', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 6,'Government Centre', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 7,'Kenmore', to_date('30-01-2000','dd-mm-yyyy') from dual; 

insert into CARD (card_id, balance, wallet_id)
select 1,24.00,1 from dual union all
select 2,9.60,1 from dual union all
select 3,14.40,1 from dual union all
select 4,4.80,1 from dual union all
select 5,2.40,1 from dual;

insert into RECHARGE_DEVICE (station_id, status) 
select 2, 'Active' from dual union all
select 3, 'Inactive' from dual;

insert into RECHARGE (recharge_id, value_of_transaction, wallet_id, transaction_time, recharge_type, recharge_device_id)
select 1, 2.9, 2, to_date('010120 12:00:00','DDMMYY HH24:MI:SS'), 'Top-up', 1 from dual union all
select 2, 10, 1, to_date('010120 11:00:00','DDMMYY HH24:MI:SS'), 'Ride', 1 from dual union all
select 3, 90, 3, to_date('010120 10:00:00','DDMMYY HH24:MI:SS'), 'Pass', 1 from dual union all
select 4, 5, 2, to_date('010120 09:00:00','DDMMYY HH24:MI:SS'), 'Top-up', 1 from dual union all
select 5, 2.9, 4, to_date('010120 12:00:00','DDMMYY HH24:MI:SS'), 'Ride', 1 from dual

insert into PASS_TYPE(pass_type_id, price, no_of_days, name)
select 1,10, 1, '1-day' from dual union all
select 2, 90 , '7-day' from dual union all
select 3, 180, '30-day' from dual;

insert into PASS (pass_id, card_id, valid_from, pass_type_id, expiry_date, recharge_id)
select 1, 1, to_date('01-01-2000','dd-mm-yyyy'), 1, to_date('01-01-2050','dd-mm-yyyy'),3 from dual union all
select 2, 3, to_date('01-10-2000','dd-mm-yyyy'), 2, to_date('01-10-2050','dd-mm-yyyy'),1 from dual union all
select 3, 5, to_date('01-07-2000','dd-mm-yyyy'), 3, to_date('01-07-2050','dd-mm-yyyy'),3 from dual;

insert into LINE (line_id, transit_id, name, start_date)
select 1,1,'Orange line',  to_date('01-01-1980','dd-mm-yyyy') from dual union all
select 2,1,'Red line', to_date('01-01-1981','dd-mm-yyyy') from dual union all
select 3,1,'Green line', to_date('01-01-1982','dd-mm-yyyy') from dual union all
select 4,2,'Route 57', to_date('06-01-2000','dd-mm-yyyy') from dual union all
select 5,2,'Route 66', to_date('30-01-2000','dd-mm-yyyy') from dual;

insert into TRANSACTION_DEVICE (station_id, line_id, status)
select 2,3,'Active' from dual union all
select 1,2,'Inactive' from dual;

insert into TRANSACTION (transaction_type, swipe_time, wallet_id, value, transaction_device_id)
select 'Balance', to_date('010120 12:00:00','DDMMYY HH24:MI:SS'), 1, 20, 3 from dual union all
select 'Ride', to_date('010120 11:00:00','DDMMYY HH24:MI:SS'), 2, 30, 4 from dual union all
select 'Pass', to_date('010120 11:00:00','DDMMYY HH24:MI:SS'), 2, 30, 4 from dual;

insert into LINE_STATION_CONNECTIONS (connections_id, line_id, station_id)
select 1,2,3 from dual union all
select 2,2,2 from dual union all
select 3,3,7 from dual;

insert into OPERATIONS ( operation_id, start_time, end_time, reason, log_timestamp, transit_id, line_id, station_id, recharge_device_id, transaction_device_id) 
select 1,to_date('010123 12:00:00','DDMMYY HH24:MI:SS'), to_date('010123 17:00:00','DDMMYY HH24:MI:SS'), 'Maintenance', CURRENT_TIMESTAMP, 1, 2, 4, 2, 2 from dual union all
select 2,to_date('200123 08:00:00','DDMMYY HH24:MI:SS'), to_date('200123 12:00:00','DDMMYY HH24:MI:SS'), 'Maintenance', CURRENT_TIMESTAMP, 2, 5, 7, 2, 2 from dual;


/






