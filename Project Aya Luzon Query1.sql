--Query 1--

select BoroughName, COUNT(ViolationCode) as 'Violation count'
from FactParkingViolation as F inner join DimLocation as loc
on F.locationkey = loc.locationkey inner join DimBorough as boro
on loc.BoroughCode=boro.BoroughCode
where year(cast(issuedate as DATE)) between 2015 and 2017
group by BoroughName
order by 'Violation count' desc

alter procedure sp_Violation_Count
@Boroughname varchar(20)
as
begin
	select Boroughname, COUNT(ViolationCode) as 'Violation count'
	from FactParkingViolation as F inner join DimLocation as loc
	on F.locationkey = loc.locationkey inner join DimBorough as boro
	on loc.BoroughCode=boro.BoroughCode
	where year(cast(issuedate as DATE)) between 2015 and 2017
	and  Boroughname=@Boroughname
	group by Boroughname
end

exec sp_Violation_Count bronx




