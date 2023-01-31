CREATE DATABASE InventoryMS
use InventoryMS
create Table Users
(UserID int primary key identity(1,1),
UserName varchar(50),
Password varchar(25),
FullName Varchar(255),
IsActive BIT,
Category varchar(50));

 create Table ProductMaster
 (ProductId int primary key identity(1,1),
 ProductName varchar(50),
 Availability Bigint );

  Create table transactionn
 (TransactionID int primary key identity(1,1),
 TransactionDate date ,
 ProductID int,
 constraint FK_productionID
 FOREIGN KEY (ProductID) References ProductMaster(ProductID),
 TransactionType varchar(5),
 Qty int,
 UpdatedBY int);

 ---------------
 alter table Transactionn add foreign key (UpdatedBy) references Users(UserId);
 alter table Transactionn alter column ProductID int not null;
 alter table Transactionn alter column UpdatedBy int not null;
 alter table Transactionn alter column TransactionType varchar(5) not null;
 alter table ProductMaster alter column ProductName int not null;
 alter table ProductMaster alter column Availability int not null;
 ---------------
 create table dummy
 (id int,
 name varchar(50),
 password varchar(25));
 select * from dummy;
 insert into dummy (id,password,name)values(1,'ganesh111','ganesh');
 insert into dummy values(2,'ganesh111','ganesh');
 alter table dummy   add  id int primary key;

 -------------
 truncate table dummy;
 delete dummy where id=1;
 -------------
insert into Users (UserName,Password,FullName,IsActive,Category) values ('GaneshPatro','1111','GANESH PATRO',1,'male');
insert into Users (UserName,Password,FullName,IsActive,Category) values ('RameshPatro','2222','RAMESH PATRO',0,'male');
insert into Users values ('mathew','4444','MATHEW',0,'male');
 insert into users  values('duryodhana','3333','DURYODHANA PATRO',1,'male'); 
  select* from Users;
 ----------------------

 insert into ProductMaster values('switch',10);
insert into ProductMaster values ('TubeLight',20);
insert into ProductMaster values('Screws',1000);
 select* from ProductMaster;
 -------------------------------

 insert into transactionn values ('2-12-2010', 1,'Inward',5,'JOHN MATHEW');
 insert into transactionn values ('2/13/2010', 2,'Inward',10,'SAM MC');
 insert into transactionn values ('2/14/2010', 3,'Inward',20,'PETER');
  insert into transactionn values ('2/15/2010', 4,'Inward',10,'SAM MC');
   insert into transactionn values ('2/15/2010', 5,'Inward',20,'PETER');
    insert into transactionn values ('2/15/2010', 6,'Inward',20,'JOHN MATHEW');
	
	ALTER TABLE transactionn DROP FK__transacti__Updat__2E1BDC42

	ALTER TABLE transactionn DROP[FK__transacti__Updat__2D27B809]
	ALTER TABLE Transactionn DROP [FK__transacti__Updat__2C3393D0]
	ALTER TABLE Transactionn DROP [FK__transacti__Updat__2B3F6F97]
	alter table transactionn alter column TransactionType varchar(50);
	--------------------------------------------

	select * from transactionn;
delete transactionn where TransactionType='Inw';

-------------------------------------------------------

select FullName from Users;
select ProductName from ProductMaster;
select*from ProductMaster;
select * from transactionn;
select ProductName from ProductMaster where Availability<=10;
select * from transactionn where UpdatedBY='SAM MC';
SELECT TransactionDate,TransactionID from transactionn;
select * from transactionn where TransactionType='Inward';