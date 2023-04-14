--create roles and grant every role correspoding PRIVILEGES on table and VIEW

--CLEAN UP SCRIPT
set serveroutput on
declare
    
    v_sql varchar(2000);
begin
   dbms_output.put_line('Start schema cleanup');
   for i in (select 'admini' role_name from dual union all
             select 'developer' role_name from dual union all
             select 'QA' role_name from dual union all
             select 'transit_officer' role_name from dual union all
             select 'finance_officer' role_name from dual union all
             select 'L1_officer' role_name from dual union all
             select 'L2_officer' role_name from dual             
   )
   loop
   dbms_output.put_line('....Dropping role '||i.role_name);
   begin
       
       v_sql := 'drop role '||i.role_name;
       execute immediate v_sql;
       dbms_output.put_line('........Role '||i.role_name||' dropped successfully');
       
   exception
       when no_data_found then
           dbms_output.put_line('........Role already dropped');
   end;
   end loop;
   dbms_output.put_line('Schema cleanup successfully completed');
exception
   when others then
      dbms_output.put_line('Failed to execute code:'||sqlerrm);
end;
/

--USER CLEANUP
declare
    
    v_sql varchar(2000);
begin
   dbms_output.put_line('Start schema cleanup');
   for i in (select 'Hu' user_name from dual union all
             select 'Gayatri' user_name from dual union all
             select 'Sumanth' user_name from dual union all
             select 'Shrimoyee' user_name from dual            
   )
   loop
   dbms_output.put_line('....Dropping user '||i.user_name);
   begin
       
       v_sql := 'drop user '||i.user_name;
       execute immediate v_sql;
       dbms_output.put_line('........user '||i.user_name||' dropped successfully');
       
   exception
       when no_data_found then
           dbms_output.put_line('........user already dropped');
   end;
   end loop;
   dbms_output.put_line('Schema cleanup successfully completed');
exception
   when others then
      dbms_output.put_line('Failed to execute code:'||sqlerrm);
end;
/






create role admini;

grant all on ADMIN.Pass_Type to admini;

grant all on ADMIN.Pass to admini;

grant all on ADMIN.Wallet to admini;

grant all on ADMIN.Ticket to admini;

grant all on ADMIN.Card to admini;

grant all on ADMIN.Recharge to admini;

grant all on ADMIN.Transaction to admini;

grant all on ADMIN.Recharge_Device to admini;

grant all on ADMIN.Transaction_Device to admini;

grant all on ADMIN.Operations to admini;

grant all on ADMIN.Transit to admini;

grant all on ADMIN.Line to admini;

grant all on ADMIN.Station to admini;

grant all on ADMIN.Line_station_connections to admini;

grant all on ADMIN.travels_per_year_per_transit to admini;   -- Views grant--  

grant all on ADMIN.total_downtime to admini; 

grant all on ADMIN.total_revenue_year to admini;

grant all on ADMIN.REVENUE_YEAR_LINE to admini;   

grant all on ADMIN.REVENUE_YEAR_TRANSIT to admini;  

grant all on ADMIN.TOP_FIVE_BUSY_STATIONS to admini;  

grant all on ADMIN.WALLET_DETAILS to admini; 

grant all on ADMIN.REVENUE_TRANSIT_OVER_YEAR to admini; 

grant all on ADMIN.FRAUDULENT_RECHARGES to admini; 

grant all on ADMIN.favorite_pass_of_the_year to admini; 

grant all on ADMIN.junctions to admini; 

grant all on ADMIN.stations_in_a_line to admini; 

GRANT EXECUTE ON ADMIN.is_facility_up TO admini;
 GRANT EXECUTE ON ADMIN.can_transact TO admini;
 GRANT EXECUTE ON ADMIN.which_transit TO admini;
 GRANT EXECUTE ON ADMIN.RECHARGE_WALLET TO admini;
 GRANT EXECUTE ON ADMIN.update_wallet_status TO admini;
 GRANT EXECUTE ON ADMIN.process_transaction TO admini;
 GRANT EXECUTE ON ADMIN.check_pass_valid TO admini;











