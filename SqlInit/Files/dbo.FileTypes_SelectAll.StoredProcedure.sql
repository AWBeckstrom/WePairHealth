﻿USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[FileTypes_SelectAll]    Script Date: 8/29/2023 4:53:58 PM *****

-- Create date: 08/24/2023
-- Description: Select all files types that currently exist in dbo.FileTypes. This is a lookup table.

CREATE PROC [dbo].[FileTypes_SelectAll]

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
