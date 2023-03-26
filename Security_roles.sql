--create roles and grant every role correspoding PRIVILEGES on table and VIEW

create role admini;

grant all on Pass_Type to admini;

grant all on Pass to admini;

grant all on Wallet to admini;

grant all on Ticket to admini;

grant all on Card to admini;

grant all on Recharge to admini;

grant all on Transaction to admini;

grant all on Recharge_Device to admini;

grant all on Transaction_Device to admini;

grant all on Operations to admini;

grant all on Transit to admini;

grant all on Line to admini;

grant all on Station to admini;

grant all on Line_station_connections to admini;

grant all on travels_per_year_per_transit to admini;   -- Views grant--  

grant all on total_downtime to admini; 

grant all on total_revenue_year to admini;

grant all on REVENUE_YEAR_LINE to admini;   

grant all on REVENUE_YEAR_TRANSIT to admini;  

grant all on TOP_FIVE_BUSY_STATIONS to admini;  

grant all on WALLET_DETAILS to admini; 

grant all on REVENUE_TRANSIT_OVER_YEAR to admini; 

grant all on FRAUDULENT_RECHARGES to admini; 

grant all on favorite_pass_of_the_year to admini; 

grant all on junctions to admini; 

grant all on stations_in_a_line to admini; 









create role developer;

grant all on Pass_Type to developer;

grant all on Pass to developer;

grant all on Wallet to developer;

grant all on Ticket to developer;

grant all on Card to developer;

grant all on Recharge to developer;

grant all on Transaction to developer;

grant all on Recharge_Device to developer;

grant all on Transaction_Device to developer;

grant all on Operations to developer;

grant all on Transit to developer;

grant all on Line to developer;

grant all on Station to developer;

grant all on Line_station_connections to developer;

grant all on travels_per_year_per_transit to developer;   -- Views grant--

grant all on total_downtime to developer;

grant all on total_revenue_year to developer;

grant all on REVENUE_YEAR_LINE to developer;

grant all on REVENUE_YEAR_TRANSIT to developer;

grant all on TOP_FIVE_BUSY_STATIONS to developer;

grant all on WALLET_DETAILS to developer;

grant all on REVENUE_TRANSIT_OVER_YEAR to developer;

grant all on FRAUDULENT_RECHARGES to developer;

grant all on favorite_pass_of_the_year to developer;

grant all on junctions to developer;

grant all on stations_in_a_line to developer;




 




create role QA;

grant select on Pass_Type to QA;

grant select on Pass to QA;

grant select on Wallet to QA;

grant select on Ticket to QA;

grant select on Card to QA;

grant select on Recharge to QA;

grant select on Transaction to QA;

grant select on Recharge_Device to QA;

grant select on Transaction_Device to QA;

grant select on Operations to QA;

grant select on Transit to QA;

grant select on Line to QA;

grant select on Station to QA;

grant select on Line_station_connections to QA;

grant select on travels_per_year_per_transit to QA;   -- Views grant--

grant select on total_downtime to QA;

grant select on total_revenue_year to QA;

grant select on REVENUE_YEAR_LINE to QA;

grant select on REVENUE_YEAR_TRANSIT to QA;

grant select on TOP_FIVE_BUSY_STATIONS to QA;

grant select on WALLET_DETAILS to QA;

grant select on REVENUE_TRANSIT_OVER_YEAR to QA;

grant select on FRAUDULENT_RECHARGES to QA;

grant select on favorite_pass_of_the_year to QA;

grant select on junctions to QA;

grant select on stations_in_a_line to QA;










create role transit_officer;

grant select on operation to transit_officer;

grant select on Line to transit_officer;

grant select on Transit to transit_officer;

grant select on Station to transit_officer;

grant select on Line_station_connections to transit_officer;

grant select on WALLET_DETAILS to transit_officer; -- VIEWS--  

grant select on FRAUDULENT_RECHARGES to transit_officer;

grant select on junctions to transit_officer;

grant select on stations_in_a_line to transit_officer;










create role finance_officer;

grant select on Pass_Type to finance_officer;

grant select on Recharge to finance_officer;

grant select on Transaction to finance_officer;

grant select on Operations to finance_officer;

grant select on Transit to finance_officer;

grant select on Line to finance_officer;

grant select on Station to finance_officer;

grant select on Line_station_connections to finance_officer;

grant select on total_downtime to finance_officer; -- views grant --

grant select on REVENUE_YEAR_LINE to finance_officer;

grant select on REVENUE_YEAR_TRANSIT to finance_officer;

grant select on TOP_FIVE_BUSY_STATIONS to finance_officer;

grant select on junctions to finance_officer;

grant select on travels_per_year_per_transit to finance_officer;

grant select on total_revenue_year to finance_officer; 

grant select on REVENUE_TRANSIT_OVER_YEAR to finance_officer;








create role L1_officer;

grant select,update, insert, delete on Pass_Type to L1_officer;

grant select,update, insert, delete on Recharge_Device to L1_officer;

grant select,update, insert, delete on Transaction_Device to L1_officer;

grant select,update, insert, delete on Operations to L1_officer;

grant select,update, insert, delete on Transit to L1_officer;

grant select,update, insert, delete on Line to L1_officer;

grant select,update, insert, delete on Station to L1_officer;

grant select,update, insert, delete on Line_station_connections to L1_officer;

grant select on travels_per_year_per_transit to L1_officer;   -- Views grant--

grant select on total_downtime to L1_officer; 

grant select on TOP_FIVE_BUSY_STATIONS to L1_officer;

grant select on FRAUDULENT_RECHARGES to L1_officer;

grant select on stations_in_a_line to L1_officer;

grant select on junctions to L1_officer;








create role L2_officer;

grant all on Pass_Type to L2_officer;

grant all on Pass to L2_officer;

grant all on Wallet to L2_officer;

grant all on Ticket to L2_officer;

grant all on Card to L2_officer;

grant all on Recharge to L2_officer;

grant all on Transaction to L2_officer;

grant all on Recharge_Device to L2_officer;

grant all on Transaction_Device to L2_officer;

grant all on Operations to L2_officer;

grant all on Transit to L2_officer;

grant all on Line to L2_officer;

grant all on Station to L2_officer;

grant all on Line_station_connections to L2_officer;

  -- Views grant--

grant select on TOP_FIVE_BUSY_STATIONS to L2_officer;

grant select on stations_in_a_line to L2_officer;

grant select on junctions to L2_officer;

commit;

