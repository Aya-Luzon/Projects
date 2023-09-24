




create database MyFirstDB

create table   books
(Book_id int identity (1,1) constraint BOID_PK PRIMARY KEY,
  Book_name varchar (25) constraint  book_nam unique,
   Book_writer varchar (25) constraint BW not null,
   Book_Price int constraint BP check(book_price between 0 and 5000),
    Book_location varchar (25) constraint BL check (Book_location in ('A','B','C')),
	book_publish_date date default getdate())
	
	
	ALTER TABLE books ADD category_id INT constraint 
	Foreign key (category_id) 
	references categories(categoy_ID)

	INSERT INTO books
	VALUES ('SHINE','MORNI',1500,'B','2005-04-14',2),
	('BRIDG','MIRNA',2300,'C','2005-04-04',3),
	('GO GO','MICHEL',3200,'A','2001-01-20',2),('FRIENDS','SIVAN',300,'C','2005-01-12',1)
		
SELECT *
FROM books

INSERT INTO Categories
VALUES ('science'),('romanticism'),('drama')



--2

create table Courses
(Course_ID int identity (1,1) constraint CURID primary key,Course_name varchar (25) unique)

create table Students
(Student_id int identity (1,1) constraint STUID primary key , First_name varchar (25) constraint FIRNAM not null,
Last_Name varchar (25) constraint LASNAM not null, Phone_number varchar (25) unique, email varchar (25) constraint 
mail  check (email like '%@%') , S_year int constraint Syear check  (S_year in (1,2,3)) , Class_ID int 
constraint claid FOREIGN KEY (Class_ID) references Courses(Course_ID))

INSERT INTO Courses
VALUES ('Economics'),('Political science')

insert into Students
values ('naama','choen','0549998765','naamac@gmail.com',1,1),('Moren','levi','0523456754','morenl@gmail.com',2,1),
('sivan','oren','0503665432','sivioo@gmail.com',2,2)


--3

create table Departments
(Dep_id	 int identity (100,100) constraint DEPID primary key, Dep_Name varchar (25), Location_id int 
constraint loid foreign key (Location_id) references Locations(loc_id))

create table Locations
(loc_id int identity (100,100) constraint  locid primary key , Area_name varchar (25) constraint area
check (Area_name in ('north','south', 'center')),city int , Zip_code int constraint zip check (len(zip_code)=5)) 

create table Employees
(emp_id int identity (1,1) constraint empid primary key , emp_name varchar (15), emp_lname varchar (15),
emp_email as (left(emp_name,1)+left(emp_lname,2)+'@gmail.com'),emp_job varchar (25) constraint empjob 
check( emp_job in ('cashier','manager','delivery')),emp_birthdate date constraint birthdate not null ,
emp_age as (datediff(yy,emp_birthdate,getdate())),emp_sal_per_hour int constraint salperhour
check (emp_sal_per_hour between 25 and 75), emp_total_hours int constraint otalhours check (emp_total_hours <=200)
, emp_salary as (emp_sal_per_hour*emp_total_hours), emp_hiredate date ,emp_cellphone varchar (11) constraint
 cellhone check (emp_cellphone like '%%%-%%%%%%%'), dep_id int constraint dep__id foreign key
 (dep_id) references departments(Dep_id))


 alter table employees
 add 
  emp_cell_company  as
                   (case 
				   when left(emp_cell_company,3)= '052' then 'cellcom'
				   when left(emp_cell_company,3)= '050' then 'pelephone' 
                   else 'other company' 
				   end)


 insert into Employees
 values ('noam','levin','cashier',1990-04-12,30,140,2015-09-17,'050-3565443',300),
         ('AYA','luzon','manager',1980-24-03,60,120,2012-03-21,'052-3358764',400)


 insert into Departments
 values ('economics',300),('Political science',400)



 INSERT INTO Locations
 VALUES ('SOUTH',2,'75566'),('NORTH',3,'23565'),('CENTER',1,'46367')


 SELECT *
 FROM Locations

 ---DDL

 create schema petstore

 create table petstore.owner 
 (ownerid int identity (1,1) constraint onrid primary key,
 ownername nvarchar (30) constraint onrname not null,
 haircolor nvarchar(10) constraint haircol null)


 insert into petstore.owner 
 values('aya','red')

 select *
 from petstore.owner

 alter table petstore.owner 
  add preferredname nvarchar(30) constraint prename null

  Drop table petstore.owner