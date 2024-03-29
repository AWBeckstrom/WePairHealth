/****** Object:  StoredProcedure [dbo].[ShareStory_Insert]    Script Date: 9/18/2023 4:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ShareStory_Insert]
             @Name nvarchar(50)
            ,@Email nvarchar(50)
            ,@Story nvarchar(3000)
            ,@CreatedBy int
            ,@FileId dbo.FileIdTableType READONLY
            ,@Id int OUTPUT
AS		

/*

DECLARE @MyFileId AS dbo.FileIdTableType;
INSERT INTO @MyFileId (FileId)
VALUES (1), (2), (3);

DECLARE @Id int;

EXEC dbo.ShareStory_Insert 
        @Name = 'Testina', 
        @Email = 'testina@realemail.com', 
        @Story = 'Just a normal story, nothing to see here.', 
        @CreatedBy = 2, 
        @FileId = @MyFileId,
        @Id = @Id OUTPUT;

SELECT @Id as StoryId;


*/


BEGIN
    
    INSERT INTO [dbo].[ShareStory]
            ([Name]
            ,Email
            ,Story
            ,CreatedBy)
    
     VALUES
            (@Name
            ,@Email
            ,@Story
            ,@CreatedBy)
    
     SET @Id = SCOPE_IDENTITY()
		IF EXISTS (SELECT TOP (1) 1 FROM @FileId)
	BEGIN
		INSERT INTO dbo.ShareStoryFile (FileId, StoryId)
			SELECT FileId, @Id FROM @FileId;
	END
END
GO
