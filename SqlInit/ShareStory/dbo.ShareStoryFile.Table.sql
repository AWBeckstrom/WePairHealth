/****** Object:  Table [dbo].[ShareStoryFile]    Script Date: 8/31/2023 4:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShareStoryFile](
	[FileId] [int] NOT NULL,
	[StoryId] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC,
	[StoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShareStoryFile]  WITH CHECK ADD  CONSTRAINT [FK_ShareStoryFile_Files] FOREIGN KEY([FileId])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[ShareStoryFile] CHECK CONSTRAINT [FK_ShareStoryFile_Files]
GO
ALTER TABLE [dbo].[ShareStoryFile]  WITH CHECK ADD  CONSTRAINT [FK_ShareStoryFile_ShareStory] FOREIGN KEY([StoryId])
REFERENCES [dbo].[ShareStory] ([Id])
GO
ALTER TABLE [dbo].[ShareStoryFile] CHECK CONSTRAINT [FK_ShareStoryFile_ShareStory]
GO
