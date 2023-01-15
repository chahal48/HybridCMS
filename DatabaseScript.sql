USE [hybridcms]
GO
/****** Object:  Table [hybridcms].[tblAssets]    Script Date: 1/15/2023 10:56:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblAssets](
	[AssetId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AssetTypeId] [int] NOT NULL,
	[URL] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[ProfilePicture] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblAsset] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblAssetTypes]    Script Date: 1/15/2023 10:56:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblAssetTypes](
	[AssetTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AssetType] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAssetType] PRIMARY KEY CLUSTERED 
(
	[AssetTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblComments]    Script Date: 1/15/2023 10:56:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblComments](
	[CommentId] [bigint] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[PostId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblPosts]    Script Date: 1/15/2023 10:56:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblPosts](
	[PostId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetId] [bigint] NOT NULL,
	[ImageName] [nvarchar](500) NULL,
	[PostShortDescription] [nvarchar](50) NOT NULL,
	[Description1] [nvarchar](max) NULL,
	[Description2] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPost] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblReplies]    Script Date: 1/15/2023 10:56:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblReplies](
	[ReplyId] [bigint] IDENTITY(1,1) NOT NULL,
	[Reply] [nvarchar](200) NOT NULL,
	[CommentId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblReply] PRIMARY KEY CLUSTERED 
(
	[ReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblRoles]    Script Date: 1/15/2023 10:56:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblRoles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblUsers]    Script Date: 1/15/2023 10:56:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblUsers](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ProfilePicture] [nvarchar](max) NULL,
	[ForgetPasswordToken] [nvarchar](max) NULL,
	[GeneratedTokenTime] [datetime] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [hybridcms].[tblRoles] ON 

INSERT [hybridcms].[tblRoles] ([RoleId], [RoleName], [IsDeleted], [CreatedOn]) VALUES (1, N'Administration', 0, CAST(N'2023-01-10T11:24:47.480' AS DateTime))
INSERT [hybridcms].[tblRoles] ([RoleId], [RoleName], [IsDeleted], [CreatedOn]) VALUES (2, N'Admin', 0, CAST(N'2023-01-10T11:25:42.080' AS DateTime))
INSERT [hybridcms].[tblRoles] ([RoleId], [RoleName], [IsDeleted], [CreatedOn]) VALUES (3, N'User', 0, CAST(N'2023-01-10T11:26:03.057' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblRoles] OFF
GO
SET IDENTITY_INSERT [hybridcms].[tblUsers] ON 

INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (1, 2, N'Sachin', N'sachin1', N'9g3WKu1C6NE=', N'sachin.c@antheminfotech.com', 0, CAST(N'2023-01-10T11:08:56.257' AS DateTime), NULL, N'eceb34f4-f76f-4998-9d1c-62849cbaa6b8', CAST(N'2023-01-14T10:50:59.410' AS DateTime))
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (2, 3, N'Vikrant', N'vik1', N'A4tktFlzqzE=', N'vikrant@antheminfotech.com', 0, CAST(N'2023-01-10T11:30:27.267' AS DateTime), NULL, N'925a33d3-6f20-4035-b5ec-28bec097b4ac', CAST(N'2023-01-14T11:17:49.357' AS DateTime))
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (3, 3, N'Sandeep', N'san1', N'z/0RT5Ovc9E=', N'sandeep.b@antheminfotech.com', 0, CAST(N'2023-01-10T11:31:56.373' AS DateTime), NULL, NULL, NULL)
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (4, 1, N'Admin', N'admin', N'p8KyjCog0L8=', N'sachin.c@antheminfotech.com', 0, CAST(N'2023-01-11T22:36:38.303' AS DateTime), NULL, N'e88f11d9-46dd-4e6c-aafa-b08fa1afb407', CAST(N'2023-01-14T10:43:30.223' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblUsers] OFF
GO
ALTER TABLE [hybridcms].[tblAssets] ADD  CONSTRAINT [DF_tblAsset_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblAssets] ADD  CONSTRAINT [DF_tblAsset_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblAssetTypes] ADD  CONSTRAINT [DF_tblAssetType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblAssetTypes] ADD  CONSTRAINT [DF_tblAssetType_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblComments] ADD  CONSTRAINT [DF_tblComment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblComments] ADD  CONSTRAINT [DF_tblComment_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblComments] ADD  CONSTRAINT [DF_tblComment_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [hybridcms].[tblPosts] ADD  CONSTRAINT [DF_tblPost_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblPosts] ADD  CONSTRAINT [DF_tblPost_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblPosts] ADD  CONSTRAINT [DF_tblPost_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [hybridcms].[tblReplies] ADD  CONSTRAINT [DF_tblReply_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblReplies] ADD  CONSTRAINT [DF_tblReply_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblReplies] ADD  CONSTRAINT [DF_tblReply_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [hybridcms].[tblRoles] ADD  CONSTRAINT [DF_tblRoles_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblRoles] ADD  CONSTRAINT [DF_tblRoles_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_RoleId]  DEFAULT ((3)) FOR [RoleId]
GO
ALTER TABLE [hybridcms].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  StoredProcedure [hybridcms].[usp_AddAsset]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_AddAsset]
@Name NVARCHAR(100),
@UserId bigint,
@AssetTypeId int,
@URL NVARCHAR(50),
@Description NVARCHAR(200),
@ProfilePicture NVARCHAR(500) = null
AS
BEGIN

  INSERT INTO [hybridcms].[tblAssets]
           ([Name],[UserId],[AssetTypeId],[URL],[Description],[ProfilePicture])
     VALUES(@Name,@UserId,@AssetTypeId,@URL,@Description,@ProfilePicture)

END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_AddUser]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================================
-- Author:		Sachin Chahal
-- Create date: 04 Jan 2023
-- Description:	Used to insert new user details
-- Default column and values [RoleId = 2, IsDeleted = 0, CreatedOn = getdate()]
-- ============================================================================
CREATE PROCEDURE [hybridcms].[usp_AddUser]
@Name NVARCHAR(50),
@UserName NVARCHAR(20),
@Password NVARCHAR(50),
@EmailAddress NVARCHAR(50),
@ProfilePicture NVARCHAR(MAX) = NULL
AS
BEGIN
INSERT INTO [tblUsers]
           ([Name],[UserName],[Password],[EmailAddress],[ProfilePicture])

	 VALUES(@Name,@UserName,@Password,@EmailAddress,@ProfilePicture)
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_ChangeUserPassword]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Sachin Chahal
-- Create date: 02 Jan 2023
-- Description:	Used to change user password in tblUsers
-- ====================================================================
CREATE procedure [hybridcms].[usp_ChangeUserPassword]
@UserId bigint,
@CurrentPassword nvarchar(50),
@NewPassword nvarchar(50)
as
Begin
	UPDATE [tblUsers] 
	SET [Password] = @NewPassword
	WHERE   [UserId]    = @UserId 
		and [Password]  = @CurrentPassword
		and [IsDeleted] = 0
End
GO
/****** Object:  StoredProcedure [hybridcms].[usp_ChangeUserPasswordByToken]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_ChangeUserPasswordByToken]
@Password nvarchar(50),
@Token NVARCHAR(MAX)
AS
BEGIN
DECLARE @tokenTimeLimit AS datetime
set @tokenTimeLimit = DATEADD(minute,-15,GETDATE())
	Begin Try
		Begin Tran
			UPDATE [tblUsers]
			   SET [Password]= @Password
				 WHERE [ForgetPasswordToken] = @Token and 
				 [GeneratedTokenTime] > @tokenTimeLimit and
				 [IsDeleted] = 0
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
END


GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckEmailAlreadyExists]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_CheckEmailAlreadyExists]
@EmailAddress nvarchar(50)
AS
BEGIN
      SELECT COUNT([UserId]) FROM tblUsers WHERE [EmailAddress] = @EmailAddress
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckEmailorUsernameExists]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_CheckEmailorUsernameExists]
@EmailorUsername nvarchar(100) = ''
AS
BEGIN
      SELECT [EmailAddress] FROM tblUsers 
	  WHERE [EmailAddress] = trim(@EmailorUsername)
	     or [UserName] = trim(@EmailorUsername)
END


GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckUserNameAlreadyExists]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_CheckUserNameAlreadyExists]
@UserName nvarchar(50)
AS
BEGIN
	SELECT COUNT([UserId]) FROM tblUsers WHERE [UserName] = @UserName
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckUserPermission]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [hybridcms].[usp_CheckUserPermission]  --'admin','sachin123'
(
@RoleName nvarchar(50),
@UserName nvarchar(20)
)
AS
Begin
	SELECT count([UserId])
	FROM [tblUsers]
	join [tblRoles]
	on [tblUsers].[RoleId] = [tblRoles].[RoleId] and [tblRoles].[IsDeleted]=0
	WHERE Lower(UserName) = Lower(@UserName) AND Lower(RoleName) = Lower(@RoleName) AND [tblUsers].[IsDeleted]=0
END


GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckValidToken]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_CheckValidToken]
@Token NVARCHAR(MAX)
AS
BEGIN
DECLARE @tokenTimeLimit AS datetime;
set @tokenTimeLimit = DATEADD(minute,-15,GETDATE());

SELECT COUNT([UserId]) 
FROM tblUsers 
WHERE [ForgetPasswordToken] = @Token
and [GeneratedTokenTime] > @tokenTimeLimit 
and [IsDeleted] = 0
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CMSLogin]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_CMSLogin]  --'sachin','1iS1mVHShSPPuJqtTZxL7Q='
(
@UserName nvarchar (20),
@Password nvarchar (50)
)
AS
Begin
SELECT    
	UserId as Id,
	Name,
	UserName,
	EmailAddress as EmailId,
	ProfilePicture as Photo,
	Password,
	RoleId
FROM [tblUsers] WHERE Lower(UserName) = Lower(@UserName) AND Password = @Password AND isDeleted=0
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_DeleteAsset]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_DeleteAsset]
@AssetId bigint
AS
BEGIN
	UPDATE [hybridcms].[tblAssets] SET [IsDeleted] = 1 WHERE [AssetId] = @AssetId
END

GO
/****** Object:  StoredProcedure [hybridcms].[usp_DeleteUser]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_DeleteUser]
@UserId bigint
AS
BEGIN
	UPDATE [tblUsers] SET [IsDeleted] = 1 WHERE [UserId] = @UserId
END



GO
/****** Object:  StoredProcedure [hybridcms].[usp_GenerateTokenForResetPassword]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GenerateTokenForResetPassword]
@EmailorUsername nvarchar(100),
@Token NVARCHAR(MAX)
AS
BEGIN
	Begin Try
		Begin Tran
			UPDATE [tblUsers]
			   SET [ForgetPasswordToken] = @Token,
			   [GeneratedTokenTime] = GETDATE()
			 WHERE ([UserName] = trim(@EmailorUsername) or [EmailAddress] = trim(@EmailorUsername))
			 and [IsDeleted] = 0
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
END


GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllUser]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllUser]
AS
BEGIN

	SELECT [UserId],[Name],[UserName],[EmailAddress],[ProfilePicture] FROM [hybridcms].[tblUsers]
	WHERE [RoleId] != 1 and [IsDeleted] = 0 ORDER BY [CreatedOn] DESC

END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAssetDataByAssetId]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAssetDataByAssetId]
@AssetId bigint
AS
BEGIN
SELECT [AssetId],tbl_Asset.[Name],tbl_Admin.[Name],[AssetTypeId],[URL],
	   tbl_Asset.[CreatedOn],[Description],tbl_Asset.[ProfilePicture]
  FROM [hybridcms].[tblAssets] as tbl_Asset
  left join [hybridcms].[tblAdministrators] as tbl_Admin
  on tbl_Asset.[AdminId] = tbl_Admin.[AdminId]
  WHERE tbl_Asset.[AssetId] = @AssetId and tbl_Asset.[IsDeleted] = 0
  ORDER BY tbl_Asset.[CreatedOn] DESC
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetUserDataById]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetUserDataById]
@UserId bigint
AS
BEGIN
SELECT [UserId],[Name],[UserName],[EmailAddress],[ProfilePicture]
  FROM [hybridcms].[tblUsers]
  WHERE [UserId] = @UserId and [IsDeleted] = 0
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_UpdateAsset]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_UpdateAsset]
@AssetId bigint,
@Name NVARCHAR(100),
@AdminId bigint,
@AssetTypeId int,
@URL NVARCHAR(50),
@Description NVARCHAR(200),
@ProfilePicture NVARCHAR(500) = null
AS
BEGIN
	Begin Try
		Begin Tran
			IF(@ProfilePicture IS NOT NULL)
			BEGIN
				UPDATE [hybridcms].[tblAssets]
				SET [ProfilePicture] = @ProfilePicture
				WHERE [AssetId] = @AssetId
			END

				UPDATE [hybridcms].[tblAssets]
				SET [Name] = @Name
					,[AdminId] = @AdminId
					,[AssetTypeId] = @AssetTypeId
					,[URL] = @URL
					,[Description] = @Description
				Where [AssetId] = @AssetId
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_UpdateUser]    Script Date: 1/15/2023 10:56:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [hybridcms].[usp_UpdateUser]
@UserId bigint,
@Name NVARCHAR(50),
@UserName NVARCHAR(20),
@Password NVARCHAR(50),
@EmailAddress NVARCHAR(50),
@ProfilePicture NVARCHAR(MAX) = NULL
AS
BEGIN
	Begin Try
		Begin Tran
			IF(@ProfilePicture IS NOT NULL)
			BEGIN
				UPDATE [tblUsers]
				SET [ProfilePicture] = @ProfilePicture
				WHERE [UserId] = @UserId and [IsDeleted] = 0
			END

			UPDATE [tblUsers]
			   SET [Name] = @Name
				  ,[UserName] = @UserName
				  ,[Password] = @Password
				  ,[EmailAddress] = @EmailAddress
			 WHERE [UserId] = @UserId and [IsDeleted] = 0
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
END


GO
