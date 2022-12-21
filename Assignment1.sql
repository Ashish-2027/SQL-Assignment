CREATE database Assignment1;

USE Assignment1 ;

CREATE table SalesPeople
		(Snum int,
		 Sname varchar(50) NOT NULL,
		 City varchar(50) NOT NULL,
		 Comm int,
         PRIMARY KEY (Snum)
         );

CREATE table Customers
		(Cnum int,
		 Cname varchar(50) NOT NULL,
		 City varchar(50) NOT NULL,
		 Snum int,
         PRIMARY KEY (Cnum),
         constraint FK_SALESCUSTOMER foreign key (Snum) REFERENCES SalesPeople(Snum)
         );
         
CREATE table Orders
		(Onum int,
		 Amt float(2) NOT NULL,
		 Odate varchar(50) NOT NULL,
		 Cnum int,
         Snum int,
         PRIMARY KEY (Onum),
         constraint FK_CUSTOMERORDER FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
         constraint FK_CUSTOMERSALES FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
         );
         
INSERT INTO salespeople VALUES
('1001','Peel','London','12'),
('1002','Serres','Sanjose','13'),
('1004','Motika','London','11'),
('1007','Rifkin','Barcelona','15'),
('1003','Axelrod','Newyork','10');

INSERT INTO customers VALUES
('2001','Hoffman','London','1001'),
('2002','Giovanni','Rome','1003'),
('2003','Liu','Sanjose','1002'),
('2004','Grass','Berlin','1002'),
('2006','Clemens','London','1001'),
('2008','Cisneros','Sanjose','1007'),
('2007','Pereira','Rome','1004');

INSERT INTO orders VALUES
('3001','18.69','3-10-1990','2008','1007'),
('3003','767.19','3-10-1990','2001','1001'),
('3002','1900.10','3-10-1990','2007','1004'),
('3005','5160.45','3-10-1990','2003','1002'),
('3006','1098.16','3-10-1990','2008','1007'),
('3009','1713.23','4-10-1990','2002','1003'),
('3007','75.75','4-10-1990','2004','1002'),
('3008','4273.00','5-10-1990','2006','1001'),
('3010','1309.95','6-10-1990','2004','1002'),
('3011','9891.88','6-10-1990','2006','1001');

------------------------------------

select sname,count(Sname) as Count FROM salespeople where Sname LIKE 'a%'group by Sname ;

-------------------------------------

create view Sales as
select salespeople.Sname,salespeople.Snum,orders.Amt
from salespeople,orders
where salespeople.Snum = orders.snum;

select Snum, Sname, round(sum(Amt),2) as SalesTotal from sales group by Snum having sum(Amt)>='2000';

---------------------------------------

select Sname, City,count(City) as Count FROM salespeople where City = 'Newyork'group by City, Sname ;

---------------------------------------

select Sname, City,count(City) as Count FROM salespeople where City = 'London' or City = 'Paris' group by City, Sname ;

------------------------------------------

SELECT odate,snum,COUNT(*) as Totalorders
FROM orders 
GROUP BY Odate,snum;

-------------------------------------------