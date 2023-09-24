--Query 4--


alter view v_Violation_by_color
as
	select ViolationCode ,ColorName,count(ViolationCode) as 'total_violation',
	DENSE_RANK() over (partition by colorname order by count(ViolationCode )desc ,violationCode) as 'rank'
	from FactParkingViolation as fact left join DimVehicle as vehicle
	on fact.VehicleKey=vehicle.VehicleKey inner join DimColor as color
	on vehicle.VehicleColorCode=color.ColorCode
	where year(cast(issuedate as DATE)) between 2015 and 2017
	and ColorCode != 'unk' 
	group by ViolationCode,ColorName


select *
from v_Violation_by_color
where  rank in (1,2)






