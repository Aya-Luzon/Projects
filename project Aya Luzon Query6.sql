	
	SELECT YEAR(issuedate) as 'Year' , COUNT(violationcode) as 'Total violations',
	LAG(COUNT(violationcode),2) over (order by YEAR(issuedate)) as 'vioaltion in 2015',
	format((COUNT(violationcode))/(LAG(COUNT(violationcode),2) over (order by YEAR(issuedate))),'p')
	FROM FactParkingViolation fact inner join DimLocation loc
	on fact.LocationKey=loc.LocationKey inner join DimState stat
	on loc.StateCode=stat.StateCode
	where year(cast(issuedate as DATE)) between 2015 and 2017 
	group by YEAR(issuedate)
	order by Year


/--	SELECT YEAR(issuedate) as 'Year' , COUNT(violationcode) as 'Total violations',
	LAG(COUNT(violationcode),2) over (order by YEAR(issuedate)) as 'vioaltion in 2015'
	from
	(select YEAR(issuedate) as 'Year' , COUNT(violationcode) as 'Total violations',
	format((COUNT(violationcode))/(LAG(COUNT(violationcode),2) over (order by YEAR(issuedate))),'p')
	FROM FactParkingViolation fact inner join DimLocation loc
	on fact.LocationKey=loc.LocationKey inner join DimState stat
	on loc.StateCode=stat.StateCode
	group by ViolationCode, IssueDate
	having YEAR(issuedate)=2017)
	where year(cast(issuedate as DATE)) between 2015 and 2017 
	group by YEAR(issuedate)
	order by Year/--