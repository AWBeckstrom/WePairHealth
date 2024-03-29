/****** Object:  StoredProcedure [dbo].[ShareStory_Update]    Script Date: 8/31/2023 4:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ShareStory_Update]
			@Name nvarchar(50)
		   ,@Email nvarchar(50)
		   ,@Story nvarchar(3000)
		   ,@Id int

as

/*

DECLARE @Id int = 5 

DECLARE @Name nvarchar(50) = 'New Data'
	   ,@Email nvarchar(50) = 'bilbotestina@newemail.com'
	   ,@Story nvarchar(3000) = 'Alright, now THIS is a much better story.'

EXECUTE dbo.ShareStory_Update
		@Name
	   ,@Email
	   ,@Story
	   ,@Id
*/

BEGIN

DECLARE @dateModified datetime2 = getutcdate()

UPDATE [dbo].[ShareStory]
   SET [Name] = @Name
      ,[Email] = @Email
      ,[Story] = @Story
	  ,[DateModified] = @dateModified
   where Id=@Id

END


GO
