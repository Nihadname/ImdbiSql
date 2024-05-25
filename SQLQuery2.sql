create database LastSql
use LastSql
create table Users(
Id int primary key  identity ,
UserName nvarchar(50) ,
 Email NVARCHAR(255) NOT NULL,
    CHECK (Email LIKE '%_@_%._%')
	)

	create table operations(
	Id int primary key  identity ,
UserId int not null,
UserName nvarchar(50) ,
 Email NVARCHAR(255) NOT NULL,

 [Date] date 
 )
 -- Add the 'type' column to the operations table
ALTER TABLE operations
ADD [type] NVARCHAR(50);

-- Remove the 'UserName' and 'Email' columns from the operations table
-- Drop the 'UserName' column from the operations table
ALTER TABLE operations
DROP COLUMN UserName;

-- Drop the 'Email' column from the operations table
ALTER TABLE operations
DROP COLUMN Email;
select * from operations

-- Start of batch
GO
CREATE TRIGGER UpdateONe 
ON Users 
AFTER update 
AS 
BEGIN     
    INSERT INTO Operations ([type], UserId,  [Date])
    SELECT 'insert', id, GETDATE()
    FROM inserted 
END;
GO
-- End of batch
-- Inserting sample data into Users table
-- Inserting sample data into Users table
INSERT INTO Users (UserName, Email)
VALUES 
    ('john_doe4', 'john.d4oe@example.com'),
    ('jane_doe5', 'jane.d5oe@example.com'),
    ('bob_smith6', 'bob.s6mith@example.com');

	drop table operations
	drop table Users