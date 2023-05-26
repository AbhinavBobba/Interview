Create table ApartmentResidents(
ResidentID int primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
FlatNumber int not null,
OwnershipType char(15) not null,
ContactNumber int not null,
Email varchar(30) not null,
MoveInDate Date not null
);

--Create Procedure FetchApartmentResidents(
--@NResidentID int
--)As
--begin
--select * from ApartmentResidents where ResidentID=@NResidentID
--end

--Create Procedure AddApartmentResidents(
--@NResidentID int,
--@NFirstName varchar(20),
--@NLastName varchar(20),
--@NFlatNumber int,
--@NOwnerhipType char(15),
--@NContactNumber int,
--@NEmail varchar(30),
--@MoveInDate Date)AS Begin
--Insert into ApartmentResidents values(@NResidentID,@NFirstName,@NLastName,@NFlatNumber,@NOwnerhipType,@NContactNumber,@NEmail,@MoveInDate)
--End


Create table MonthlyMaintenance(
ID int primary key,
ResidentID int foreign key references ApartmentResidents,
Month varchar(20) not null,
Year int not null,
MaintenanceAmount decimal(10,2) not null,
PaymentDate Date not null,
PaymentStatus varchar(20) not null,
PaymentMethodID int not null,
CategoryID int not null,
Notes varchar(100) not null
);

--Create Procedure FetchMontlyMaintenance(
--@NID int
--)as
--begin
--select * from MonthlyMaintenance where ID=@NID;
--end

--Create Procedure AddMontlyMaintenance(
--@NID int,
--@NResidentID int,
--@NMonth varchar(20),
--@NYear int,
--@NMaintenanceAmount decimal(10,2),
--@NPaymentDate date,
--@NPaymentStatus varchar(20),
--@NPaymentMethodID int,
--@NCategoryID int,
--@NNotes varchar(100)
--)as begin
--insert into MonthlyMaintenance values(@NID,@NResidentID,@NMonth,@NYear,@NMaintenanceAmount,@NPaymentDate,@NPaymentStatus,@NPaymentMethodID,@NCategoryID,@NNotes)
--end


Create table PaymentMethods(
PaymentMethodID int primary key,
PaymentMethodName varchar(50) not null,
Description varchar(100) not null,
IsActive varchar(10) not null
);

--Create procedure FetchPaymentMethods(
--@NPaymentMethodID int
--)as begin
--select * from PaymentMethods where PaymentMethodID=@NPaymentMethodID
--end

--Create procedure AddPaymentMethods(
--@NPaymentMethodID int,
--@NPaymentMethodName varchar(50),
--@NDescription varchar(100),
--@NIsActive varchar(10)
--)AS BEGIN
--insert into PaymentMethods values(@NPaymentMethodID,@NPaymentMethodName,@NDescription,@NIsActive)
--end


Create table ExpenseTracking(
ID int primary key,
ExpenseDate date not null,
ExpenseType varchar(50) not null,
ExpenseAmount decimal(10,2) not null,
Description varchar(100) not null,
Receipt varbinary(max) not null,
ResidenceID int foreign key references ApartmentResidents(ResidentID)
);

Create table Users(
UserID int primary key,
Username varchar(50) not null,
Password varchar(100) not null,
Email varchar(100) not null,
FullName varchar(100) not null,
CreatedAt datetime not null,
UpdatedAt datetime not null
);

--Create procedure FetchUsers(
--@NUserID int)as begin
--select * from Users where UserID=@NUserID
--end

Create procedure AddUsers(
@NUserID int,
@NUsername varchar(50),
@NPassword varchar(100),
@NEmail varchar(100),
@NFullName varchar(100)
)as begin
insert into Users values(@NUserID,@NUsername,@NPassword,@NEmail,@NFullName,GETDATE(),GETDATE())
end

select * from Users

Create procedure EditUsers(
@@NUserID int,
@NUsername varchar(50),
@NPassword varchar(100),
@NEmail varchar(100),
@NFullName varchar(100)
)as begin






Create table Tags(
TagID int primary key,
TagName varchar(50) not null,
Description varchar(100) not null
);

Create table ExpenseTags(
ExpenseTagID int primary key,
ExpenseID int references ExpenseTracking(ID) not null,
TagID int foreign key references Tags(TagID)
);

Create table ExpenseCategories(
ExpenseCategory int primary key,
--CategoryID int foreign key references MonthlyMaintenance(CategoryID) not null 
);

Create table UserDetails(
ID int primary key,
Email varchar(30),
Password varchar(30)
);

--CREATE PROCEDURE AddUserDetails
--(
--@NID int,
--@NEmail varchar(30),
--@NPass varchar(30)
--)
--AS
--BEGIN
--	INSERT INTO UserDetails VALUES(@NID,@NEmail,@NPass);
--END
