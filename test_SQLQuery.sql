use test

create table [house] (
	 [id]			int	identity(1, 1) primary key
	,[name]			nvarchar(64)	not null
	,[address]			nvarchar(64)	

);

create table [apartment] (
	 [id]			int	identity(1, 1) primary key
	,[house_id]			int	not null
	,[number]			int	not null
);

create table [resident] (
	 [id]			int	identity(1, 1) primary key
	,[apartment_id]			int	not null
	,[name]			nvarchar(64)	not null
);
GO 
CREATE PROCEDURE get_persons AS
BEGIN
    Select h.name house_name, h.address, a.number ap_number, r.name person_name from resident R
inner join apartment A on R.apartment_id=A.id
inner join house H on A.house_id=H.id 
END
GO  

DECLARE @hid  int
DECLARE @aid  int

insert into [house] (name,address) values ('Pirmas','Geroji 1') 
SET @hid =@@IDENTITY
insert into [apartment] (house_id, number) values (@hid,1)
SET @aid =@@IDENTITY
insert into [resident] (apartment_id, name) values (@aid,'Jonas')
insert into [resident] (apartment_id, name) values (@aid,'Petras')
insert into [resident] (apartment_id, name) values (@aid,'Onutë')

insert into [apartment] (house_id, number) values (@hid,2)
SET @aid =@@IDENTITY
insert into [resident] (apartment_id, name) values (@aid,'Jonas2')
insert into [resident] (apartment_id, name) values (@aid,'Petras2')
insert into [resident] (apartment_id, name) values (@aid,'Onutë2')

insert into [apartment] (house_id, number) values (@hid,3)
SET @aid =@@IDENTITY
insert into [resident] (apartment_id, name) values (@aid,'Jonas3')
insert into [resident] (apartment_id, name) values (@aid,'Petras3')
insert into [resident] (apartment_id, name) values (@aid,'Onutë3')


--------
insert into [house] (name,address) values ('Antras','Trumpoji 2') 
SET @hid =@@IDENTITY

insert into [apartment] (house_id, number) values (@hid,1)
SET @aid =@@IDENTITY

insert into [resident] (apartment_id, name) values (@aid,'Onutë G21')

insert into [apartment] (house_id, number) values (@hid,2)
SET @aid =@@IDENTITY

insert into [resident] (apartment_id, name) values (@aid,'Jonas22')
insert into [resident] (apartment_id, name) values (@aid,'Petras22')

-------------------
insert into [house] (name,address) values ('Treèias','Ilgoji 3') 
SET @hid =@@IDENTITY

insert into [apartment] (house_id, number) values (@hid,1)
SET @aid =@@IDENTITY
insert into [resident] (apartment_id, name) values (@aid,'Jonas G31')

insert into [apartment] (house_id, number) values (@hid,2)
SET @aid =@@IDENTITY
insert into [resident] (apartment_id, name) values (@aid,'PetrasG32')

exec get_persons