create role developer;

grant all on ADMIN.Pass_Type to developer;

grant all on ADMIN.Pass to developer;

grant all on ADMIN.Wallet to developer;

grant all on ADMIN.Ticket to developer;

grant all on ADMIN.Card to developer;

grant all on ADMIN.Recharge to developer;

grant all on ADMIN.Transaction to developer;

grant all on ADMIN.Recharge_Device to developer;

grant all on ADMIN.Transaction_Device to developer;

grant all on ADMIN.Operations to developer;

grant all on ADMIN.Transit to developer;

grant all on ADMIN.Line to developer;

grant all on ADMIN.Station to developer;

grant all on ADMIN.Line_station_connections to developer;

grant all on ADMIN.travels_per_year_per_transit to developer;   -- Views grant--

grant all on ADMIN.total_downtime to developer;

grant all on ADMIN.total_revenue_year to developer;

grant all on ADMIN.REVENUE_YEAR_LINE to developer;

grant all on ADMIN.REVENUE_YEAR_TRANSIT to developer;

grant all on ADMIN.TOP_FIVE_BUSY_STATIONS to developer;

grant all on ADMIN.WALLET_DETAILS to developer;

grant all on ADMIN.REVENUE_TRANSIT_OVER_YEAR to developer;

grant all on ADMIN.FRAUDULENT_RECHARGES to developer;

grant all on ADMIN.favorite_pass_of_the_year to developer;

grant all on ADMIN.junctions to developer;

grant all on ADMIN.stations_in_a_line to developer;


GRANT EXECUTE ON ADMIN.is_facility_up TO developer;
GRANT EXECUTE ON ADMIN.can_transact TO developer;
GRANT EXECUTE ON ADMIN.which_transit TO developer;
GRANT EXECUTE ON ADMIN.RECHARGE_WALLET TO developer;
GRANT EXECUTE ON ADMIN.update_wallet_status TO developer;
GRANT EXECUTE ON ADMIN.process_transaction TO developer;
GRANT EXECUTE ON ADMIN.check_pass_valid TO developer;

 




create role QA;

grant select on ADMIN.Pass_Type to QA;

grant select on ADMIN.Pass to QA;

grant select on ADMIN.Wallet to QA;

grant select on ADMIN.Ticket to QA;

grant select on ADMIN.Card to QA;

grant select on ADMIN.Recharge to QA;

grant select on ADMIN.Transaction to QA;

grant select on ADMIN.Recharge_Device to QA;

grant select on ADMIN.Transaction_Device to QA;

grant select on ADMIN.Operations to QA;

grant select on ADMIN.Transit to QA;

grant select on ADMIN.Line to QA;

grant select on ADMIN.Station to QA;

grant select on ADMIN.Line_station_connections to QA;

grant select on ADMIN.travels_per_year_per_transit to QA;   -- Views grant--

grant select on ADMIN.total_downtime to QA;

grant select on ADMIN.total_revenue_year to QA;

grant select on ADMIN.REVENUE_YEAR_LINE to QA;

grant select on ADMIN.REVENUE_YEAR_TRANSIT to QA;

grant select on ADMIN.TOP_FIVE_BUSY_STATIONS to QA;

grant select on ADMIN.WALLET_DETAILS to QA;

grant select on ADMIN.REVENUE_TRANSIT_OVER_YEAR to QA;

grant select on ADMIN.FRAUDULENT_RECHARGES to QA;

grant select on ADMIN.favorite_pass_of_the_year to QA;

grant select on ADMIN.junctions to QA;

grant select on ADMIN.stations_in_a_line to QA;










create role transit_officer;

grant select on ADMIN.operations to transit_officer;

grant select on ADMIN.Line to transit_officer;

grant select on ADMIN.Transit to transit_officer;

grant select on ADMIN.Station to transit_officer;

grant select on ADMIN.Line_station_connections to transit_officer;

grant select on ADMIN.WALLET_DETAILS to transit_officer; -- VIEWS--  

grant select on ADMIN.FRAUDULENT_RECHARGES to transit_officer;

