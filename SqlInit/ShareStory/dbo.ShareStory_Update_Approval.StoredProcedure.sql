/****** Object:  StoredProcedure [dbo].[ShareStory_Update_Approval]    Script Date: 8/31/2023 4:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[ShareStory_Update_Approval]
			 @isApproved bit
			,@ApprovedBy int
			,@Id int

as

/*

DECLARE @Id int = 1 

DECLARE  @isApproved bit = 1 
		,@ApprovedBy int = 3

EXECUTE dbo.ShareStory_Update_Approval
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
