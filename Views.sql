set serveroutput on
declare
    v_view_exists varchar(1) := 'Y';
    v_sql varchar(2000);
begin
   dbms_output.put_line('Start schema cleanup');
   for i in (select 'travels_per_year_per_transit' view_name from dual union all
             select 'total_downtime' view_name from dual union all
             select 'favorite_pass_of_the_year' view_name from dual union all
             select 'REVENUE_YEAR_LINE' view_name from dual union all
             select 'REVENUE_YEAR_TRANSIT' view_name from dual union all
             select 'TOP_FIVE_BUSY_STATIONS' view_name from dual union all
             select 'FRAUDULENT_RECHARGES' view_name from dual union all
             select 'WALLET_DETAILS' view_name from dual union all
             select 'REVENUE_TRANSIT_OVER_YEAR' view_name from dual union all
             select 'total_revenue_year' view_name from dual union all
             select 'stations_in_a_line' view_name from dual union all
             select 'junctions' view_name from dual

             
   )
   loop
   dbms_output.put_line('....Drop table '||i.view_name);
   begin
       select 'Y' into v_view_exists
       from USER_VIEWS
       where VIEW_NAME=i.view_name;

       v_sql := 'drop view '||i.view_name;
       execute immediate v_sql;
       dbms_output.put_line('........Table '||i.view_name||' dropped successfully');
       
   exception
       when no_data_found then
           dbms_output.put_line('........View Table already dropped');
   end;
   end loop;
   dbms_output.put_line('Schema cleanup successfully completed');
exception
   when others then
      dbms_output.put_line('Failed to execute code:'||sqlerrm);
end;
/

--CREATE VIEWS AS PER DATA MODEL
-- Total number of travels in each line every year --

CREATE OR REPLACE VIEW travels_per_year_per_transit as
(select name, A.YR as year, count(A.transaction_id) as travels
from (select transaction_id, transit.name, EXTRACT(YEAR FROM swipe_time) YR 
from transaction 
join transaction_device on transaction.transaction_device_id = transaction_device.transaction_device_id
join line on line.line_id = transaction_device.line_id
join transit on line.transit_id = transit.transit_id) A
group by A.YR,A.name);

--Revenue generated by each line in each year--

CREATE VIEW REVENUE_YEAR_LINE AS
select temp.line, l.name, temp.total_revenue, temp.swipe_year from(
  SELECT td.line_id as line, SUM(t.value) as total_revenue, EXTRACT(YEAR FROM t.swipe_time) as swipe_year
  FROM transaction t 
  JOIN transaction_device td ON td.transaction_device_id = t.transaction_device_id
  GROUP BY td.line_id, EXTRACT(YEAR FROM t.swipe_time)
) temp join line l on temp.line=l.line_id;


-- Revenue generated by each Transit in each year --
CREATE VIEW REVENUE_YEAR_TRANSIT AS
select tr.name, tr.transit_id, temp2.total_revenue, temp2.swipe_year from(
(select sum(temp.total_revenue) as total_revenue, temp.swipe_year, l.transit_id  from(
  SELECT td.line_id as line, SUM(t.value) as total_revenue, EXTRACT(YEAR FROM t.swipe_time) as swipe_year
  FROM transaction t 
  JOIN transaction_device td ON td.transaction_device_id = t.transaction_device_id
  GROUP BY td.line_id, EXTRACT(YEAR FROM t.swipe_time)
) temp join line l on temp.line=l.line_id group by l.transit_id, temp.swipe_year))temp2 join transit tr on temp2.transit_id=tr.transit_id;

-- Revenue generated by each transit over years -- SUM over order by 
CREATE VIEW REVENUE_TRANSIT_OVER_YEAR AS
select name,transit_id, SUM(total_revenue) OVER(PARTITION BY name,transit_id ORDER BY SWIPE_YEAR) REVENUE_OVER_YEARS, SWIPE_YEAR 
FROM
(select tr.name, tr.transit_id, temp2.total_revenue, temp2.swipe_year from(
(select sum(temp.total_revenue) as total_revenue, temp.swipe_year, l.transit_id  from(
  SELECT td.line_id as line, SUM(t.value) as total_revenue, EXTRACT(YEAR FROM t.swipe_time) as swipe_year
  FROM transaction t 
  JOIN transaction_device td ON td.transaction_device_id = t.transaction_device_id
  GROUP BY td.line_id, EXTRACT(YEAR FROM t.swipe_time)
) temp join line l on temp.line=l.line_id group by l.transit_id, temp.swipe_year))temp2 join transit tr on temp2.transit_id=tr.transit_id) H;


