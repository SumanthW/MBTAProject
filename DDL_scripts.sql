--CLEAN UP SCRIPT
set serveroutput on
declare
    v_table_exists varchar(1) := 'Y';
    v_sql varchar(2000);
begin
   dbms_output.put_line('Start schema cleanup');
   for i in (select 'WALLET' table_name from dual union all
             select 'TICKET' table_name from dual union all
             select 'CARD' table_name from dual union all
             select 'RECHARGE' table_name from dual union all
             select 'PASS' table_name from dual union all
             select 'PASS_TYPE' table_name from dual union all
             select 'Transit' table_name from dual union all
             select 'Recharge_Device' table_name from dual union all
             select 'Transaction' table_name from dual union all
             select 'Transaction_Device' table_name from dual union all
             select 'Line' table_name from dual union all
             select 'Station' table_name from dual union all
             select 'Operations' table_name from dual union all
             select 'Line_station_connections' table_name from dual

   )
   loop
   dbms_output.put_line('....Dropping table '||i.table_name);
   begin
       select 'Y' into v_table_exists
       from USER_TABLES
       where TABLE_NAME=i.table_name;

       v_sql := 'drop table '||i.table_name;
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

-- TABLE CREATION
create table Transit (transit_id number(10) constraint transit_id primary key, name varchar(30), status varchar2(8), start_date date, price_per_ride float, CONSTRAINT transit_status_options CHECK (status in ('Active','Inactive'));
CREATE TABLE WALLET(wallet_id number GENERATED BY DEFAULT AS IDENTITY, wallet_type varchar2(6), wallet_expiry date, start_date date, status varchar2(8), PRIMARY KEY(wallet_id)), CONSTRAINT wallet_type_options CHECK (wallet_type in ('Card','Ticket')), CONSTRAINT wallet_status_options CHECK (status in ('Active','Inactive')));
CREATE TABLE TICKET(ticket_id number GENERATED BY DEFAULT AS IDENTITY, wallet_id number, rides number, transit_id number, PRIMARY KEY(ticket_id), FOREIGN KEY(wallet_id) REFERENCES WALLET(wallet_id), FOREIGN KEY(transit_id) REFERENCES TRANSIT(transit_id));
CREATE TABLE CARD(card_id number GENERATED BY DEFAULT AS IDENTITY, Balance number, wallet_id number, PRIMARY KEY(card_id), FOREIGN KEY(wallet_id) REFERENCES WALLET(wallet_id));
create table Recharge_Device(recharge_device_id number(10) constraint recharge_device_id primary key, station_id number, status varchar2(8), constraint fk_station foreign key (station_id) references station(station_id)),  CONSTRAINT recharge_device_status_options CHECK (status in ('Active','Inactive');
CREATE TABLE RECHARGE(recharge_id number GENERATED BY DEFAULT AS IDENTITY, value_of_transaction number, wallet_id number, transaction_time timestamp, recharge_type VARCHAR2(6), recharge_device_id number, PRIMARY KEY(recharge_id), FOREIGN KEY(wallet_id) REFERENCES WALLET(wallet_id), FOREIGN KEY(recharge_device_id) REFERENCES RECHARGE_DEVICE(recharge_device_id), CONSTRAINT recharge_type_options CHECK (recharge_type in ('Top-up','Ride','Pass')));
CREATE TABLE PASS(pass_id number GENERATED BY DEFAULT AS IDENTITY, card_id number, pass_expiry date, pass_type_id number, valid_from date, recharge_id number, PRIMARY KEY(pass_id), FOREIGN KEY(card_id) REFERENCES CARD(card_id), FOREIGN KEY(pass_type_id) REFERENCES PASS_TYPE(pass_type_id), FOREIGN KEY(recharge_id) REFERENCES RECHARGE(recharge_id));
CREATE TABLE PASS_TYPE(pass_type_id number GENERATED BY DEFAULT AS IDENTITY, price number, no_of_days number, name varchar(12), PRIMARY KEY(pass_type_id));

create table Transaction_Device(transaction_device_id constraint transaction_device_id primary key, station_id number, line_id number, status varchar2(8), constraint fk_station foreign key (station_id) references station(station_id), constraint fk_line foreign key (line_id) references line(line_id),  CONSTRAINT transaction_device_status_options CHECK (status in ('Active','Inactive'));
create table Transaction(transaction_id number(10) constraint transaction_id primary key, transaction_type varchar(10), swipe_time timestamp, wallet_id number not null, value number, transaction_device_id number, constraint fk_wallet foreign key (wallet_id) references wallet(wallet_id), constraint fk_transaction foreign key (transaction_device_id) references transaction_device(transaction_device_id));

CREATE TABLE LINE (line_id number GENERATED BY DEFAULT AS IDENTITY, FOREIGN KEY (transit_id) REFERENCES Transit(transit_id), name varchar (30), start_date datetime, PRIMARY KEY(line_id)));
CREATE TABLE STATION (station_id number GENERATED BY DEFAULT AS IDENTITY, name varchar (30), contruction_date datetime, PRIMARY KEY(station_id)));
CREATE TABLE OPERATIONS (operation_id number GENERATED BY DEFAULT AS IDENTITY, start_time datetime, end_time datetime, reason varchar(50), log_timestamp timestamp, FOREIGN KEY (transit_id) REFERENCES Transit(transit_id),FOREIGN KEY (line_id) REFERENCES Line(line_id), FOREIGN KEY (station_id) REFERENCES STATION(station_id), FOREIGN KEY (recharge_device_id) REFERENCES RECHARGE_DEVICE(Recharge_Device_id), FOREIGN KEY (transaction_device_id) REFERENCES Transaction_device(transaction_device_id), PRIMARY KEY(operation_id)) );
CREATE TABLE LINE_STATION_CONNECTIONS (connection_id number GENERATED BY DEFAULT AS IDENTITY, FOREIGN KEY (line_id) REFERENCES Line(Line_id), FOREIGN KEY (station_id) REFERENCES Station(Station_id), PRIMARY KEY(connectiton_id)) );