grant select on ADMIN.junctions to transit_officer;

grant select on ADMIN.stations_in_a_line to transit_officer;










create role finance_officer;

grant select on ADMIN.Pass_Type to finance_officer;

grant select on ADMIN.Recharge to finance_officer;

grant select on ADMIN.Transaction to finance_officer;

grant select on ADMIN.Operations to finance_officer;

grant select on ADMIN.Transit to finance_officer;

grant select on ADMIN.Line to finance_officer;

grant select on ADMIN.Station to finance_officer;

grant select on ADMIN.Line_station_connections to finance_officer;

grant select on ADMIN.total_downtime to finance_officer; -- views grant --

grant select on ADMIN.REVENUE_YEAR_LINE to finance_officer;

grant select on ADMIN.REVENUE_YEAR_TRANSIT to finance_officer;

grant select on ADMIN.TOP_FIVE_BUSY_STATIONS to finance_officer;

grant select on ADMIN.junctions to finance_officer;

grant select on ADMIN.travels_per_year_per_transit to finance_officer;

grant select on ADMIN.total_revenue_year to finance_officer; 

grant select on ADMIN.REVENUE_TRANSIT_OVER_YEAR to finance_officer;








create role L1_officer;

grant select,update, insert, delete on ADMIN.Pass_Type to L1_officer;

grant select,update, insert, delete on ADMIN.Recharge_Device to L1_officer;

grant select,update, insert, delete on ADMIN.Transaction_Device to L1_officer;

grant select,update, insert, delete on ADMIN.Operations to L1_officer;

grant select,update, insert, delete on ADMIN.Transit to L1_officer;

grant select,update, insert, delete on ADMIN.Line to L1_officer;

grant select,update, insert, delete on ADMIN.Station to L1_officer;

grant select,update, insert, delete on ADMIN.Line_station_connections to L1_officer;

grant select on ADMIN.travels_per_year_per_transit to L1_officer;   -- Views grant--

grant select on ADMIN.total_downtime to L1_officer; 

grant select on ADMIN.TOP_FIVE_BUSY_STATIONS to L1_officer;

grant select on ADMIN.FRAUDULENT_RECHARGES to L1_officer;

grant select on ADMIN.stations_in_a_line to L1_officer;

grant select on ADMIN.junctions to L1_officer;








create role L2_officer;

grant all on ADMIN.Pass_Type to L2_officer;

grant all on ADMIN.Pass to L2_officer;

grant all on ADMIN.Wallet to L2_officer;

grant all on ADMIN.Ticket to L2_officer;

grant all on ADMIN.Card to L2_officer;

grant all on ADMIN.Recharge to L2_officer;

grant all on ADMIN.Transaction to L2_officer;

grant all on ADMIN.Recharge_Device to L2_officer;

grant all on ADMIN.Transaction_Device to L2_officer;

grant all on ADMIN.Operations to L2_officer;

grant all on ADMIN.Transit to L2_officer;

grant all on ADMIN.Line to L2_officer;

grant all on ADMIN.Station to L2_officer;

grant all on ADMIN.Line_station_connections to L2_officer;

  -- Views grant--

grant select on ADMIN.TOP_FIVE_BUSY_STATIONS to L2_officer;

grant select on ADMIN.stations_in_a_line to L2_officer;

grant select on ADMIN.junctions to L2_officer;



create user Hu identified by abcd12341234A;

create user Gayatri identified by abcd12341234A;

create user Sumanth identified by abcd12341234A;

CREATE USER Shrimoyee IDENTIFIED BY abcd12341234A;

grant connect, resource to Hu;

grant connect, resource to Gayatri;

grant connect, resource to Sumanth;

grant connect, resource to Shrimoyee;

ALTER USER Hu QUOTA 4000 M ON data;

ALTER USER Gayatri QUOTA 4000 M ON data;

ALTER USER Sumanth QUOTA 3000 M ON data;

ALTER USER Shrimoyee QUOTA 2000 M ON data;

grant developer to Hu;

grant admini to Gayatri;

grant QA to Sumanth;

grant transit_officer to Shrimoyee;
