--query 5--
	
	select count(plateid) as 'Total_cars', violation_by_car
from 
			(select plateid, COUNT(plateid) as 'total_cars',
			case 
			when COUNT(plateid)>=10 then 'More then 10 violations'
			when COUNT(plateid) between 5 and 9 then 'Between 5-9 violations'
			else 'Less then 5 violations'
			end violation_by_car
			from FactParkingViolation fact inner join DimVehicle veh
			on fact.VehicleKey=veh.VehicleKey
			where year(cast(issuedate as DATE)) between 2015 and 2017
			group by PlateID) car_violation
		group by violation_by_car
			order by total_cars desc
	
