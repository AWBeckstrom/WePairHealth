/****** Object:  StoredProcedure [dbo].[ShareStory_SelectAll]    Script Date: 8/31/2023 4:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[ShareStory_SelectAll] 
			@PageIndex int 
			,@PageSize int
as

/*---------------------------------------------

DECLARE @PageIndex int = 0

DECLARE @PageSize int = 5

EXECUTE dbo.ShareStory_SelectAll @PageIndex
								,@PageSize

----------------------------------------------------*/


BEGIN

	DECLARE @offset int = @PageIndex * @PageSize

	SELECT [Id]
      ,[Name]
      ,[Email]
      ,[Story]
	  ,CreatedBy = dbo.fn_GetUserJSON(CreatedBy)
	  ,IsApproved
	  ,ApprovedBy = dbo.fn_GetUserJSON(ApprovedBy)
      ,[DateCreated]
	  ,TotalCount = COUNT(1) OVER()
  FROM [dbo].[ShareStory]
		where IsApproved = 1
			order BY Id
			offset @offset rows
			fetch next @PageSize rows only

END
GO
