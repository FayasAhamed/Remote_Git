select * from fruit_imports;

select state, sum(supply) from fruit_imports
group by state
order by sum(supply) desc
limit 1;

select f1.name, f1.season, max(f1.cost_per_unit) from fruit_imports f1
join fruit_imports f2 on f1.id = f2.id
group by f1.season, f2.name;

------------------------------------------------------------------------------
select season, max(cost_per_unit) from fruit_imports
group by season;
select name, season, cost_per_unit from fruit_imports
where cost_per_unit in (select max(cost_per_unit) from fruit_imports
					   group by season);
--To display the name, id or anything corresponding to the above query rows correlated subquery will 
--only work
--correlated query-----

select f1.name,f1.season,f1.cost_per_unit from fruit_imports as f1
where f1.cost_per_unit = (select max(f2.cost_per_unit) from fruit_imports as f2
						   where f1.season=f2.season);
-------------------------------------------------------------------------------		


--CASE usecases----->

SELECT name, sum(supply),
CASE
WHEN sum(supply) < 20000 THEN 'LOW'
WHEN sum(supply) >= 20000 AND sum(supply) < 50000 THEN 'ENOUGH'
WHEN sum(supply) >= 50000 THEN 'FULL'
END AS category
FROM fruit_imports
GROUP BY name
ORDER BY name;

SELECT name, season, sum(supply),
CASE
WHEN sum(supply) < 20000 THEN 'LOW'
WHEN sum(supply) >= 20000 AND sum(supply) < 50000 THEN 'ENOUGH'
WHEN sum(supply) >= 50000 THEN 'FULL'
END AS category
FROM fruit_imports
GROUP BY name, season
ORDER BY name, season;

---------------------------------------------------------------------------
select season, sum(supply*cost_per_unit) as season_cost from fruit_imports
group by season
order by season;
--transposing above to make seasons columns and sum it's values
select
sum(case when season = 'All Year' then supply*cost_per_unit end) as all_year_cost,
sum(case when season = 'Fall' then supply*cost_per_unit end) as fall_cost,
sum(case when season = 'Spring' then supply*cost_per_unit end) as spring_cost,
sum(case when season = 'Summer' then supply*cost_per_unit end) as summer_cost,
sum(case when season = 'Winter' then supply*cost_per_unit end) as winter_cost
from fruit_imports;
----------------------------------------------------------------------------



