--Query 2--

select BoroughName ,datename(weekday,cast(issuedate as date)) as 'day_of_the_week', COUNT(ViolationCode) as 'Violation count'
from FactParkingViolation as F inner join DimLocation as loc
on F.locationkey = loc.locationkey inner join DimBorough as boro
on loc.BoroughCode=boro.BoroughCode
where year(cast(issuedate as DATE)) between 2015 and 2017
group by BoroughName, datename(weekday,cast(issuedate as date))
order by BoroughName,'day_of_the_week'

alter procedure sp_week_day
@week_day varchar(10)
as
begin
	select BoroughName ,datename(weekday,cast(issuedate as date)) as 'day_of_the_week',
	COUNT(ViolationCode) as 'Violation count'
	from FactParkingViolation as F inner join DimLocation as loc
	on F.locationkey = loc.locationkey inner join DimBorough as boro
	on loc.BoroughCode=boro.BoroughCode
	where year(cast(issuedate as DATE)) between 2015 and 2017
	and  datename(weekday,cast(issuedate as date))=@week_day
	group by BoroughName, datename(weekday,cast(issuedate as date))
end

exec sp_week_day friday	