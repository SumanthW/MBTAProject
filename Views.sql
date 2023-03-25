
create or replace view passtype_year as (
select Pass_Type_id,count(*) AS CNT, buy_year from (
select pass_id,Pass_Type_id, EXTRACT(YEAR from transaction_time ) as buy_year from PASS 
left join Recharge
on pass.recharge_id=Recharge.recharge_id
)
group by Pass_Type_id, buy_year
);

create view  total_downtime as (
select sum(cast (end_time as date))-sum(cast(start_time as date)) from operations where end_time is not null);