-- Top 5 busiest stations of the city --
CREATE VIEW TOP_FIVE_BUSY_STATIONS AS
SELECT swipe_year AS YEAR,LISTAGG(name, ',') WITHIN GROUP (ORDER BY name) as CITY_NAMES
FROM (
  SELECT s.name, td.station_id, EXTRACT(YEAR FROM t.swipe_time) AS swipe_year, count(t.transaction_id) AS total_revenue,
         ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM t.swipe_time) ORDER BY count(t.transaction_id) DESC) AS revenue_rank
  FROM transaction t
  JOIN transaction_device td ON td.transaction_device_id = t.transaction_device_id
  JOIN station s ON s.station_id = td.station_id
  GROUP BY s.name, td.station_id, EXTRACT(YEAR FROM t.swipe_time)
) ranked
WHERE revenue_rank <= 5
group by swipe_year;

-- Wallet details(Showing latest transaction for each wallet id)--

CREATE VIEW WALLET_DETAILS AS
select temp3.wallet_id,temp3.wallet_type,temp3.status,temp3.pass_expiry,temp3.pass_name,temp3.balance,temp3.rides,temp4.swipe from (select wallet_id, wallet_type,start_date,status,pass_expiry,name as PASS_NAME, BALANCE , RIDES from(
select * from(
(select w.wallet_id,w.wallet_type,w.wallet_expiry,w.start_date,w.status,c.card_id as ID,c.balance, NULL as RIDES from wallet w
join card c on  c.wallet_id = w.wallet_id union all
select w.wallet_id,w.wallet_type, w.wallet_expiry,w.start_date,w.status, t.ticket_id as ID,NuLL,t.rides from wallet w
join ticket t on t.wallet_id = w.wallet_id))temp left outer join pass p on p.card_id=temp.ID and wallet_type='Card')temp2 left outer join pass_type pt on temp2.pass_type_id=pt.pass_type_id)temp3 left outer join (select max(swipe_time) as swipe, wallet_id from transaction group by wallet_id) temp4 on temp4.wallet_id = temp3.wallet_id;

-- Fraudulent cards (Checks if card was recharged by some fradulent device)--
CREATE VIEW FRAUDULENT_RECHARGES AS 
select r.WALLET_ID, r.RECHARGE_DEVICE_ID, r.TRANSACTION_TIME, r.RECHARGE_TYPE, rd.STATION_ID from recharge r
join recharge_device rd on rd.recharge_device_id = r.recharge_device_id where r.recharge_device_id = NULL;

--View to know which was the pass purchased by a lot of people in a particular year--

CREATE OR REPLACE VIEW favorite_pass_of_year AS (
select name,year from 
    (select A.name, year, RANK() OVER(PARTITION BY YEAR ORDER BY CNT DESC) as RNK 
        from ( select PT.name, EXTRACT(YEAR from valid_from) year,count(pass_id) CNT 
                from PASS P join PASS_TYPE PT on P.pass_type_id=PT.pass_type_id GROUP BY PT.name,EXTRACT(YEAR from valid_from)
             ) A ) B where B.rnk = 1
 );
-- Total downtime of facilities due to operations --
create or replace view total_downtime as (
select to_char(sum(cast (end_time as date)-cast(start_time as date))) || ' days' as downtime from operations where end_time is not null);

--JUNCTIONS OF THE SYSTEM --
CREATE OR REPLACE VIEW junctions AS (
select station.name STATION_NAME FROM
(select station_id,count(distinct line_id) CNT from line_station_connections group by station_id having count(distinct line_id)>1) A join
STATION ON STATION.station_id = A.station_id);
-- Stations in particular line--
CREATE OR REPLACE VIEW stations_in_a_line as(
select LINE.name, listagg(station.name,',') station_sequence from LINE_STATION_CONNECTIONS
join station on LINE_STATION_CONNECTIONS.station_id = station.station_id
join line on LINE_STATION_CONNECTIONS.line_id = line.line_id
group by line.name);
-- Total revenue per year--
CREATE OR REPLACE VIEW total_revenue_year as(
select extract (year from transaction_time) as year, ' $'||to_char(sum(value_of_transaction)) total_revenue from recharge
group by extract (year from transaction_time)
);

/
