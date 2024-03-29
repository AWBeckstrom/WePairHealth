/****** Object:  StoredProcedure [dbo].[Files_Select_ByCreatedBy]    Script Date: 8/29/2023 4:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Files_Select_ByCreatedBy] 
				@PageIndex INT,
				@PageSize INT,
				@UserId INT

AS

/* -- Test Code --

	DECLARE @UserId INT = 2;
	DECLARE @PageIndex INT = 0;
	DECLARE @PageSize INT = 5;

	Execute dbo.Files_Select_ByCreatedBy 
				@PageIndex, 
				@PageSize, 
				@UserId 

*/
BEGIN
	DECLARE @offset int = @PageIndex * @PageSize

	SELECT f.[Id] 
		  ,f.[Name]
		  ,f.[Url] AS FileUrl
		  ,ft.[Id] AS FileTypeId
		  ,ft.[Name] AS FileName
		  ,f.[IsDeleted]
		  ,CreatedBy = dbo.fn_GetUserJSON(u.id) 
		  ,f.[DateCreated]
		  ,[TotalCount] = COUNT(1) OVER()
	 FROM [dbo].[Files] AS f INNER JOIN dbo.FileTypes AS ft
			ON ft.Id = f.FileTypeId
		INNER JOIN dbo.Users AS u
			ON u.Id = f.CreatedBy
	WHERE f.CreatedBy = @UserId 

	ORDER BY f.Id

	OFFSET @offset Rows
	Fetch Next @PageSize Rows ONLY

END




GO
