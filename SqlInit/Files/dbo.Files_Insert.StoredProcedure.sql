/****** Object:  StoredProcedure [dbo].[Files_Insert]    Script Date: 8/29/2023 4:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Files_Insert]
			@Name nvarchar(100),
			@Url nvarchar(255),
			@FileTypeId int,
			@CreatedBy int,
			@Id int OUTPUT

AS
/* -- Test Code --
	DECLARE @Id INT = 0;

	DECLARE @Name NVARCHAR(100) = 'OOP Image',
			@Url NVARCHAR(255) = 'https://tinyurl.com/yrhf2y37',
			@FileTypeId INT = 1,
			@CreatedBy INT = 8

	EXEC dbo.Files_Insert
			@Name,
			@Url,
			@FileTypeId,
			@CreatedBy,
			
			@Id OUTPUT

	SELECT Name, Url
	FROM dbo.Files
	WHERE Id = @Id;
*/

BEGIN

	INSERT INTO [dbo].[Files](
					[Name],
					[Url],
					[FileTypeId],
					[CreatedBy]
				) VALUES (
						@Name,
						@Url,
						@FileTypeId,
						@CreatedBy
				);

	SET @Id = SCOPE_IDENTITY()
END




GO
