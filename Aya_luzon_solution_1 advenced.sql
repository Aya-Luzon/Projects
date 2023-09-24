
--1
select ROW_NUMBER() over (order by unitprice) as 'row_number' , ProductName, UnitPrice
from products

--2
select ROW_NUMBER() over (partition by CategoryID order by unitprice) as 'row_number' ,
ProductName, UnitPrice, CategoryID
from products
where UnitPrice >18

--3
select ROW_NUMBER() over (partition by CategoryID order by unitprice) as 'row_number' ,
ProductName, UnitPrice, CategoryID, DENSE_RANK() over (partition by CategoryID order by unitprice),
RANK() over (partition by CategoryID order by unitprice)
from products
where UnitPrice >18


--4
select ProductName , UnitPrice, NTILE(5) over (order by unitprice), NTILE(10)  over (order by unitprice),
NTILE(20) over(order by unitprice)
from products

--5
select * from 
(select C.CategoryName , ProductName, UnitPrice,
DENSE_RANK() over (partition by c.categoryid order by unitprice desc) as ranking
from products P inner join Categories C
on P.CategoryID=C.CategoryID ) as ranking
where ranking=1



--1
CREATE table players
  (ID NUMERIC)

  insert into players
  (ID)
  values (1), (2),(3),(4),(5),(6)

  SELECT *
  FROM players	

  SELECT *
  FROM players p inner JOIN players pa
on  p.ID<pA.ID


--2
CREATe TABLE Count_a
(a1 varchar(1),
a2 varchar (1),
a3 varchar (1))

insert into Count_a
values ('a','d','a'), ('c','e','f'), ('a','a','s'), ('a','','a'), ('a','a','s')

//*select aa.a1,	bb.a2 ,AA.a3
from count_a AA   full	outer join	Count_a BB
on AA.a1 = BB.a2 full outer join Count_a CC
on BB.a2=CC.a3
GROUP BY	aa.a1,	AA.a2 ,AA.a3
HAVING	 a1='A'*//

SELECT A1,A2,A3,
       ( SELECT count(A1) from count_a WHERE a1='a')+
	   (select count (a2) from count_a where a2='a')+
	   (select count (a3) from count_a where a3='a') as 'countA'
	   from Count_a


--3
create table RankingPuzzle 
(ID int, VALS varchar(10))

insert into RankingPuzzle
values (1,'product'), (2,'a'), (3,'a'),(4,'a'),(5,'a'), (6,'product'),(7,'b'), (8,'b'), (9,'product'), (10,'c')



SELECT ID, VALS
FROM RankingPuzzle


select ID, VALS, COUNT(*)
from RankingPuzzle
group by ID, VALS
having  VALS='PRODUCT'
