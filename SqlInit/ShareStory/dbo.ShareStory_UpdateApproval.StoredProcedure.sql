USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[ShareStory_UpdateApproval]    Script Date: 11/8/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Robert Torres-Heredia>
-- Create date: <08-24-2023>
-- Description:	<Update approval of story in database>
-- Code Reviewer:

-- MODIFIED BY: Angelia Beckstrom
-- MODIFIED DATE: 11-07-2023
-- Code Reviewer:
-- Note:
-- =============================================
CREATE proc [dbo].[ShareStory_UpdateApproval]
			 @isApproved bit
			,@ApprovedBy int
			,@Id int

as

/*

DECLARE @Id int = 147 

DECLARE  @isApproved bit = 1 
		,@ApprovedBy int = 3

EXECUTE dbo.ShareStory_UpdateApproval
		 @isApproved
		,@ApprovedBy
		,@Id
*/

BEGIN

DECLARE @dateModified datetime2 = getutcdate()

UPDATE [dbo].[ShareStory]
   SET	 IsApproved = @isApproved
		,[ApprovedBy]=@ApprovedBy
		,[DateModified] = @dateModified
   where Id=@Id

END


GO
