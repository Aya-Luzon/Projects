
	create table Customerindex
	(cust_id int , cust_name varchar(20) , cust_city varchar(20)) 

	insert into Customerindex
	values (3,'aya','london'),(4,'moran','london'),(2,'lia','lima'),(7,'mia','lima'),(6,'ziv','paris'),(8,'liat','paris')
	, (1,'sivan','tel_aviv'),(5,'tael','tel_aviv')

	select cust_id
	from customerindex

	create unique nonclustered index customers_id_ix
	on Customerindex (cust_id)

--2

drop table Customerindex

create table Customerindex 
(Cust_ID int constraint CUSTID_PK primary key ,
 Cust_name varchar (10),
 Cust_city varchar (15),
 Cust_phone varchar (3000))


 select *
 from Customerindex

 insert into Customerindex 
 values (3, 'moren','london','09875446777'),
        (2,'lia','lima','876434577'),(7,'mia','lima','976434567'),(6,'ziv','paris','887655667'),
		(8,'liat','paris','8766424776')
		, (1,'sivan','tel_aviv','3455446890'),(5,'tael','tel_aviv','63268999755')
		,(4,'tael','london','887543345666')


update Customerindex
set Cust_phone = REPLICATE(cust_phone, 8)



--/מספרי הלקוחות מסודרים כי הוגדרה טבלת PK ולכן באופן אוטומטי נוצר CLUSTERED INDEX--/

	