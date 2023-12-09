USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[ShareStory_Delete_ById]    Script Date: 8/31/2023 4:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Robert Torres-Heredia>
-- Create date: <08-24-2023>
-- Description:	<Delete story in the database>
-- Code Reviewer:

-- MODIFIED BY: Robert Torres-Heredia
-- MODIFIED DATE: 08-31-2023
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[ShareStory_Delete_ById]
			@Id int			
	AS

	/*
	DECLARE @Id int = 1
	
	EXECUTE dbo.ShareStory_Delete_ById
			@Id

	*/

	BEGIN

		DELETE FROM [dbo].[ShareStory]
		 WHERE Id = @Id

    END
GO
