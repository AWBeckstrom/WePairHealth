USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[ShareStory_Select_ById]    Script Date: 8/31/2023 4:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Robert Torres-Heredia>
-- Create date: <08-24-2023>
-- Description:	<Select story in database by ID>
-- Code Reviewer:

-- MODIFIED BY: Robert Torres-Heredia
-- MODIFIED DATE: 08-25-2023
-- Code Reviewer:
-- Note:
-- =============================================
CREATE proc	[dbo].[ShareStory_Select_ById]
			@Id int

as

/*
DECLARE @Id int = 4

EXECUTE dbo.ShareStory_Select_ById @Id

*/

BEGIN

SELECT [Id]
      ,[Name]
      ,[Email]
      ,[Story]
	  ,CreatedBy = dbo.fn_GetUserJSON(CreatedBy)
	  ,IsApproved
	  ,ApprovedBy = dbo.fn_GetUserJSON(ApprovedBy)
      ,[DateCreated]
  FROM [dbo].[ShareStory]
	where Id=@Id

END


GO
