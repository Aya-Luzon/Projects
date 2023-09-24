--Query 3--

select top 5 ViolationCode,COUNT(ViolationCode) 'Total_violation'
from FactParkingViolation
where year(cast(issuedate as DATE)) between 2015 and 2017
group by ViolationCode
order by 'Total_violation' desc

alter procedure sp_Tot_violation
@Top_n int
as
begin
	select top (@Top_n) ViolationCode,COUNT(ViolationCode) 'Total_violation'
	from FactParkingViolation
	where year(cast(issuedate as DATE)) between 2015 and 2017
	group by ViolationCode
	order by 'Total_violation' desc
end

exec sp_Tot_violation 6