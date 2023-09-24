--תכנות ושימוש במשתנים

--4

declare @supp_id int,
        @comp_name nvarchar (40),
		@city nvarchar (15)

		SET @supp_id=2
		select @supp_id = SupplierID, @comp_name=CompanyName, @city=City
		from Suppliers
		where SupplierID = @supp_id

SELECT @comp_name + ' ' + @city
PRINT @SUPP_ID
select *
from Suppliers
where SupplierID =2 


--5

declare @prod_ID int,
        @prod_name varchar (40) ,
		@catg_name varchar (15)

set @prod_ID=1
select @prod_ID = ProductID, @prod_name=ProductName, @catg_name=C.CategoryName
from Products  P inner join Categories C
on P.CategoryID= C.CategoryID
where ProductID = @prod_ID

print @prod_name + ' ' +  @catg_name
print @prod_id


--6

declare @CUST_ID VARCHAR (5),
		@COMP_NAME varchar (40),
		@city_cust varchar (15)

	set @CUST_ID = 'anatr'
	select @COMP_NAME=CompanyName, @CUST_ID=CustomerID, @city_cust= City
	from Customers
	where CustomerID=@CUST_ID

	print @COMP_NAME + ' ' + @city_cust
	print @CUST_ID


--7

declare @catg_id int,
		@unitPr  money
	

set @unitPr = (select AVG(unitprice)
				from Products
				where CategoryID = 5)

print @unitPr


--8

declare @prod_id int,
		@comp_name varchar (40),
		@prod_name varchar (40)
		set @prod_id=1
		(select @prod_name=ProductName, @comp_name=CompanyName
		from Products P inner join Suppliers S
		on P.SupplierID	=	S.SupplierID
		where ProductID=@prod_id)
print	@prod_name + ' ' + @comp_name

--9

declare @cust_id varchar(10),
		@cnt_order int

		set @cust_id = 'bolid'
		(select @cnt_order = COUNT(OrderID)
		from Orders  o inner join Customers C
		on o.CustomerID=C.CustomerID
		where C.CustomerID = @cust_id)
print @cnt_order


--case

--2

declare @emp_code int,
		@emp_sales money ,
		@emp_status varchar (40) 
		set @emp_code =3
		set @emp_sales=(select sum(Quantity*UnitPrice)
						from [Order Details] OD inner join Orders O
						on OD.OrderID=O.OrderID inner join Employees E
						on E.EmployeeID=O.EmployeeID
						where E.EmployeeID= @emp_code)
		set @emp_status	=(case 
						  when @emp_sales <100000 then 'bad sales'
				          when @emp_sales between 100000 and 200000 then 'normal sales'
				          else 'good sales'
				          end) 
			
			print @emp_status + ' ' + cast(@emp_sales as varchar(20))


--if else

--2

declare @catg_id int,
		@unitstk int	
		
		set @catg_id = 3
		set @unitstk=(select sum(UnitsInStock)
						from Products
						where CategoryID=@catg_id)

		if @unitstk < 200
		print 'unit less then 200'
		else if @unitstk>200 
		print  'unit grether then 200'
		else print  'unit equle  200'


--4

declare @prod_id int,
		@prod_price money 
	set @prod_id =19
	set @prod_price =(select UnitPrice
						from Products	
						where ProductID=@prod_id)
			if @prod_price >50
			print 'the price is above market value'
			else select 'the price is below market value'


--5

	declare @prod_name varchar (40),
			@prod_price money
		set @prod_name = 'mishi kobe niku'	
		set @prod_price= (select UnitPrice
						 from Products
						 where ProductName=@prod_name)	

	if @prod_price < 20 
	begin 
		set @prod_price =@prod_price *1.1
		print 'the price is' + ' ' +  cast(@prod_price as varchar(40))
		end	
		else if @prod_price between 20 and 40 
		begin 
		set @prod_price = @prod_price*1.2
		print'the price is' +' ' + cast( @prod_price as varchar(40))
		end
		else 
		begin
		set @prod_price = @prod_price*1.5
		print'the price is' + ' ' + cast( @prod_price as varchar(40))
		end	
		 
		 select UnitPrice
		 from Products
		 where ProductName='chang'

		 --while

--2
declare @param int =1
while @param<7
begin  
	print @param 
	set @param =@param+1
	end
	print '7 is a bad luck number'


--3
declare @parm int =1
while @parm <10
begin print @parm
		set @parm = @parm+1
	if @parm =7 
	print 'the number is grether then 7'
	continue 
	end


--4

declare @emp_id int =0,
		@las_nam varchar (20),
		@first_nam varchar (15)

		set @las_nam = (select LastName
					   	from Employees
						where FirstName	 like '%E%')

	while @emp_id <=9
	begin 

		print  @las_nam
		set @emp_id = @emp_id + 1
		end 

		 

