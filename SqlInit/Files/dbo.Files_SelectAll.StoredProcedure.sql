/****** Object:  StoredProcedure [dbo].[FileTypes_SelectAll]    Script Date: 8/29/2023 4:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[FileTypes_SelectAll]

AS
/* -- Test Code --
	Execute [dbo].[FileTypes_SelectAll]
*/
BEGIN
	SELECT [Id]
		  ,[Name]
	  FROM [dbo].[FileTypes]

END


GO
