USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[ShareStory_SelectByApproval]    Script Date: 11/8/2023 3:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShareStory_SelectByApproval]
					@PageIndex int 
					,@PageSize int

AS

/*

DECLARE @PageIndex int = 0

DECLARE @PageSize int = 12

EXECUTE dbo.ShareStory_SelectByApproval
		@PageIndex
		,@PageSize

*/

BEGIN

	DECLARE @offset int = @PageIndex * @PageSize

SELECT s.[Id]
      ,s.[Name]
      ,[Email]
      ,[Story]
	  ,CreatedBy = dbo.fn_GetUserJSON(s.CreatedBy)
	  ,IsApproved
	  ,ApprovedBy = dbo.fn_GetUserJSON(s.ApprovedBy)
      ,s.[DateCreated]
	  , StoryFileUrl = f.Url
	  ,TotalCount = COUNT(1) OVER()
	  
	FROM [dbo].[ShareStory] as s 
	inner join [dbo].[ShareStoryFile] as sf ON s.Id = sf.StoryId
	inner join [dbo].[Files] as f on sf.FileId = f.Id
	Where IsApproved = 0
	Order BY Id
	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY

END


GO
