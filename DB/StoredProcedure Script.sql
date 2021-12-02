-- QUESTION 1 : SELECT ALL USERS
--CREATE PROCEDURE SelectAllUser
--AS
--select * from dbo.[User]
--GO;

--exec SelectAllUser

-- QUESTION 1 : SELECT USER
--CREATE PROCEDURE SelectUser @UserID bigint
--AS
--select * from dbo.[User] where UserID = @UseriD
--GO;

--exec SelectUser @UserID = 64



-- QUESTION 1 : CREATE USER
--CREATE PROCEDURE CreateUser @UserName varchar(20), @UserNo int
--AS
--	Insert into dbo.[User](Username,UserNo) values(@UserName,@UserNo)

--exec CreateUser @UserName = 'Hairi', @UserNo = '123456'


-- QUESTION 1 : UPDATE USER
--CREATE PROCEDURE UpdateUser @UserID bigint, @UserName varchar(20), @UserNo int
--AS
--	UPDATE dbo.[User] set UserName = @UserName, UserNo = @UserNo where UserID = @UserID

--exec UpdateUser @UserID = 1, @UserName = 'Michealx', @UserNo = '543221' 


-- QUESTION 1 : DELETE USER
--CREATE PROCEDURE DeleteUser @UserId bigint
--AS
--	DELETE from dbo.[User] where UserID = @UserId

--exec DeleteUser @UserId = 0


