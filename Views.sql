

CREATE OR REPLACE VIEW favorite_pass_of_year AS (
select name,year from 
    (select A.name, year, RANK() OVER(PARTITION BY YEAR ORDER BY CNT DESC) as RNK 
        from ( select PT.name, EXTRACT(YEAR from valid_from) year,count(pass_id) CNT 
                from PASS P join PASS_TYPE PT on P.pass_type_id=PT.pass_type_id GROUP BY PT.name,EXTRACT(YEAR from valid_from)
             ) A ) B where B.rnk = 1
 );

create or replace view total_downtime as (
select to_char(sum(cast (end_time as date)-cast(start_time as date))) || ' days' as downtime from operations where end_time is not null);

--JUNCTIONS OF THE SYSTEM
CREATE OR REPLACE VIEW junctions AS (
select station.name STATION_NAME FROM
(select station_id,count(distinct line_id) CNT from line_station_connections group by station_id having count(distinct line_id)>1) A join
STATION ON STATION.station_id = A.station_id);

CREATE OR REPLACE VIEW stations_in_a_line as(
select LINE.name, listagg(station.name,',') station_sequence from LINE_STATION_CONNECTIONS
join station on LINE_STATION_CONNECTIONS.station_id = station.station_id
join line on LINE_STATION_CONNECTIONS.line_id = line.line_id
group by line.name);

CREATE OR REPLACE VIEW total_revenue_year as(
select extract (year from transaction_time) as year, ' $'||to_char(sum(value_of_transaction)) total_revenue from recharge
group by extract (year from transaction_time)
);
