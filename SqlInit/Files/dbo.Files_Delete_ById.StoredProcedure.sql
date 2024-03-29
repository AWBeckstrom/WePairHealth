/****** Object:  StoredProcedure [dbo].[Files_Delete_ById]    Script Date: 8/29/2023 4:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Files_Delete_ById]
			@Id INT

AS
/* --------------------------- Test Code --
	Declare @Id INT = 24;

	Select Name
	from dbo.Files
	Where Id = @Id

	Execute dbo.Files_Delete_ById @Id

	Select Name
	from dbo.Files
	Where Id = @Id
	
------------------------------------------*/
BEGIN
	DECLARE @ToDelete bit;
	SET @ToDelete = 'true'

	--soft delete logic from Files Table
	UPDATE dbo.Files
	SET [IsDeleted] = @ToDelete
		WHERE Id = @Id;
END




GO
