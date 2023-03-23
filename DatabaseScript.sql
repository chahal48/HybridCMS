CREATE DATABASE [hybridcms]
GO
USE [hybridcms]
GO
/****** Object:  Table [hybridcms].[tblAssets]    Script Date: 23-03-2023 15:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblAssets](
	[AssetId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AssetTypeId] [int] NOT NULL,
	[URL] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProfilePicture] [nvarchar](500) NULL,
	[PublishedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAsset] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblAssetTypes]    Script Date: 23-03-2023 15:18:00 ******/
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
/****** Object:  Table [hybridcms].[tblPostBookmarks]    Script Date: 23-03-2023 15:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblPostBookmarks](
	[BookmarkId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[PostId] [bigint] NOT NULL,
	[IsBookmarked] [bit] NOT NULL,
	[CreateOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPostBookmarks] PRIMARY KEY CLUSTERED 
(
	[BookmarkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblPostComments]    Script Date: 23-03-2023 15:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblPostComments](
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
/****** Object:  Table [hybridcms].[tblPosts]    Script Date: 23-03-2023 15:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hybridcms].[tblPosts](
	[PostId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetId] [bigint] NOT NULL,
	[PostHeading] [nvarchar](50) NOT NULL,
	[PostDescription] [nvarchar](500) NULL,
	[ImageName] [nvarchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPost] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hybridcms].[tblReplies]    Script Date: 23-03-2023 15:18:00 ******/
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
/****** Object:  Table [hybridcms].[tblRoles]    Script Date: 23-03-2023 15:18:00 ******/
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
/****** Object:  Table [hybridcms].[tblUsers]    Script Date: 23-03-2023 15:18:00 ******/
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
SET IDENTITY_INSERT [hybridcms].[tblAssets] ON 

INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (1, N'Html Blogs', 1, 2, N'htmlblogs', 0, 1, CAST(N'2023-01-21T05:14:18.230' AS DateTime), N'This is my html blog.', NULL, CAST(N'2023-02-06T05:41:56.837' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (2, N'Code', 1, 1, N'code', 0, 1, CAST(N'2023-01-21T05:14:34.933' AS DateTime), N'Hello Everyone,  Let`s code together.', NULL, CAST(N'2023-02-06T05:41:56.837' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (3, N'Code With Sachin', 1, 1, N'codewithsachin', 0, 1, CAST(N'2023-01-21T08:43:39.297' AS DateTime), N'Hello Everyone,  Let`s code together.', NULL, CAST(N'2023-02-06T05:41:56.837' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (4, N'Html Blog', 2, 2, N'vikrantblog', 0, 1, CAST(N'2023-01-24T03:50:38.083' AS DateTime), N'Learn how to create a responsive blog .', NULL, CAST(N'2023-02-06T05:41:56.837' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (5, N'World Nature Park', 6, 1, N'WorldNaturePark', 0, 1, CAST(N'2023-01-25T01:24:54.673' AS DateTime), N'This page will display picyures and other content about the Natural aspects of world. ', NULL, CAST(N'2023-02-09T23:53:35.260' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (6, N'Jai Shri Krishna', 6, 2, N'JaiShriKrishna', 0, 1, CAST(N'2023-01-25T02:17:59.540' AS DateTime), N'<div><div><p><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">If
 you have new website and you don''t have any positive response on your 
latest website then what you think. SEO (Search Engine Optimization) is 
best option to get best rank on Google Search Engine Page.</font></font></p><div class="separator" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="clear: both; text-align: center;"><a data-original-attrs="{&quot;data-original-href&quot;:&quot;https://1.bp.blogspot.com/-i5r57cbhrRI/X84c-79mwDI/AAAAAAAABQM/R38c9ABa6rgDCqn4_nCSLkSs0pindw_jQCLcBGAsYHQ/s1920/seo-896175_1920%2B%25281%2529.png&quot;,&quot;style&quot;:&quot;&quot;}" href="https://www.blogger.com/#" style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img data-original-height="1009" data-original-width="1920" src="https://1.bp.blogspot.com/-i5r57cbhrRI/X84c-79mwDI/AAAAAAAABQM/R38c9ABa6rgDCqn4_nCSLkSs0pindw_jQCLcBGAsYHQ/s320/seo-896175_1920%2B%25281%2529.png" width="320" border="0"></a></div><br></div><div data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="text-align: justify;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">SEO
 stands for&nbsp;Search Engine Optimization, which is use to increasing 
the&nbsp;quality&nbsp; and quantity of traffic to your website through&nbsp;organic 
search engine results.</font></font></div><p></p><p><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font></font></p><div class="separator" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="clear: both; text-align: center;"><a data-original-attrs="{&quot;data-original-href&quot;:&quot;https://1.bp.blogspot.com/-ENU_V70ZtmI/X84cJTcNk5I/AAAAAAAABP8/U1MvfpXZAoYw0iD0Ln2qCs5VE7kSq6NPwCLcBGAsYHQ/s648/seo.png&quot;,&quot;style&quot;:&quot;&quot;}" href="https://www.blogger.com/#" style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img data-original-height="454" data-original-width="648" src="https://1.bp.blogspot.com/-ENU_V70ZtmI/X84cJTcNk5I/AAAAAAAABP8/U1MvfpXZAoYw0iD0Ln2qCs5VE7kSq6NPwCLcBGAsYHQ/s320/seo.png" width="320" border="0"></a></div><br></div><div data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="text-align: justify;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">There are two type of seo first one is “ON-PAGE SEO” and second one is “OFF-PAGE SEO”</font><b><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">ON-PAGE SEO</font></b></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">This
 type of SEO also known as “On-site SEO”, you needs knowledge of HTML 
code you have to optimizing&nbsp; the elements of code like adding your 
unique keywords, adding meta tags, testing speed etc.</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">There are some type of tags that you can use in “On-page SEO”:</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Meta
 Title : Meta title is a unique text related to you website which shows 
on google search page if your website is ranked. You can write title 
between 60 to 70 char and&nbsp; in pixels between 130 to 160px.</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">You can add this tag like</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&lt;title&gt;</font><a class="c-link" data-original-attrs="{&quot;data-original-href&quot;:&quot;https://antheminfotech.com/&quot;,&quot;data-sk&quot;:&quot;tooltip_parent&quot;,&quot;data-stringify-link&quot;:&quot;https://antheminfotech.com/&quot;,&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px; color: rgba(var(--sk_highlight,18,100,163),1);&quot;,&quot;target&quot;:&quot;_blank&quot;}" href="https://www.blogger.com/#" rel="noopener noreferrer" style="background-color: rgb(248, 248, 248); box-sizing: inherit; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;">https://antheminfotech.com/</a><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&lt;/title&gt;</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Meta
 Description : Meta Description is a short content which describe what 
you write in your website this is also shows on google search page same 
as title. You can write title between 150 to 165 char and&nbsp; in pixels 
between 140 to 680px.</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">You can add this tag like :</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&lt;meta name="description" content="This is my description"&gt;</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Meta
 Keyword : Meta keyword tag is used to show your unique keywords to 
google search page you have to choose keywords related to your website 
content.</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">You can add this tag like :</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&lt;meta name="description" content="best rank website, how to increace rank"&gt;</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Canonical tag : Canonical tag is used to show the root page of the website to google.</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">You can add this tag like :</font></font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&lt;link rel=“canonical” href=“</font><a class="c-link" data-original-attrs="{&quot;data-original-href&quot;:&quot;https://antheminfotech.com/&quot;,&quot;data-sk&quot;:&quot;tooltip_parent&quot;,&quot;data-stringify-link&quot;:&quot;https://antheminfotech.com/&quot;,&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px; color: rgba(var(--sk_highlight,18,100,163),1);&quot;,&quot;target&quot;:&quot;_blank&quot;}" href="https://www.blogger.com/#" rel="noopener noreferrer" style="background-color: rgb(248, 248, 248); box-sizing: inherit; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;">https://antheminfotech.com/</a><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">” /&gt;</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Image Size : Image size decreses the website speed that is not good for SEO. You can use images in kbs instead in mbs.</font></font></div><p></p><p><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&nbsp;</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><b><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">OFF-PAGE SEO</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"> </font></b><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&nbsp;</font></font></p><p data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="text-align: justify;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">This
 type of SEO also known as “Off-site SEO”, you have to knowledge about 
how to create links. Off-Page SEO is not happened directly on your 
website it takes time. Off-page seo depends on “Link-building,&nbsp; Local 
Seo and Social Media” .</font><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font></font></p><div class="separator" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="clear: both; text-align: center;"><a data-original-attrs="{&quot;data-original-href&quot;:&quot;https://1.bp.blogspot.com/-9cZAtUZBDro/X84csy90arI/AAAAAAAABQE/aCM_K02S-kwfBFkLfUemb8sxQLBt1ACdgCLcBGAsYHQ/s1280/seo-592747_1280.png&quot;,&quot;style&quot;:&quot;&quot;}" href="https://www.blogger.com/#" style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img data-original-height="844" data-original-width="1280" src="https://1.bp.blogspot.com/-9cZAtUZBDro/X84csy90arI/AAAAAAAABQE/aCM_K02S-kwfBFkLfUemb8sxQLBt1ACdgCLcBGAsYHQ/s320/seo-592747_1280.png" width="320" border="0"></a></div><p><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier">There are some type of links as shown below :</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&nbsp;</font></p><p><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Classified links</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Commenting Links</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Guest Post</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Competitive links</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Directory submission</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Blog Submission</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Profile Submissions</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Fourm Submissions</font><br data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Social Media Submissions</font></font></p><p></p><p data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="text-align: justify;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">&nbsp;</font><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><b><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">OFF-PAGE SEO TECHNIQUES</font></b><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">SEO techniques are used to get your website rank on top position on SERP page.</font><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">MOZ
 : Moz is useful site which provides SEO related or other means 
information, tips and mostly with subjective knowledge. The information 
provided by Moz articles leads to win factors of gaining goals.</font><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Ubersuggest
 : Uber suggest is a free keyword research tool made by Neil Patel . 
neil patel who is also an american youtuber and a web designer . Uber''s 
Suggest is a one of the best free keyword research tool .</font><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Serprobot
 :&nbsp; Serprobot is a keyword tracker website you can easily track your 
keyword on a daily basis if you have 500 keyword and want to track and 
check keyword position so you have the best tool if you 
use&nbsp;serprobot&nbsp;you can eassly track your keyword position.&nbsp;</font><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">SEO
 Profiler : SEO profiler is a web application that helps you to get 
higher rankings on Google and other search engines. With high rankings 
on search engines, you will get more website visitors, more customers 
and more sales. It focuses on the up-to-date SEO tasks that are needed 
to get high rankings with Google''s current ranking algorithm.</font><font class="c-mrkdwn__br" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;,&quot;data-stringify-type&quot;:&quot;paragraph-break&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; display: block; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; height: 8px; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">Ahref : Ahrefs is a well-known tool set for back-links and SEO analysis.</font></font></p><p data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="text-align: justify;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font class="c-mrkdwn__tab" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">At the moment we stand out from the herd of other similar services by the&nbsp;</font><font class="c-mrkdwn__tab" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;" color="#1d1c1d">	</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">largest base of Live links, huge Index and the best Speed of index updates.</font></font></p><p data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="text-align: justify;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font class="c-mrkdwn__tab" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;" color="#1d1c1d"></font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">We constantly improve all our algorithms to provide our customers with&nbsp;</font><font class="c-mrkdwn__tab" data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); box-sizing: inherit; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;" color="#1d1c1d">	</font><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d">freshest and most actual back-links data.</font></font></p><p data-original-attrs="{&quot;style&quot;:&quot;&quot;}" style="text-align: left;"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;&quot;}" face="courier"><font data-keep-original-tag="false" data-original-attrs="{&quot;style&quot;:&quot;-webkit-text-stroke-width: 0px;&quot;}" style="background-color: rgb(248, 248, 248); display: inline; float: none; font-size: 15px; font-style: normal; font-variant-caps: normal; font-variant-ligatures: common-ligatures; font-weight: 400; letter-spacing: normal; text-align: left; text-decoration-color: initial; text-decoration-style: initial; text-decoration-thickness: initial; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;" color="#1d1c1d"><br>&nbsp;</font></font></p>', N'', CAST(N'2023-02-06T05:41:56.837' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (7, N'Code With Sachin', 1, 1, N'htmlblogs', 0, 1, CAST(N'2023-01-25T06:45:55.310' AS DateTime), NULL, N'b0849525-3d83-4aae-82ae-e7e2b3477490.jpg', CAST(N'2023-02-09T00:48:58.000' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (8, N'This is my First Blog', 1, 2, N'SachinTeam', 0, 1, CAST(N'2023-01-25T15:40:01.233' AS DateTime), N'<div style="text-align: center;"><span style="font-family: Arial, Verdana; font-weight: bold; font-size: xxx-large; color: rgb(255, 0, 0); background-color: rgb(255, 255, 51);">This is my First Blog.</span></div><div style="text-align: center;"><font face="Arial, Verdana" style="font-size: xx-large;"><span style="color: rgb(51, 204, 0);">Hello Everyone</span>, <span style="text-decoration-line: line-through;">Let`s Code</span> <span style="text-decoration-line: underline;">Together.</span></font></div>', N'949ba0da-8547-4d25-b96d-2b7d3aa0c3ec.jpg', CAST(N'2023-02-06T05:43:36.777' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (9, N'This is a sample blog', 1, 2, N'SachinWork', 0, 1, CAST(N'2023-01-27T03:28:22.363' AS DateTime), N'Hello', N'9b7ecfb9-f932-4486-af22-cb932c155e9d.jpg', CAST(N'2023-02-06T05:41:56.837' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (10, N'This is a sample blog', 1, 2, N'Thisisasampleblog', 0, 0, CAST(N'2023-01-30T06:24:04.143' AS DateTime), N'<div style="text-align: center;"><span style="font-family: Arial, Verdana; font-size: xxx-large; font-weight: bold;"><span style="color: rgb(255, 0, 0);">Hello Everyone,</span> This is a <span style="background-color: rgb(255, 255, 0);">sample</span> <span style="color: rgb(0, 153, 0);">blog</span></span></div>', N'079f0041-8350-4fc6-b1cd-a66ca744eaf4.jpg', CAST(N'2023-02-08T11:27:39.333' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (11, N'Adani-Hindenburg war intensifies', 1, 2, N'NewsBlog', 0, 1, CAST(N'2023-01-30T22:39:05.690' AS DateTime), N'<div style="text-align: center;"><span style="font-weight: bold;"><span style="font-size: xx-large; color: rgb(0, 0, 153);">New Delhi, Jan 30 (PTI)</span><span style="font-size: x-large;">&nbsp;</span></span><span style="background-color: rgb(255, 255, 0);">Billionaire Gautam Adani''s embattled group clutched on to a USD 400-million</span> investment by Abu Dhabi''s International Holding Co. in its flagship firm''s share sale to restore confidence in the conglomerate that saw nearly <span style="font-size: x-large; color: rgb(255, 0, 0);">USD 70-billion rout in value after a tiny New York short seller came out with a damning report.</span></div><div style="text-align: center;"><br></div><br>
<b>alert("Hello")</b>', NULL, CAST(N'2023-02-07T03:36:34.467' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (12, N'This Freelance Writer Wanted Me to Pay', 1, 2, N'ThisFreelanceWriterWantedMetoPay', 0, 1, CAST(N'2023-02-03T05:57:48.583' AS DateTime), N'<p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Are you tired of dealing with dishonest freelance writers who use AI writing tools to create&nbsp;<a href="https://www.shoutmeloud.com/plagiarism-checker.html" data-lasso-id="24790" target="_blank" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">plagiarized content</a>&nbsp;and charge you the same amount as a `100% human writer?</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Look no further!</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="box-sizing: inherit; font-weight: 700;"><em style="box-sizing: inherit;">Recently, I was taken advantage of by a paid freelance writer who tried to dupe me by using an AI writing tool to generate content.</em></span></p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">I was highly disappointed and felt misled.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">I want to share my experience with you to raise awareness and ensure that this kind of thing doesn’t happen to anyone else.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Here at ShoutMeLoud, I write most of the content myself and often hire writers to increase the&nbsp;<span style="box-sizing: inherit; font-weight: 700;">content velocity&nbsp;</span>and meet our reader’s demand.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Today’s story is of a writer that I was about to hire, and it turned out to be a learning experience that might help many of you in your online business journey…</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Here is how the story unfolded:</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">A few days back, I posted this on my social profiles –</p><p class="has-light-green-cyan-background-color has-background" style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 20px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; border-radius: 5px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif;"><em style="box-sizing: inherit;">We are hiring an expert writer in the SEO and Digital marketing niche with 3+ years of writing experience.</em></p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Someone from Portugal 🇵🇹 reached out, and his content seemed original and looked like a decent candidate.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">I asked him to do a paid sample, and he submitted the article in 3 days…</p><p class="has-pale-cyan-blue-background-color has-background" style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 20px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; border-radius: 5px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif;">‼️Note: We are often hiring niche expert writers. If you have the right talent and 3+ years of experience, drop an email with your work and profile at hello[at]shoutmeloud.com</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">The article was good, but there was something off about it, and I gave him feedback and asked him these questions –</p><figure class="wp-block-image aligncenter size-full" style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 0px auto 1em; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; text-align: center; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><div class="ss-on-media-container wp-image-410892" style="box-sizing: inherit; position: relative; line-height: 0; margin: 0px !important; width: 100%; clear: both; display: inline;"><span class="ss-on-media-image-wrap wp-image-410892" style="box-sizing: inherit; line-height: 0; display: inline-block !important; position: relative !important;"><img decoding="async" width="1200" height="814" src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article.webp" alt="Automated AI writing tool" class="ss-on-media-img wp-image-410892 entered lazyloaded" data-lazy-srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article-400x271.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article-1024x695.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article-150x102.webp 150w" data-lazy-sizes="(max-width: 1200px) 100vw, 1200px" data-lazy-src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article.webp" data-ll-status="loaded" sizes="(max-width: 1200px) 100vw, 1200px" srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article-400x271.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article-1024x695.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-Article-150x102.webp 150w" style="box-sizing: border-box; border: 0px; height: auto; max-width: 100%; vertical-align: bottom; margin: 0px !important;"></span></div></figure><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">The highlighted question,&nbsp;<span style="box-sizing: inherit; font-weight: 700;"><em style="box-sizing: inherit;">“Have you taken any help from the automated AI writing tools for writing the same?&nbsp;</em></span><span style="box-sizing: inherit; font-weight: 700;"><em style="box-sizing: inherit;">“</em></span>&nbsp;has become my standard question to ask any writer who works for my network of blogs.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">To which he replied,</p><figure class="wp-block-image aligncenter size-full" style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 0px auto 1em; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; text-align: center; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><div class="ss-on-media-container wp-image-410893" style="box-sizing: inherit; position: relative; line-height: 0; margin: 0px !important; width: 100%; clear: both; display: inline;"><span class="ss-on-media-image-wrap wp-image-410893" style="box-sizing: inherit; line-height: 0; display: inline-block !important; position: relative !important;"><img decoding="async" width="1200" height="283" src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1.webp" alt="AI Written Article" class="ss-on-media-img wp-image-410893 entered lazyloaded" data-lazy-srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1-400x94.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1-1024x241.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1-150x35.webp 150w" data-lazy-sizes="(max-width: 1200px) 100vw, 1200px" data-lazy-src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1.webp" data-ll-status="loaded" sizes="(max-width: 1200px) 100vw, 1200px" srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1-400x94.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1-1024x241.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-1-150x35.webp 150w" style="box-sizing: border-box; border: 0px; height: auto; max-width: 100%; vertical-align: bottom; margin: 0px !important;"></span></div></figure><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">And he accepted that he used&nbsp;<a href="https://www.shoutmeloud.com/visit/jasper-free-trial/" target="_blank" rel="sponsored noopener" data-lasso-id="24726" data-lasso-name="Jasper AI  Writing Tool - Try For Free" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">Jasper.ai</a>&nbsp;tool to assist him with writing.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Now, here are a few things you need to know –</p><ul style="box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 1.5em; outline: 0px; padding: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; width: 672px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">When you pay someone for an article, you are not paying him to write with the help of AI writing tools.</li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">Google does not like automated-generated content. We talked&nbsp;<a href="https://www.shoutmeloud.com/seo-google-ai-generated-content.html" target="_blank" rel="noopener" data-lasso-id="24727" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">about this here</a>.</li></ul><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Anyways, I appreciated his honesty and praised him for the same.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">And asked him to remove AI-written content and replace it with 100% human-written text.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">After all, I’m not paying him for an article that is written by an AI tool. (It may become a norm in the future, but now right now)…</p><figure class="wp-block-image aligncenter size-full" style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 0px auto 1em; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; text-align: center; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><div class="ss-on-media-container wp-image-410895" style="box-sizing: inherit; position: relative; line-height: 0; margin: 0px !important; width: 100%; clear: both; display: inline;"><span class="ss-on-media-image-wrap wp-image-410895" style="box-sizing: inherit; line-height: 0; display: inline-block !important; position: relative !important;"><img decoding="async" width="1200" height="1462" src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2.webp" alt="AI Written Service" class="ss-on-media-img wp-image-410895 entered lazyloaded" data-lazy-srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2-328x400.webp 328w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2-840x1024.webp 840w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2-123x150.webp 123w" data-lazy-sizes="(max-width: 1200px) 100vw, 1200px" data-lazy-src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2.webp" data-ll-status="loaded" sizes="(max-width: 1200px) 100vw, 1200px" srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2-328x400.webp 328w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2-840x1024.webp 840w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-2-123x150.webp 123w" style="box-sizing: border-box; border: 0px; height: auto; max-width: 100%; vertical-align: bottom; margin: 0px !important;"></span></div></figure><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">After this, the writer went nuts and resorted to passive agressiveness (see the email and my reply)</p><figure class="wp-block-image aligncenter size-full" style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 0px auto 1em; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; text-align: center; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><div class="ss-on-media-container wp-image-410894" style="box-sizing: inherit; position: relative; line-height: 0; margin: 0px !important; width: 100%; clear: both; display: inline;"><span class="ss-on-media-image-wrap wp-image-410894" style="box-sizing: inherit; line-height: 0; display: inline-block !important; position: relative !important;"><img decoding="async" width="1200" height="1037" src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3.webp" alt="AI Written Article" class="ss-on-media-img wp-image-410894 entered lazyloaded" data-lazy-srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3-400x346.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3-1024x885.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3-150x130.webp 150w" data-lazy-sizes="(max-width: 1200px) 100vw, 1200px" data-lazy-src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3.webp" data-ll-status="loaded" sizes="(max-width: 1200px) 100vw, 1200px" srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3.webp 1200w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3-400x346.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3-1024x885.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/AI-Written-article-3-150x130.webp 150w" style="box-sizing: border-box; border: 0px; height: auto; max-width: 100%; vertical-align: bottom; margin: 0px !important;"></span></div></figure><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Of course, after his attitude, he does not deserve to work for ShoutMeLoud.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Still, I was genuinely curious to understand why he thought I or anyone would pay him for something that is not 100% his, and is written by a machine.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Let me help you understand this better –</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="box-sizing: inherit; font-weight: 700;">There are two standard ways by which we hire writers –</span></p><ol style="box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 1.5em; outline: 0px; padding: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; width: 672px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 50px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: decimal;">Pay per word – The writer gets paid for every word</li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 50px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: decimal;">For an entire article – The writer gets paid per article (wordcount often does not matter)</li></ol><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">In this scenario, he was hired for pay-per-word.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Now, if any writer is using AI writing tools to generate words, he is making more money, and that means the cost is on the webmaster like you or me.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">On top of it, AI-generated content is bad for organic SEO, as&nbsp;<a data-lasso-id="24728" href="https://www.shoutmeloud.com/seo-google-ai-generated-content.html" target="_blank" rel="noopener" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">Google does not like auto-generated content</a>.</p><div id="ez-toc-container" class="ez-toc-v2_0_43 counter-hierarchy ez-toc-counter ez-toc-grey ez-toc-container-direction" style="box-sizing: inherit; width: 672px; clear: both; background: rgb(248, 252, 255); border: 1px solid rgb(226, 237, 240); border-radius: 5px; box-shadow: none; display: table; margin: 40px 0px; padding: 40px; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; font-size: 16px;"><div class="ez-toc-title-container" style="box-sizing: inherit; display: table; width: 590px; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 1px dashed rgb(199, 226, 236); clear: both;"><p class="ez-toc-title" style="box-sizing: inherit; border: 0px; font-size: 19.2px; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: middle; display: contents; width: 100%; overflow: hidden; position: relative; line-height: 1.45;">Page Contents</p><span class="ez-toc-title-toggle" style="box-sizing: inherit; display: inline; vertical-align: middle;"><a href="https://www.shoutmeloud.com/freelancer-writer-ai-scam.html#" class="ez-toc-pull-right ez-toc-btn ez-toc-btn-xs ez-toc-btn-default ez-toc-toggle" area-label="ez-toc-toggle-icon-1" style="box-sizing: inherit; background: inherit; text-decoration-line: none; color: rgb(68, 68, 68); transition: all 0.2s linear 0s; display: flex; padding: 1px 5px; margin-bottom: 0px; font-size: 12px; line-height: 1.5; text-align: center; white-space: nowrap; vertical-align: middle; cursor: pointer; border: inherit; border-radius: 3px; user-select: none; box-shadow: none; text-shadow: none; margin-left: 10px; z-index: 9999; position: relative; align-items: center; flex-wrap: nowrap; float: right !important;"><label for="item-63c7852d876a1" aria-label="Table of Content" style="box-sizing: inherit; float: right; position: relative; font-size: 16px; padding: 0px; border: 1px solid rgb(153, 145, 145); border-radius: 5px; cursor: pointer; width: 35px; left: 10px;"><span style="box-sizing: inherit; display: flex; align-items: center; width: 35px; height: 30px; justify-content: center; direction: ltr;"><svg style="fill: #999;color:#999" xmlns="http://www.w3.org/2000/svg" class="list-377408" width="20px" height="20px" viewBox="0 0 24 24" fill="none"><path d="M6 6H4v2h2V6zm14 0H8v2h12V6zM4 11h2v2H4v-2zm16 0H8v2h12v-2zM4 16h2v2H4v-2zm16 0H8v2h12v-2z" fill="currentColor"></path></svg><svg style="fill: #999;color:#999" class="arrow-unsorted-368013" xmlns="http://www.w3.org/2000/svg" width="10px" height="10px" viewBox="0 0 24 24" version="1.2" baseProfile="tiny"><path d="M18.2 9.3l-6.2-6.3-6.2 6.3c-.2.2-.3.4-.3.7s.1.5.3.7c.2.2.4.3.7.3h11c.3 0 .5-.1.7-.3.2-.2.3-.5.3-.7s-.1-.5-.3-.7zM5.8 14.7l6.2 6.3 6.2-6.3c.2-.2.3-.5.3-.7s-.1-.5-.3-.7c-.2-.2-.4-.3-.7-.3h-11c-.3 0-.5.1-.7.3-.2.2-.3.5-.3.7s.1.5.3.7z"></path></svg></span></label><input type="checkbox" id="item-63c7852d876a1" style="color: rgb(128, 130, 133); font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 1rem; line-height: 2; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; margin: 0px; vertical-align: baseline; padding: 0px; position: absolute; left: -999em;"></a></span></div><nav style="box-sizing: inherit;"></nav></div><h3 id="h-how-would-google-know-if-the-content-is-written-by-an-ai-writing-tool" style="box-sizing: inherit; border: 0px; font-size: 1.5625rem; margin: 35px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; color: rgb(17, 17, 17); line-height: 1.2; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; width: 672px; overflow: hidden; position: relative; background-color: rgb(255, 255, 255);"><span class="ez-toc-section" id="How_would_Google_know_if_the_content_is_written_by_an_AI_writing_tool" ez-toc-data-id="#How_would_Google_know_if_the_content_is_written_by_an_AI_writing_tool" style="box-sizing: inherit; scroll-margin-top: 30px;"></span>How would Google know if the content is written by an AI writing tool?<span class="ez-toc-section-end" style="box-sizing: inherit;"></span></h3><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">In 2022, John Muller from Google’s team said they might not be able to check if an article is written by a human being or by an AI writing tool.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">At that time, there were not many tools like&nbsp;<a data-lasso-id="24729" data-lasso-name="Originality.AI" href="https://www.shoutmeloud.com/visit/originalityai/" target="_blank" rel="sponsored noopener" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">Originality.ai</a>&nbsp;or similar, which could easily&nbsp;<a href="https://www.shoutmeloud.com/ai-content-detector-tools.html" data-lasso-id="24791" target="_blank" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">detect if the content was written by an AI writing tool</a>.</p><figure class="wp-block-image size-large" style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 0px 0px 1em; outline: 0px; padding: 0px; vertical-align: baseline; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><div class="ss-on-media-container wp-image-410818" style="box-sizing: inherit; position: relative; line-height: 0; margin: 0px !important; width: 100%; clear: both; display: inline;"><span class="ss-on-media-image-wrap wp-image-410818" style="box-sizing: inherit; line-height: 0; display: inline-block !important; position: relative !important;"><img decoding="async" width="1024" height="637" src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-1024x637.webp" alt="" class="ss-on-media-img wp-image-410818 entered lazyloaded" data-lazy-srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-1024x637.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-400x249.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-150x93.webp 150w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-320x200.webp 320w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1.webp 1200w" data-lazy-sizes="(max-width: 1024px) 100vw, 1024px" data-lazy-src="https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-1024x637.webp" data-ll-status="loaded" sizes="(max-width: 1024px) 100vw, 1024px" srcset="https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-1024x637.webp 1024w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-400x249.webp 400w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-150x93.webp 150w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1-320x200.webp 320w, https://www.shoutmeloud.com/wp-content/uploads/2023/01/How-to-check-if-a-content-is-written-by-AI-tool-1.webp 1200w" style="box-sizing: border-box; border: 0px; height: auto; max-width: 100%; vertical-align: bottom; margin: 0px !important;"></span></div></figure><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Things are evolving fast, and now anyone can use a similar tool to find out what percentage of the article is written by humans or machines.</p><h3 id="h-a-few-takeaways-from-this-experience" style="box-sizing: inherit; border: 0px; font-size: 1.5625rem; margin: 35px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; color: rgb(17, 17, 17); line-height: 1.2; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; width: 672px; overflow: hidden; position: relative; background-color: rgb(255, 255, 255);"><span class="ez-toc-section" id="A_few_takeaways_from_this_experience" ez-toc-data-id="#A_few_takeaways_from_this_experience" style="box-sizing: inherit; scroll-margin-top: 30px;"></span>A few takeaways from this experience –<span class="ez-toc-section-end" style="box-sizing: inherit;"></span></h3><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Now, my favorite part, let’s look at some of the takeaways from this incident –</p><ul style="box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 1.5em; outline: 0px; padding: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; width: 672px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">If you are a webmaster/blogger and hiring someone to write content for you, use a tool like&nbsp;<a data-lasso-id="24730" data-lasso-name="Originality.AI" href="https://www.shoutmeloud.com/visit/originalityai/" target="_blank" rel="sponsored noopener" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">Originality.AI</a>&nbsp;or any other&nbsp;<a data-lasso-id="24731" href="https://www.shoutmeloud.com/ai-content-detector-tools.html" target="_blank" rel="noopener" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">AI content detector tool</a>&nbsp;to check the authenticity and originality of the content.</li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">Be aware that&nbsp;<a data-lasso-id="24732" href="https://www.shoutmeloud.com/seo-google-ai-generated-content.html" target="_blank" rel="noopener" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">Google is against automated content</a>, which might impact your blog/website’s organic traffic in future algorithm updates.</li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">If you are hiring a writer, inform them not to use an AI writing tool and ask if they have used any similar tool to write content.</li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">If you are a freelance writer and if you are using an AI writing tool, you should be aware that it might cost you your job or the project. It would be best if you discussed or inform your client that you often take the help of such tools. Some clients might be ok with it, and some might not. From here on, it is your choice if you want to work with such a client or not.</li></ul><h2 style="box-sizing: inherit; border: 0px; font-size: 1.875rem; margin: 35px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; color: rgb(17, 17, 17); line-height: 1.2; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; width: 672px; overflow: hidden; position: relative; background-color: rgb(255, 255, 255);"><span class="ez-toc-section" id="How_to_deal_if_you_find_your_paid_writer_is_using_an_AI_tool_to_write" ez-toc-data-id="#How_to_deal_if_you_find_your_paid_writer_is_using_an_AI_tool_to_write" style="box-sizing: inherit; scroll-margin-top: 30px;"></span>How to deal if you find your paid writer is using an AI tool to write?<span class="ez-toc-section-end" style="box-sizing: inherit;"></span></h2><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Now, if you used a tool like&nbsp;<a href="https://www.shoutmeloud.com/visit/originalityai/" rel="sponsored noopener" target="_blank" data-lasso-id="24792" data-lasso-name="Originality.AI" style="box-sizing: inherit; background-color: transparent; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">Originality</a>&nbsp;to check whether the writer is using an AI tool, you discover they are.</p><ul style="box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 1.5em; outline: 0px; padding: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; width: 672px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">What would you do?</li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">How would you handle such a situation?</li></ul><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">For many of us, it is natural to be angry, and it might feel like our trust is broken. And then there is fear that you might be penalized in the future if Google rolls out an algorithmic update to penalize websites with high AI-generated content. (In my opinion, there is high possibility of this)</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">However, instead of acting out of anger, you should take a few deep breaths.</p><ul class="has-pale-cyan-blue-background-color has-background" style="box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 1.5em; outline: 0px; padding: 1.25em 2.375em; vertical-align: baseline; list-style-position: initial; list-style-image: initial; width: 672px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif;"><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">The first thing you should know is – That tools like Originality or other AI content detector tools is not 100% accurate. The Originality team claims it to be 94% accurate, so you need to have room for errors.</li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;">The second thing – When you use a tool like&nbsp;<a href="https://www.shoutmeloud.com/grammarly-review.html" style="box-sizing: inherit; color: rgb(202, 33, 41); transition: all 0.2s linear 0s; z-index: 9999; position: relative;">Grammarly</a>, it could often be detected as AI written tool.</li></ul><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">As I mentioned above, you should first have an honest conversation with your freelance writer.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">First, try to find out if they ever used an AI writing tool to write an article for you. If they did, help them understand why this is bad for the SEO and your brand reputation. Often they are not aware of the impact and might be duping you unknowingly.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">Also, let them understand what help they can take from an AI writing tool.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">If you are into serious business, consider creating a legal document where you can have rules defined for engagement and mention about the use of AI tools.</p><p style="box-sizing: inherit; border: 0px; font-size: 16px; margin: 1px 0px 14px; outline: 0px; padding: 0px; vertical-align: baseline; width: 672px; overflow: hidden; position: relative; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);">I would love to hear how you have handled the situation.</p><ul style="box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 1.5em; outline: 0px; padding: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; width: 672px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;"><em style="box-sizing: inherit;">How’s your experience with AI writing tools and people creating content using AI tools?</em></li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;"><em style="box-sizing: inherit;">Have you ever fired a writer who used AI writing tools to create a piece of content?</em></li><li style="box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin: 0px 0px 0px 40px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-type: disc;"><em style="box-sizing: inherit;"></em><em style="box-sizing: inherit;">Would you pay the same for an article that is written with the assistance of an AI tool?</em></li></ul>', N'', CAST(N'2023-02-08T11:28:28.473' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (13, N'A better Blogger experience on the web', 1, 2, N'AbetterBloggerexperienceontheweb', 0, 1, CAST(N'2023-02-03T06:10:48.720' AS DateTime), N'<div dir="ltr" style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; font-size: 17px; line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span id="docs-internal-guid-83e698cd-7fff-3537-1fd4-931000cddafb"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">Since 1999, millions of people have expressed themselves on Blogger. From detailed posts about almost every </span><a href="https://adamapples.blogspot.com/" style="color: rgb(65, 132, 243); text-decoration-line: none;"><span style="color: rgb(17, 85, 204); font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">apple variety</span></a><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"> you could ever imagine to a blog dedicated to </span><a href="https://howtoblog.krishnainfotron.com/" style="color: rgb(65, 132, 243); text-decoration-line: none;"><span style="color: rgb(17, 85, 204); font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">the art of blogging</span></a><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"> itself, the ability to easily share, publish and express oneself on the web is at the core of Blogger’s mission. As the web constantly evolves, we want to ensure anyone using Blogger has an easy and intuitive experience publishing their content to the web.</span><span style="font-family: arial; font-size: 11pt; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">&nbsp;&nbsp;</span></span></div><span id="docs-internal-guid-83e698cd-7fff-3537-1fd4-931000cddafb" style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; font-size: 17px;"><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">That’s why we’ve been slowly introducing an improved web experience for Blogger. Give the fresh interface a spin by clicking “Try the New Blogger” in the left-hand navigation pane.&nbsp;</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"><br style="content: &quot; &quot;; display: block; padding: 4px;"></span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt; text-align: center;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"><span style="border: none; display: inline-block; overflow: hidden;"><img src="https://lh5.googleusercontent.com/kWHfhyDmS0K6WMbTlfDV8Hq9RKq7Cs2sbPVl0otK3zDV5jNDO0SxM5-Ot89Wo3E11QvmNMI7VYMimqP-Vg9li-cz0cimWiGpJM65-uOSCmAvSN5n7M-lGcNWNW2u0cAfA54ZsGhZ" width="508" style="max-width: 100%; margin: 0px 0px 20px;"></span></span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt; text-align: center;"><span style="color: red; font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt; text-align: center;"><span style="font-family: arial; font-size: 9pt; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">&nbsp;</span><span style="font-family: arial; font-size: 9pt; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">Click the “Try the New Blogger” button to see Blogger’s refreshed look and feel.</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">In addition to a fresh feel, Blogger is now responsive on the web, making it easier to use on mobile devices. By investing in an improved web platform, it allows the potential for new features in the future.&nbsp;</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"><br style="content: &quot; &quot;; display: block; padding: 4px;"></span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt; text-align: center;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"><span style="border: none; display: inline-block; height: 299px; overflow: hidden; width: 146px;"><img height="299" src="https://lh4.googleusercontent.com/B-Tx1tl3m3_sH_4HiCg0XxhlTka0IV82jwT2LT4T9kzbXF15nMxjwNGe3NUAz-F42irNGdDINUiw4DM---nX_87Bb0X3OL_s5L19Rlyfhtm6oyEMNR1R4473TzkgsuxWQ3HXOIOV" width="146" style="max-width: 100%; margin: 0px 0px 20px;"></span></span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt; text-align: center;"><span style="font-family: arial; font-size: 8pt; vertical-align: baseline; white-space: pre-wrap;"><span style="font-size: x-small;"><font size="2">Blogger’s new responsive design makes it easy to manage your blog on-the-go.</font></span></span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"><br style="content: &quot; &quot;; display: block; padding: 4px;"></span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">Learn more about the page-specific updates we’ve released to make your Blogger experience even better:&nbsp;</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; font-weight: 700; vertical-align: baseline; white-space: pre-wrap;">Stats</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">The redesigned Stats page helps you focus on the most important data from your blog by highlighting your most recent post.&nbsp;&nbsp;&nbsp;&nbsp;</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; font-weight: 700; vertical-align: baseline; white-space: pre-wrap;">Comments</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">A fresh Comments page helps you connect with readers more easily by surfacing areas that need your attention, like comment moderation.&nbsp;&nbsp;</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; font-weight: 700; vertical-align: baseline; white-space: pre-wrap;">Posts</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">We’ve improved support for </span><a href="https://support.google.com/blogger/answer/9675453?hl=en" style="color: rgb(65, 132, 243); text-decoration-line: none;"><span style="color: rgb(17, 85, 204); font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">Search Operators</span></a><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;"> on the Posts page to help you filter your Blogger posts and page search results more easily.&nbsp;</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; font-weight: 700; vertical-align: baseline; white-space: pre-wrap;">Editor</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">The newly enhanced Editor page introduces table support, enables better transliteration, and includes an improved image/video upload experience.&nbsp;</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; font-weight: 700; vertical-align: baseline; white-space: pre-wrap;">Reading List&nbsp;</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">Even if you don’t create from your phone, it’s now easier than ever to read blogs from other creators while you’re on the go.</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; font-weight: 700; vertical-align: baseline; white-space: pre-wrap;">Settings&nbsp;</span></div><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">We’ve streamlined the Settings page to help you manage all your controls from one place.&nbsp;&nbsp;</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">We’ll be moving everyone to the new interface over the coming months. Starting in late June, many Blogger creators will see the new interface become their default, though they can revert to the old interface by clicking “Revert to legacy Blogger” in the left-hand navigation. By late July, creators will no longer be able to revert to the legacy Blogger interface.&nbsp;&nbsp;</span></div><br style="content: &quot; &quot;; display: block; padding: 4px;"><div dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="font-family: arial; font-size: 11pt; vertical-align: baseline; white-space: pre-wrap;">We recommend getting ahead of the transition by opting into the experience today. Be sure to let us know what you think about the new design by tapping the Help icon in the top navigation bar. We can’t wait to see how Blogger creators use the latest updates to share their voice with the world.</span></div></span>', N'', CAST(N'2023-02-09T10:34:45.517' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (14, N'Blockchain Technology : Smart Contracts', 2, 2, N'BlockchainTechnologySmartContracts', 0, 1, CAST(N'2023-02-03T06:30:05.073' AS DateTime), N'<h2 class="separator" style="margin: 0px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; background-color: rgb(255, 255, 255); clear: both;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Origin of Smart Contract</span></h2><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);"><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart contract concept was developed by&nbsp;<a href="https://en.wikipedia.org/wiki/Nick_Szabo" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">"Nick Szabo"</a>&nbsp;in 1994 with the goal of bringing practices of contract law and practice to&nbsp; design&nbsp;the&nbsp;electronic protocols between strangers on the Internet. Bitcoin emerged the use of contracts/blocks on a&nbsp;<a href="https://blog.antheminfotech.com/2018/04/block-chain-technology-introduction.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">blockchain</a>. Ethereum has made smart contracts operational along with the facility of ready made templates for various purposes.</span><span style="font-family: &quot;courier new&quot;, courier, monospace;">&nbsp;Smart contracts in general can be used to form any type of agreement that consists of specific &amp; precise conditions and outcomes.</span></div><h2 style="margin: 0px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: normal; color: rgb(0, 0, 0);"><span style="font-family: &quot;courier new&quot;, courier, monospace;">What is Smart Contract ?</span></h2></div><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><a href="https://3.bp.blogspot.com/-UZ45KccUNEw/WuxEHcNGaaI/AAAAAAAAA5U/a0tltL6xMtoKnYVxMxacA7rjE3UX4GdYwCLcBGAs/s1600/Smart_Cont_Diljeet.jpg" style="text-decoration-line: none; color: rgb(83, 140, 214); clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img border="0" data-original-height="130" data-original-width="680" src="https://3.bp.blogspot.com/-UZ45KccUNEw/WuxEHcNGaaI/AAAAAAAAA5U/a0tltL6xMtoKnYVxMxacA7rjE3UX4GdYwCLcBGAs/s1600/Smart_Cont_Diljeet.jpg" style="border: none; position: relative;"></a></span></div><ul style="padding: 0px 2.5em; margin: 0.5em 0px; line-height: 1.4; color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);"><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><span class="article-content">Smart Contract is a set of rules in the form of programming&nbsp; code that adds layers of information onto digital transactions being executed on a&nbsp;<a href="https://blog.antheminfotech.com/2018/04/block-chain-technology-introduction.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">blockchain</a>.</span>&nbsp;</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart contracts are digital programs or contracts which may be executable or kick starter.&nbsp;<span class="article-content"><span class="article-content">They execute the instructions given to them automatically.</span></span></span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">To process a Smart Contract a&nbsp;<a href="https://blog.antheminfotech.com/2018/04/block-chain-technology-introduction.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">blockchain</a>&nbsp;is required and&nbsp;<span class="article-content">Contracts can be encoded on any blockchain.</span></span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Blockchain is a virtual machine and it runs a smart contract.</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart contract is the basic unit of programming a&nbsp;<a href="https://blog.antheminfotech.com/2018/04/block-chain-technology-introduction.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">blockchain</a>&nbsp;for business purposes.</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart contract creates assets or tokenize existing assets on a blockchain.</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">A smart contract enforces terms of the agreement through programming crypto-graphically.</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart contracts ensures a specific set of results.&nbsp;</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart Contracts are formed with the combined work of two parties "Software Developer" and "Lawyer". So a need for litigation is not required for that.</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart Contract&nbsp;<span class="article-content">is an agreement between all bodies involved in a transaction that holds everyone involved responsible for their role.&nbsp;</span></span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart contracts facilitate to perform required transactions without any involvement of 3rd party.</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">All the transactions performed by a smart contract are track-able this enables to maintain transaction history for records. Such transaction can not be reversed.&nbsp;</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><span class="article-content">Instead of simply exchanging digital tokens for a service or a product, smart contracts facilitate with more complex transactions through them.</span>&nbsp;</span></li><li style="padding: 0px; margin: 0px 0px 0.25em; text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Benefits of using smart contracts instead of traditional contracts are increased speed, efficiency &amp; trust among the parties.&nbsp;&nbsp;</span></li></ul><h2 style="margin: 0px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; background-color: rgb(255, 255, 255);"><span style="font-family: &quot;courier new&quot;, courier, monospace;">&nbsp;</span></h2><h2 style="margin: 0px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; background-color: rgb(255, 255, 255);"><span style="font-family: &quot;courier new&quot;, courier, monospace;">How Smart Contract Works ?</span></h2><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255); text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart contract is formed with the consultation of lawyer on legal terms and with the help of a programmer who code those terms and write set of rules in the form of program.&nbsp;</span></div><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255); text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">That set of rules i.e. smart contract is then placed in a block of a blockchain.&nbsp;</span></div><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255); text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">This contract is spread and copied multiple times between the nodes of a blockchain. Now whenever a smart contract get triggers by a request on&nbsp;<a href="https://blog.antheminfotech.com/2018/04/block-chain-technology-introduction.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">blockchain</a>&nbsp;then the programs of smart contract gets executed and perform actions as per written terms and conditions. The program verifies implementation of the rules by itself.</span></div><h2 style="margin: 0px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; background-color: rgb(255, 255, 255);"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Smart Contract Example</span></h2><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255); text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Payment settlement after a job is complete.&nbsp;</span></div><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255); text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Assuming that their are two parties in which a payment has to made based on a job. In this case a smart contract plays an automatic and trustworthy role. A legal contract is made between a client and vendor based on various terms and conditions. Payment is made based on these terms. On start of the contract full payment is made by the client and it goes to an intermediate wallet. This payment will be release to vendor on completion of the job and only when both of the parties agrees. If any of the party disagrees and terms of the contract are not full filled the wallet payment goes back to client automatically.</span></div><h2 style="margin: 0px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; background-color: rgb(255, 255, 255);"><span style="font-family: &quot;courier new&quot;, courier, monospace;">&nbsp;</span></h2><h2 style="margin: 0px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; background-color: rgb(255, 255, 255);"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Anatomy of a Smart Contract</span></h2><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);"><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><b>Elements&nbsp;</b>of a contract are mutual consent, consideration, capacity, and legality.&nbsp;</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><br></span><span style="font-family: &quot;courier new&quot;, courier, monospace;">Formation of&nbsp;<b>Smart contracts depends on the information</b>&nbsp;of</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">- Various parties involved,</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">- Their obligations,</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">- Time,&nbsp;</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">- Terms and Conditions,</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">- Host that will execute contract code,</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">- Contract Outcomes</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><br></span><span style="font-family: &quot;courier new&quot;, courier, monospace;"><b>Three main stages&nbsp;</b>during the formation of a smart contract -</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">First :&nbsp;</span><span style="font-family: &quot;courier new&quot;, courier, monospace;">Translating the terms of the contract into code.&nbsp;</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">2nd : Ensuring the mutual consent from all parties for the correctness &amp; outcomes of the code written for contract.</span></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">3rd : Execution of the code in impartial way so that results are always trustworthy and precise.</span></div><div style="text-align: justify;"><br></div><div style="text-align: justify;"><b><span style="font-family: &quot;courier new&quot;, courier, monospace;">Coding Structure of a Smart Contract</span></b></div><div style="text-align: justify;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">A contract is similar to a class. A contract code is consist of state variables, functions, function modifiers, events, structures, and enums. It supports inheritance and polymorphism concepts of Object oriented programming.&nbsp;</span></div><span style="font-family: &quot;courier new&quot;, courier, monospace;"><br></span><br><table cellpadding="0" cellspacing="0" class="tr-caption-container" style="padding: 4px; margin-bottom: 0.5em; position: relative; float: left; margin-right: 1em;"><tbody><tr><td style="text-align: center;"><a href="https://4.bp.blogspot.com/-FuBpQtF21BM/WvQXX3stpII/AAAAAAAAA6I/nVFenuxwlHwYtk53fUSUWbPkGSjFcTwTgCLcBGAs/s1600/smartcontractStructure.jpg" imageanchor="1" style="text-decoration-line: none; color: rgb(83, 140, 214); clear: left; margin-bottom: 1em; margin-left: auto; margin-right: auto;"><img border="0" data-original-height="662" data-original-width="598" src="https://4.bp.blogspot.com/-FuBpQtF21BM/WvQXX3stpII/AAAAAAAAA6I/nVFenuxwlHwYtk53fUSUWbPkGSjFcTwTgCLcBGAs/s1600/smartcontractStructure.jpg" style="border: none; position: relative;"></a></td></tr><tr><td class="tr-caption" style="font-size: 10.4px; text-align: center;"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Example : Structure of Smart Contract Progra<span style="font-size: x-small;">m</span></span></td></tr></tbody></table><span style="font-family: &quot;courier new&quot;, courier, monospace;"><br></span><br><table cellpadding="0" cellspacing="0" class="tr-caption-container" style="padding: 4px; margin-bottom: 0.5em; position: relative; float: left; margin-right: 1em;"><tbody><tr><td style="text-align: center;"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><a href="http://solidity.readthedocs.io/en/v0.4.21/introduction-to-smart-contracts.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214); clear: left; margin-bottom: 1em; margin-left: auto; margin-right: auto;"><img alt="." border="0" data-original-height="496" data-original-width="419" src="https://2.bp.blogspot.com/-ozC-Cj350Hc/WvL2s4RnNEI/AAAAAAAAA5w/KMc-mD1FXdQHdF8mLh9JaZtuvJk4FdmBwCLcBGAs/s1600/Smart_Contract_Code.png" style="border: none; position: relative;"></a></span></td></tr><tr><td class="tr-caption" style="font-size: 10.4px; text-align: center;"><span style="font-family: &quot;courier new&quot;, courier, monospace;"><a href="http://solidity.readthedocs.io/en/v0.4.21/introduction-to-smart-contracts.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">Code for a contract of simple Cryptocurrency</a></span></td></tr></tbody></table><br><br><br><br><br><br><br><br><span style="font-family: &quot;courier new&quot;, courier, monospace;"><a href="https://en.wikipedia.org/wiki/Solidity" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">Solidity</a><span style="font-size: x-small;">&nbsp;<span style="font-size: small;">is a contract-oriented programming language for writing smart contracts. It is used for implementing smart contracts[2] on various&nbsp;<a href="https://blog.antheminfotech.com/2018/04/block-chain-technology-introduction.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">blockchain</a>&nbsp;platforms. It was developed by Gavin Wood, Christian Reitwiessner, Alex Beregszaszi, Liana Husikyan, Yoichi Hirai and several former Ethereum core contributors to enable writing smart contracts on blockchain platforms such as Ethereum.</span></span></span><br><br><br><br><br><br><br><span style="font-family: &quot;courier new&quot;, courier, monospace;"><span style="font-size: x-small;"></span></span><br><a name="more"></a><span style="font-family: &quot;courier new&quot;, courier, monospace;">I have tried to keep this article small and precise . I will keep adding more in future.</span></div><div style="color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, Trebuchet, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);"><br><div><span style="font-family: &quot;courier new&quot;, courier, monospace;">You may know more about Blockchain Technology through below articles</span></div><div><a href="https://blog.antheminfotech.com/2018/04/block-chain-technology-introduction.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);"><span style="font-family: &quot;courier new&quot;, courier, monospace;">Blockchain Technology : Introduction</span></a><span style="font-family: &quot;courier new&quot;, courier, monospace;"></span></div><div><span style="font-family: &quot;courier new&quot;, courier, monospace;"><a href="https://blog.antheminfotech.com/2018/05/block-chain-technology-pros-cons.html" target="_blank" style="text-decoration-line: none; color: rgb(83, 140, 214);">Blockchain Technology : Pros and Cons</a></span></div><div><br><span style="font-family: &quot;courier new&quot;, courier, monospace;">Cheers for Happy Life !!!</span></div></div>', N'', CAST(N'2023-02-06T05:41:56.837' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (15, N'Vikrant`s Page', 2, 1, N'VikrantsPage', 0, 1, CAST(N'2023-02-10T00:36:54.737' AS DateTime), N'Hello from vikrant page', N'', CAST(N'2023-02-10T00:38:15.337' AS DateTime))
INSERT [hybridcms].[tblAssets] ([AssetId], [Name], [UserId], [AssetTypeId], [URL], [IsDeleted], [IsPublished], [CreatedOn], [Description], [ProfilePicture], [PublishedOn]) VALUES (16, N'Test Page1', 1, 1, N'TestPage', 0, 0, CAST(N'2023-02-14T22:46:57.900' AS DateTime), N'Nothing to write ....', N'', CAST(N'2023-02-14T22:46:57.900' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblAssets] OFF
GO
SET IDENTITY_INSERT [hybridcms].[tblAssetTypes] ON 

INSERT [hybridcms].[tblAssetTypes] ([AssetTypeId], [AssetType], [IsDeleted], [CreatedOn]) VALUES (1, N'Page', 0, CAST(N'2023-01-17T22:24:11.150' AS DateTime))
INSERT [hybridcms].[tblAssetTypes] ([AssetTypeId], [AssetType], [IsDeleted], [CreatedOn]) VALUES (2, N'Group', 0, CAST(N'2023-01-17T22:24:30.477' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblAssetTypes] OFF
GO
SET IDENTITY_INSERT [hybridcms].[tblPostBookmarks] ON 

INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (2, 6, 19, 0, CAST(N'2023-02-02T03:49:52.263' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (3, 2, 18, 1, CAST(N'2023-02-02T12:50:15.420' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (4, 2, 19, 1, CAST(N'2023-02-02T12:51:25.690' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (5, 2, 12, 0, CAST(N'2023-02-03T01:44:19.707' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (6, 3, 12, 0, CAST(N'2023-02-03T01:54:22.060' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (7, 1, 10, 1, CAST(N'2023-02-03T05:04:00.740' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (8, 3, 19, 0, CAST(N'2023-02-04T10:36:53.407' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (9, 3, 6, 1, CAST(N'2023-02-07T01:22:35.707' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (10, 3, 11, 0, CAST(N'2023-02-08T01:51:35.380' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (11, 3, 3, 0, CAST(N'2023-02-08T02:50:03.860' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (12, 3, 2, 0, CAST(N'2023-02-08T02:50:05.040' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (13, 3, 1, 0, CAST(N'2023-02-08T02:50:06.350' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (14, 3, 20, 1, CAST(N'2023-02-09T01:55:07.997' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (15, 7, 11, 1, CAST(N'2023-02-09T23:23:21.530' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (16, 7, 19, 1, CAST(N'2023-02-09T23:23:24.133' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (17, 7, 20, 1, CAST(N'2023-02-09T23:23:38.867' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (18, 7, 5, 1, CAST(N'2023-02-09T23:23:41.227' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (19, 7, 6, 1, CAST(N'2023-02-09T23:23:43.413' AS DateTime))
INSERT [hybridcms].[tblPostBookmarks] ([BookmarkId], [UserId], [PostId], [IsBookmarked], [CreateOn]) VALUES (20, 7, 2, 1, CAST(N'2023-02-09T23:23:47.467' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblPostBookmarks] OFF
GO
SET IDENTITY_INSERT [hybridcms].[tblPostComments] ON 

INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (1, N'My First Comment for testing purpose.', 20, 1, 0, CAST(N'2023-02-09T03:57:25.733' AS DateTime), CAST(N'2023-02-09T03:57:25.733' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (2, N'My First Comment for testing purpose.', 20, 6, 0, CAST(N'2023-02-09T03:57:35.523' AS DateTime), CAST(N'2023-02-09T03:57:35.523' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (3, N'Hello from comment.', 20, 7, 0, CAST(N'2023-02-09T04:00:04.110' AS DateTime), CAST(N'2023-02-09T04:00:04.110' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (4, N'Note that we don’t provide utility classes for justified text. While, aesthetically, justified text might look more appealing, it does make word-spacing more random and therefore harder to read. HELLO', 20, 3, 0, CAST(N'2023-02-09T05:18:21.220' AS DateTime), CAST(N'2023-02-09T05:18:21.220' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (5, N'Hello', 18, 1, 0, CAST(N'2023-02-09T05:47:42.703' AS DateTime), CAST(N'2023-02-09T05:47:42.703' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (6, N'Hello 2.0', 18, 6, 0, CAST(N'2023-02-09T05:51:33.220' AS DateTime), CAST(N'2023-02-09T05:51:33.220' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (7, N'Hello 3.0', 18, 7, 0, CAST(N'2023-02-09T05:54:27.393' AS DateTime), CAST(N'2023-02-09T05:54:27.393' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (8, N'Hello 4.0', 18, 3, 1, CAST(N'2023-02-09T05:55:44.680' AS DateTime), CAST(N'2023-02-09T05:55:44.680' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (9, N'Hello 5.0', 18, 1, 0, CAST(N'2023-02-09T05:57:53.340' AS DateTime), CAST(N'2023-02-09T05:57:53.340' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (10, N'Hello 6.0', 18, 6, 0, CAST(N'2023-02-09T05:58:58.373' AS DateTime), CAST(N'2023-02-09T05:58:58.373' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (11, N'Hello 7.0', 18, 7, 0, CAST(N'2023-02-09T06:00:10.080' AS DateTime), CAST(N'2023-02-09T06:00:10.080' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (12, N'Hello everyone', 12, 3, 0, CAST(N'2023-02-09T06:00:39.663' AS DateTime), CAST(N'2023-02-09T06:00:39.663' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (13, N'Hello 8.0', 18, 3, 0, CAST(N'2023-02-09T06:02:09.257' AS DateTime), CAST(N'2023-02-09T06:02:09.257' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (14, N'Yes , Rahul''s ''pappufication'' may be over', 12, 3, 0, CAST(N'2023-02-09T06:02:44.353' AS DateTime), CAST(N'2023-02-09T06:02:44.353' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (15, N'hello', 11, 3, 0, CAST(N'2023-02-09T06:07:43.443' AS DateTime), CAST(N'2023-02-09T06:07:43.443' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (16, N'Hello 9.0', 18, 1, 0, CAST(N'2023-02-09T06:35:14.907' AS DateTime), CAST(N'2023-02-09T06:35:14.907' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (17, N'Hello 10.0', 18, 6, 0, CAST(N'2023-02-09T06:37:08.243' AS DateTime), CAST(N'2023-02-09T06:37:08.243' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (18, N'Hello 11.0', 18, 7, 0, CAST(N'2023-02-09T06:37:23.997' AS DateTime), CAST(N'2023-02-09T06:37:23.997' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (19, N'Hello 12.0', 18, 3, 1, CAST(N'2023-02-09T06:37:43.620' AS DateTime), CAST(N'2023-02-09T06:37:43.620' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (20, N'Hello 13.0', 18, 1, 0, CAST(N'2023-02-09T06:46:09.163' AS DateTime), CAST(N'2023-02-09T06:46:09.163' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (21, N'Hello 14.0', 18, 6, 0, CAST(N'2023-02-09T06:49:24.130' AS DateTime), CAST(N'2023-02-09T06:49:24.130' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (22, N'Hello 15.0', 18, 7, 0, CAST(N'2023-02-09T06:52:16.727' AS DateTime), CAST(N'2023-02-09T06:52:16.727' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (23, N'Hello 16.0', 18, 3, 0, CAST(N'2023-02-09T06:54:10.050' AS DateTime), CAST(N'2023-02-09T06:54:10.050' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (24, N'Hello 17.0', 18, 1, 0, CAST(N'2023-02-09T06:54:33.870' AS DateTime), CAST(N'2023-02-09T06:54:33.870' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (25, N'Hello 18.0', 18, 6, 0, CAST(N'2023-02-09T06:55:49.580' AS DateTime), CAST(N'2023-02-09T06:55:49.580' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (26, N'Hello 19.0', 18, 7, 0, CAST(N'2023-02-09T06:56:04.593' AS DateTime), CAST(N'2023-02-09T06:56:04.593' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (27, N'Hello 20.0', 18, 3, 0, CAST(N'2023-02-09T06:56:22.593' AS DateTime), CAST(N'2023-02-09T06:56:22.593' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (28, N'Hello 21.0', 18, 1, 1, CAST(N'2023-02-09T06:56:40.187' AS DateTime), CAST(N'2023-02-09T06:56:40.187' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (29, N'Hello 22.0', 18, 6, 0, CAST(N'2023-02-09T06:57:04.467' AS DateTime), CAST(N'2023-02-09T06:57:04.467' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (30, N'Hello 1', 20, 3, 0, CAST(N'2023-02-09T10:08:44.620' AS DateTime), CAST(N'2023-02-09T10:08:44.620' AS DateTime))
INSERT [hybridcms].[tblPostComments] ([CommentId], [Comment], [PostId], [UserId], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (31, N'Hello 23.0', 18, 3, 0, CAST(N'2023-02-09T10:10:04.267' AS DateTime), CAST(N'2023-02-09T10:10:04.267' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblPostComments] OFF
GO
SET IDENTITY_INSERT [hybridcms].[tblPosts] ON 

INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (1, 3, N'Hello everyone', N'First Post', NULL, 0, CAST(N'2023-01-21T10:34:33.067' AS DateTime), CAST(N'2023-01-21T10:34:33.067' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (2, 3, N'Best Programming Jokes & Quotes', N'Best Quote', NULL, 0, CAST(N'2023-01-21T10:44:21.853' AS DateTime), CAST(N'2023-01-21T10:44:21.853' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (3, 3, N'Creating Text Editor Using ASP.Net and jQuery', N'This article explains how to create a Text Editor using ASP.NET and jQuery.', NULL, 0, CAST(N'2023-01-21T11:04:30.960' AS DateTime), CAST(N'2023-01-21T11:04:30.960' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (4, 3, N'TinyMCE and XML Encoding', N'ASP.Net 4.0 with TinyMCE and XML Encoding re-encodes Content on Postback', NULL, 0, CAST(N'2023-01-21T11:15:16.663' AS DateTime), CAST(N'2023-01-21T11:15:16.663' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (5, 3, N'This article explains how to create a Text Editor.', N'Now i have the problem, when a postback  e.g. the DropDown List occures, the re-encodes the content.', NULL, 0, CAST(N'2023-01-21T13:55:30.740' AS DateTime), CAST(N'2023-01-21T13:55:30.740' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (6, 3, N'This article explains how to create post', N'Now i have the problem, when a postback  e.g. the DropDown List occures, the re-encodes the content.', NULL, 0, CAST(N'2023-01-21T13:55:34.833' AS DateTime), CAST(N'2023-01-21T13:55:34.833' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (10, 5, N'Welcome post', N'Hi Members, Welcome to the page.', NULL, 1, CAST(N'2023-01-25T02:03:56.683' AS DateTime), CAST(N'2023-01-25T02:03:56.683' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (11, 7, N'This article explains how to create a Text Editor.', N'This article explains how to create a Text Editor.', NULL, 0, CAST(N'2023-01-31T10:33:52.140' AS DateTime), CAST(N'2023-01-31T10:33:52.140' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (12, 7, N'Rahul''s ''pappufication'' may be over', N'Srinagar, Jan 31 (PTI) He went from being the barely stubbled, dimpled politician with neat hair to the man with unkempt locks and an overgrown salt-pepper beard, the image makeover drawing comparisons with Saddam Hussein, Karl Marx and even Forrest Gump. And that one question - did Rahul Gandhi also outgrow his ‘Pappu’ image during the Bharat Jodo Yatra?', N'139b1e8e-53c7-4830-bb7f-d5075d9af992.jpg', 0, CAST(N'2023-01-31T12:15:30.170' AS DateTime), CAST(N'2023-01-31T12:15:30.170' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (18, 7, N'This article explains how to create a Text Editor.', N'This article explains how to create a Text Editor.', N'edd262df-638a-40ee-be1a-e735cbf76671.png', 1, CAST(N'2023-01-31T12:48:10.567' AS DateTime), CAST(N'2023-01-31T12:48:10.567' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (19, 7, N'This article explains how to create a Text Editor.', N'This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor.This article explains how to create a Text Editor', N'803f6682-64aa-4629-aeec-ca70dc190c21.jpg', 0, CAST(N'2023-02-01T07:06:22.630' AS DateTime), CAST(N'2023-02-01T07:06:22.630' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (20, 3, N'Best Programming Jokes & Quotes', NULL, N'517dd13b-af1c-4b3a-99b4-45e62ea53625.png', 1, CAST(N'2023-02-09T00:00:32.273' AS DateTime), CAST(N'2023-02-09T00:00:32.273' AS DateTime))
INSERT [hybridcms].[tblPosts] ([PostId], [AssetId], [PostHeading], [PostDescription], [ImageName], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (21, 15, N'My First Post', N'Nothing to write', N'', 0, CAST(N'2023-02-10T00:39:07.770' AS DateTime), CAST(N'2023-02-10T00:39:07.770' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblPosts] OFF
GO
SET IDENTITY_INSERT [hybridcms].[tblRoles] ON 

INSERT [hybridcms].[tblRoles] ([RoleId], [RoleName], [IsDeleted], [CreatedOn]) VALUES (1, N'Administration', 0, CAST(N'2023-01-10T11:24:47.480' AS DateTime))
INSERT [hybridcms].[tblRoles] ([RoleId], [RoleName], [IsDeleted], [CreatedOn]) VALUES (2, N'Admin', 0, CAST(N'2023-01-10T11:25:42.080' AS DateTime))
INSERT [hybridcms].[tblRoles] ([RoleId], [RoleName], [IsDeleted], [CreatedOn]) VALUES (3, N'User', 0, CAST(N'2023-01-10T11:26:03.057' AS DateTime))
SET IDENTITY_INSERT [hybridcms].[tblRoles] OFF
GO
SET IDENTITY_INSERT [hybridcms].[tblUsers] ON 

INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (1, 2, N'Sachin', N'sachin1', N'9g3WKu1C6NE=', N'sachin.c@antheminfotech.com', 0, CAST(N'2023-01-10T11:08:56.257' AS DateTime), NULL, N'7d507f1d-8515-470d-9919-60b58246b4c4', CAST(N'2023-02-08T11:17:39.037' AS DateTime))
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (2, 2, N'Vikrant', N'vik1', N'A4tktFlzqzE=', N'vikrant@antheminfotech.com', 0, CAST(N'2023-01-10T11:30:27.267' AS DateTime), NULL, N'b237007c-586e-4f0b-b42c-0bc0871a800b', CAST(N'2023-01-19T07:09:21.117' AS DateTime))
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (3, 3, N'Sandeep', N'san1', N'z/0RT5Ovc9E=', N'sandeep.b@antheminfotech.com', 0, CAST(N'2023-01-10T11:31:56.373' AS DateTime), NULL, NULL, NULL)
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (4, 1, N'Admin', N'admin', N'p8KyjCog0L8=', N'sachin.chahal48@gmail.com', 0, CAST(N'2023-01-11T22:36:38.303' AS DateTime), NULL, N'bb2ab11e-8a4f-4223-a97e-286d2a986e55', CAST(N'2023-01-15T22:33:10.100' AS DateTime))
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (6, 2, N'Diljeet', N'diljeet', N'p8KyjCog0L8=', N'diljeet@antheminfotech.com', 0, CAST(N'2023-01-24T23:36:37.853' AS DateTime), NULL, NULL, NULL)
INSERT [hybridcms].[tblUsers] ([UserId], [RoleId], [Name], [UserName], [Password], [EmailAddress], [IsDeleted], [CreatedOn], [ProfilePicture], [ForgetPasswordToken], [GeneratedTokenTime]) VALUES (7, 3, N'Mohit', N'mohit', N'lzqoGm/jalc=', N'mohitkumar342@gmail.com', 0, CAST(N'2023-02-07T01:47:14.973' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [hybridcms].[tblUsers] OFF
GO
ALTER TABLE [hybridcms].[tblAssets] ADD  CONSTRAINT [DF_tblAsset_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblAssets] ADD  CONSTRAINT [DF_tblAssets_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
ALTER TABLE [hybridcms].[tblAssets] ADD  CONSTRAINT [DF_tblAsset_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblAssets] ADD  CONSTRAINT [DF_tblAssets_PublishedOn]  DEFAULT (getdate()) FOR [PublishedOn]
GO
ALTER TABLE [hybridcms].[tblAssetTypes] ADD  CONSTRAINT [DF_tblAssetType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblAssetTypes] ADD  CONSTRAINT [DF_tblAssetType_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblPostBookmarks] ADD  CONSTRAINT [DF_tblPostBookmarks_IsDeleted]  DEFAULT ((1)) FOR [IsBookmarked]
GO
ALTER TABLE [hybridcms].[tblPostBookmarks] ADD  CONSTRAINT [DF_tblPostBookmarks_CreateOn]  DEFAULT (getdate()) FOR [CreateOn]
GO
ALTER TABLE [hybridcms].[tblPostComments] ADD  CONSTRAINT [DF_tblComment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [hybridcms].[tblPostComments] ADD  CONSTRAINT [DF_tblComment_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [hybridcms].[tblPostComments] ADD  CONSTRAINT [DF_tblComment_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
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
/****** Object:  StoredProcedure [hybridcms].[usp_AddAsset]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_AddAsset]
@Name NVARCHAR(50),
@UserId bigint,
@AssetTypeId int,
@URL NVARCHAR(50),
@Description NVARCHAR(MAX) = null,
@ProfilePicture NVARCHAR(500) = null
AS
BEGIN

DECLARE @ReplaceScript NVARCHAR(MAX);
SET @ReplaceScript = REPLACE(REPLACE(@Description, '<script>', '<b>'),'</script>','</b>');

  INSERT INTO [hybridcms].[tblAssets]
           ([Name],[UserId],[AssetTypeId],[URL],[Description],[ProfilePicture])
     VALUES(@Name,@UserId,@AssetTypeId,@URL,@ReplaceScript,@ProfilePicture)

END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_AddPost]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_AddPost]
@AssetId bigint,
@PostHeading nvarchar(50),
@PostDescription NVARCHAR(500) = null,
@ImageName NVARCHAR(500) = null
AS
BEGIN

  INSERT INTO [tblPosts]
           ([AssetId],[PostHeading],[PostDescription],[ImageName])
     VALUES(@AssetId,@PostHeading,@PostDescription,@ImageName)

END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_AddPostComment]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_AddPostComment]
@PostId bigint,
@UserId bigint,
@Comment nvarchar(200)
AS
BEGIN

	INSERT INTO [tblPostComments]
           ([UserId],[Comment],[PostId])
     VALUES(@UserId,@Comment,@PostId)

END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_AddUser]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================================
-- Author:		Sachin Chahal
-- Create date: 04 Jan 2023
-- Description:	Used to insert new user details
-- Default column and values [RoleId = 3, IsDeleted = 0, CreatedOn = getdate()]
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
/****** Object:  StoredProcedure [hybridcms].[usp_AllPostByAssetId_LazyLoad]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [hybridcms].[usp_AllPostByAssetId_LazyLoad]
@AssetId bigint,
@PageIndex int,
@PageSize int
as
begin
Select * from tblPosts
where [AssetId] = @AssetId
order by [CreatedOn] desc
offset @PageSize*(@PageSize-1) Rows fetch next @PageSize rows only
end
GO
/****** Object:  StoredProcedure [hybridcms].[usp_ChangeUserPassword]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_ChangeUserPasswordByToken]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_CheckEmailAlreadyExists]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_CheckEmailorUsernameExists]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_CheckUrlAlreadyExists]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Author:		Sachin Chahal
-- Create date: 17 Jan 2023
-- Description:	Used to maintain uniqueness of email
--				Order by Desc LastModified Date and desc ContactId
-- ==================================================================================
CREATE procedure [hybridcms].[usp_CheckUrlAlreadyExists]
@url nvarchar(50)
as
begin
SELECT count([AssetId]) 
  FROM [tblAssets]
	   where [URL] = @url
end
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckUserNameAlreadyExists]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_CheckValidToken]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_CheckValidURL]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_CheckValidURL]
@URL NVARCHAR(50)
AS
BEGIN
SELECT
	   [AssetId]
	  ,[tblAssets].[UserId] as UserId
      ,[AssetTypeId]
	  ,[tblAssets].[Name] as AssetName
	  ,tblUsers.Name as AuthorName
	  ,tblUsers.UserName as AuthorUserName
	  ,(select count([tblPosts].[PostId]) from tblPosts where AssetId = [tblAssets].AssetId and tblPosts.[IsDeleted] = 0) as PostCount
	  ,[URL]
	  ,[IsPublished]
	  ,[Description]
	  ,[tblAssets].ProfilePicture as AssetPhoto
	  ,[tblAssets].CreatedOn as CreatedOn
	  ,[PublishedOn]
FROM [tblAssets] 
join [tblUsers]
  on tblAssets.UserId = tblUsers.UserId
WHERE [URL] = @URL AND [tblAssets].IsDeleted=0 and [IsPublished] = 1
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckValidUserAndAsset]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Author:		Sachin Chahal
-- Create date: 20 Jan 2023
-- Description:	
-- ==================================================================================
CREATE procedure [hybridcms].[usp_CheckValidUserAndAsset]
@AssetId bigint,
@UserId bigint
as
begin
SELECT count([AssetId]) 
  FROM [tblAssets]
	   where [AssetId] = @AssetId and [UserId] = @UserId and [IsDeleted] = 0
end
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckValidUserAndPost]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Author:		Sachin Chahal
-- Create date: 20 Jan 2023
-- Description:	
-- ==================================================================================
CREATE procedure [hybridcms].[usp_CheckValidUserAndPost]
@PostId bigint,
@UserId bigint
as
begin
SELECT count([PostId]) 
  FROM [tblPosts]
  join [tblAssets]
  on [tblPosts].[AssetId] = [tblAssets].[AssetId]
	   where [PostId] = @PostId
	   and [tblAssets].[UserId] = @UserId 
	   and [tblPosts].[IsDeleted] = 0
	   and [tblAssets].[IsDeleted] = 0
end
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CheckValidUserIdAndCommentId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Author:		Sachin Chahal
-- Create date: 10 feb 2023
-- Description:	
-- ==================================================================================
Create procedure [hybridcms].[usp_CheckValidUserIdAndCommentId]
@CommentId bigint,
@UserId bigint
as
begin
SELECT count([CommentId])
  FROM [tblPostComments]
	   where [CommentId] = @CommentId
	   and [UserId] = @UserId
	   and [IsDeleted] = 0
end
GO
/****** Object:  StoredProcedure [hybridcms].[usp_CMSLogin]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_CMSLogin]  --'sachin','1iS1mVHShSPPuJqtTZxL7Q='
(
@EmailorUsername nvarchar(100),
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
FROM [tblUsers] WHERE ([UserName] = trim(@EmailorUsername) or [EmailAddress] = trim(@EmailorUsername))
AND Password = @Password AND isDeleted=0
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_DeleteAsset]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_DeletePost]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_DeletePost]
@PostId bigint
AS
BEGIN
	UPDATE [tblPosts] SET [IsDeleted] = 1 WHERE [PostId] = @PostId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_DeletePostComment]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_DeletePostComment]
@CommentId bigint
AS
BEGIN
	UPDATE [tblPostComments] SET [IsDeleted] = 1 
		WHERE [CommentId] = @CommentId 
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_DeleteUser]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_GenerateTokenForResetPassword]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllAsset]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllAsset]
AS
BEGIN
SELECT [AssetId]
      ,[AssetTypeId]
	  ,[tblAssets].[Name] as AssetName
	  ,[URL] as AssetUrl
	  ,(select count([tblPosts].[PostId]) from tblPosts where AssetId = [tblAssets].AssetId and tblPosts.[IsDeleted] = 0) as PostCount
	  ,tblUsers.Name as AuthorName
	  ,tblUsers.UserName as AuthorUserName
	  ,[tblAssets].ProfilePicture as AssetPhoto
	  ,[tblAssets].Description as AssetDescription
	  ,[tblAssets].CreatedOn as CreatedOn
  FROM [tblAssets]
  join [tblUsers]
  on tblAssets.UserId = tblUsers.UserId
  WHERE [tblAssets].[IsDeleted] = 0 and IsPublished = 1
  ORDER BY [tblAssets].[CreatedOn] DESC
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllAssetBySearch]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllAssetBySearch]
@Search nvarchar(100)
AS
BEGIN

DECLARE @TrimSearch AS VARCHAR(100);
SET @TrimSearch = '%' +  TRIM(@Search) + '%';

SELECT [AssetId]
      ,[AssetTypeId]
	  ,[tblAssets].[Name] as AssetName
	  ,[URL] as AssetUrl
	  ,(select count([tblPosts].[PostId]) from tblPosts where AssetId = [tblAssets].AssetId and tblPosts.[IsDeleted] = 0) as PostCount
	  ,tblUsers.Name as AuthorName
	  ,tblUsers.UserName as AuthorUserName
	  ,[tblAssets].ProfilePicture as AssetPhoto
	  ,[tblAssets].Description as AssetDescription
	  ,[tblAssets].CreatedOn as CreatedOn
  FROM [tblAssets]
  join [tblUsers]
  on tblAssets.UserId = tblUsers.UserId
  WHERE [tblAssets].[IsDeleted] = 0 and IsPublished = 1
  -- For Search with wildcard
  and 
  (
	[tblAssets].[Name] like @TrimSearch or
	[tblAssets].Description like @TrimSearch or
	tblUsers.Name like @TrimSearch
  )
  ORDER BY [tblAssets].[CreatedOn] DESC
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllAssetByUserId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllAssetByUserId]  
@UserId bigint  
AS  
BEGIN  
SELECT [AssetId]  
   ,[UserId]  
   ,[AssetTypeId]  
   ,[Name]  
   ,[URL]  
   ,[IsPublished] 
   ,[CreatedOn]
   ,[PublishedOn]
   ,(select count([PostId]) from tblPosts where AssetId = [tblAssets].AssetId and tblPosts.[IsDeleted] = 0) as PostCount  
  FROM [tblAssets]  
  WHERE [UserId] = @UserId and [IsDeleted] = 0  
  ORDER BY [CreatedOn] DESC  
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllAssetForMaster]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllAssetForMaster]     
AS    
BEGIN    
SELECT [AssetId]
      ,[AssetTypeId]
	  ,[tblAssets].[Name] as AssetName
	  ,[URL] as AssetUrl
	  ,(select count([tblPosts].[PostId]) from tblPosts where AssetId = [tblAssets].AssetId) as PostCount
	  ,tblAssets.IsPublished as IsPublished
	  ,tblAssets.PublishedOn as PublishedOn
	  ,tblUsers.Name as AuthorName
	  ,tblUsers.UserName as AuthorUserName
	  ,[tblAssets].Description as AssetDescription
	  ,[tblAssets].CreatedOn as CreatedOn
	  ,[tblAssets].IsDeleted as IsDeleted
  FROM [tblAssets]
  join [tblUsers]
  on tblAssets.UserId = tblUsers.UserId
  ORDER BY [tblAssets].[CreatedOn] DESC   
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllBookmarkedPostByUserId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllBookmarkedPostByUserId]
@UserId bigint
AS
BEGIN
SELECT 
	   [tblPosts].[PostId] as PostId
      ,[tblPosts].[AssetId] as AssetId
      ,[URL]
	  ,[PostHeading]
      ,[PostDescription]
      ,[ImageName] as [PostPhoto]
	  ,[tblUsers].[Name] as [AuthorName]
	  ,[tblAssets].[Name] as [AssetName]
	  ,[tblUsers].[ProfilePicture] as [AuthorPhoto]
	  ,[tblPosts].[CreatedOn] as [PostedDate]
  FROM [tblPostBookmarks] 
  join tblPosts
  on tblPosts.PostId = tblPostBookmarks.PostId
  join tblAssets
  on tblAssets.AssetId = tblPosts.AssetId
  join tblUsers
  on tblUsers.UserId = tblAssets.UserId
  WHERE [tblPostBookmarks].[UserId] = @UserId 
  and [tblAssets].[IsDeleted] = 0
  and [tblPosts].[IsDeleted] = 0
  and [tblPostBookmarks].IsBookmarked = 1
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllCommentForMaster]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllCommentForMaster]
AS
BEGIN

	SELECT [CommentId]
		,[Comment]
		,[tblUsers].[UserId] as UserId
		,[tblUsers].[Name] as [Name]
		,[tblPostComments].[CreatedOn] as CreatedOn
		,[ModifiedOn]
		,[tblPostComments].IsDeleted as IsDeleted
		FROM [hybridcms].[tblPostComments]
		join [tblUsers]
		on [tblUsers].UserId = [tblPostComments].[UserId]
		order by [tblPostComments].[CreatedOn] desc
END

GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllPostByAssetId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllPostByAssetId]
@AssetId bigint
AS
BEGIN
SELECT [PostId]
      ,[tblPosts].[AssetId] as AssetId
      ,[tblAssets].[URL] as AssetUrl
	  ,[tblUsers].[Name] as AuthorName
	  ,[tblUsers].[UserName] as AuthorUserName
	  ,[tblUsers].[ProfilePicture] as AuthorPicture
	  ,[tblAssets].[Name] as AssetName
	  ,[PostHeading]
      ,[PostDescription]
      ,[ImageName]
      ,[tblPosts].[CreatedOn]
  FROM [tblPosts] 
  join [tblAssets]
  on [tblAssets].[AssetId] = [tblPosts].[AssetId]
  join [tblUsers]
  on [tblUsers].[UserId] = [tblAssets].[UserId]
  WHERE [tblPosts].[AssetId] = @AssetId and [tblPosts].[IsDeleted] = 0
  ORDER BY [tblPosts].[CreatedOn] DESC
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllPostForMaster]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [hybridcms].[usp_GetAllPostForMaster]     
AS    
BEGIN
  SELECT [PostId]
	  ,[tblUsers].[Name] as AuthorName
	  ,[tblUsers].[UserName] as AuthorUserName
	  ,[tblUsers].[ProfilePicture] as AuthorPicture
	  ,[tblAssets].[Name] as AssetName
	  ,[PostHeading]
      ,[tblPosts].[CreatedOn] as CreatedOn
	  ,[tblPosts].[IsDeleted] as IsDeleted
  FROM [tblPosts] 
  join [tblAssets]
  on [tblAssets].[AssetId] = [tblPosts].[AssetId]
  join [tblUsers]
  on [tblUsers].[UserId] = [tblAssets].[UserId]
  ORDER BY [tblPosts].[CreatedOn] DESC
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllPostWithLazyLoading]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAllPostWithLazyLoading]
@PageNumber int,
@PageSize int
AS
BEGIN
	Declare @StartRow bigint
	Declare @EndRow bigint

	Set @StartRow = ((@PageNumber - 1) * @PageSize) + 1;
	Set @EndRow = @PageNumber * @PageSize;

	With Result as
	(
		SELECT [PostId]
			  ,[tblPosts].[AssetId] as AssetId
			  ,[URL]
			  ,[PostHeading]
			  ,[PostDescription]
			  ,[ImageName] as [PostPhoto]
			  ,[tblUsers].[Name] as [AuthorName]
			  ,[tblAssets].[Name] as [AssetName]
			  ,[tblUsers].[ProfilePicture] as [AuthorPhoto]
			  ,[tblPosts].[CreatedOn] as [PostedDate]
			  ,ROW_NUMBER() OVER (Order By tblPosts.CreatedOn DESC) RowNumber
		  FROM [tblPosts]
		  Join [tblAssets]
		  on [tblPosts].AssetId = [tblAssets].AssetId
		  Join [tblUsers]
		  on [tblAssets].UserId = [tblUsers].UserId
		  WHERE  [tblAssets].[IsDeleted] = 0
		  and [tblPosts].[IsDeleted] = 0
	)
	Select * from Result Where RowNumber Between @StartRow and @EndRow
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAllUsers]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [hybridcms].[usp_GetAllUsers]  
AS  
BEGIN  
SELECT [UserId],[RoleId],[Name],[UserName],[EmailAddress],[IsDeleted],[CreatedOn]
	  ,CASE Users.[RoleId] -- (Only admin able to add assets, admin RoleId = 2)
           WHEN 2 
           THEN (Select Count(*) from tblAssets where tblAssets.UserId = Users.UserId)
           ELSE 0 -- No reason to run for Guest User
       END AS TotalAsset
	  ,CASE Users.[RoleId] -- (Only admin able to add/update/Publish/Archive assets, admin RoleId = 2)
           WHEN 2
           THEN (Select Count(*) from tblAssets where tblAssets.UserId = Users.UserId and tblAssets.IsPublished = 1)
           ELSE 0 -- No reason to run for Guest User
       END AS PublishedAsset
	  ,CASE Users.[RoleId] -- (Only admin able to add Posts, admin RoleId = 2)
           WHEN 2
           THEN (Select Count(*) from tblPosts join tblAssets on tblPosts.AssetId = tblAssets.AssetId where tblAssets.UserId = Users.UserId)
           ELSE 0 -- No reason to run for Guest User
       END AS TotalPost
	  -- TotalComment (Admin as well as User can add comments)
	  ,(Select Count(*) from tblPostComments where tblPostComments.UserId = Users.UserId) AS TotalComment
  FROM [tblUsers] as Users
  where RoleId != 1
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetAssetByAssetId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetAssetByAssetId]
@AssetId bigint
AS
BEGIN
SELECT [AssetId]
	  ,[tblAssets].[UserId] as UserId
      ,[AssetTypeId]
	  ,[tblAssets].[Name] as AssetName
	  ,tblUsers.Name as AuthorName
	  ,tblUsers.UserName as AuthorUserName
	  ,(select count([tblPosts].[PostId]) from tblPosts where AssetId = [tblAssets].AssetId and tblPosts.[IsDeleted] = 0) as PostCount
	  ,[URL]
	  ,[IsPublished]
	  ,[Description]
	  ,[tblAssets].ProfilePicture as AssetPhoto
	  ,[tblAssets].CreatedOn as CreatedOn
	  ,[PublishedOn]
  FROM [tblAssets]
  join [tblUsers]
  on tblAssets.UserId = tblUsers.UserId
  WHERE [AssetId] = @AssetId and [tblAssets].[IsDeleted] = 0
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetDataForMasterDashboard]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetDataForMasterDashboard]
AS
BEGIN

	-- delcare varaibles
	DECLARE @TotalUser AS bigint
	DECLARE @TotalAsset AS bigint
	DECLARE @TotalPost AS bigint
	DECLARE @TotalComment AS bigint
	-- DECLARE @TotalMail AS bigint

	-- get data

	SELECT @TotalUser = Count(UserId) from tblUsers where RoleId != 1   -- Not Counting Super Admin

	SELECT @TotalAsset = Count(AssetId) from tblAssets

	SELECT @TotalPost = Count(PostId) from tblPosts

	SELECT @TotalComment = Count(CommentId) from tblPostComments

	-- now just select the variable values you populated above for your results
	SELECT	@TotalUser		AS Users,
			@TotalAsset		AS Assets, 
			@TotalPost		AS Posts,
			@TotalComment	AS Comments
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetLatestPost]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetLatestPost]
AS
BEGIN
SELECT Top(5) [PostId]
      ,[tblPosts].[AssetId] as AssetId
      ,[URL]
	  ,[PostHeading]
      ,[PostDescription]
      ,[ImageName] as [PostPhoto]
	  ,[tblUsers].[Name] as [AuthorName]
	  ,[tblAssets].[Name] as [AssetName]
	  ,[tblUsers].[ProfilePicture] as [AuthorPhoto]
	  ,[tblPosts].[CreatedOn] as [PostedDate]
  FROM [tblPosts]
  Join [tblAssets]
  on [tblPosts].AssetId = [tblAssets].AssetId
  Join [tblUsers]
  on [tblAssets].UserId = [tblUsers].UserId
  WHERE  [tblAssets].[IsDeleted] = 0
  and [tblPosts].[IsDeleted] = 0
  and [tblUsers].[IsDeleted] = 0
  ORDER BY [tblPosts].[CreatedOn] DESC
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetPostBookmarkByUserIdandPostId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [hybridcms].[usp_setPostBookmark]    Script Date: 2/2/2023 3:22:26 PM ******/
CREATE PROCEDURE [hybridcms].[usp_GetPostBookmarkByUserIdandPostId]
@UserId bigint,
@PostId bigint
AS
BEGIN
	select [UserId],[PostId],[IsBookmarked],[CreateOn] FROM [tblPostBookmarks]
	where [UserId] = @UserId and [PostId] = @PostId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetPostByPostId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetPostByPostId]
@PostId bigint
AS
BEGIN
SELECT [PostId]
      ,[tblPosts].[AssetId] as AssetId
      ,[URL]
	  ,[PostHeading]
      ,[PostDescription]
      ,[ImageName] as [PostPhoto]
	  ,[tblUsers].[Name] as [AuthorName]
	  ,[tblAssets].[Name] as [AssetName]
	  ,[tblUsers].[ProfilePicture] as [AuthorPhoto]
	  ,[tblPosts].[CreatedOn] as [PostedDate]
  FROM [tblPosts]
  Join [tblAssets]
  on [tblPosts].AssetId = [tblAssets].AssetId
  Join [tblUsers]
  on [tblAssets].UserId = [tblUsers].UserId
  WHERE [PostId] = @PostId 
  and [tblAssets].[IsDeleted] = 0
  and [tblPosts].[IsDeleted] = 0
  and [tblUsers].[IsDeleted] = 0
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetPostCommentByPostId]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_GetPostCommentByPostId]
@PostId bigint,
@PageNumber int
AS
BEGIN
	Declare @PageSize int
	set @PageSize = 10;
	Declare @StartRow bigint
	Declare @EndRow bigint

	Set @StartRow = ((@PageNumber - 1) * @PageSize) + 1;
	Set @EndRow = @PageNumber * @PageSize;

	With Result as
	(
		SELECT [CommentId]
		  ,[Comment]
		  ,[PostId]
		  ,[tblUsers].[UserId] as UserId
		  ,[tblUsers].[Name] as [Name]
		  ,[tblPostComments].[CreatedOn] as CreatedOn
		  ,[ModifiedOn]
		  ,ROW_NUMBER() OVER (Order By [tblPostComments].CreatedOn DESC) RowNumber
		  FROM [hybridcms].[tblPostComments]
		  join [tblUsers]
		  on [tblUsers].UserId = [tblPostComments].[UserId]
		  where [tblPostComments].IsDeleted = 0 and [tblPostComments].PostId = @PostId
	)
	Select * ,@PageNumber as PageNumber from Result Where RowNumber Between @StartRow and @EndRow
END

GO
/****** Object:  StoredProcedure [hybridcms].[usp_GetUserDataById]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_MasterDisableAsset]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterDisableAsset]
@AssetId bigint
AS
BEGIN
	Update [tblAssets] SET [IsDeleted] = 1 where [AssetId] = @AssetId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_MasterDisableComment]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterDisableComment]
@CommentId bigint
AS
BEGIN
	Update [tblPostComments] SET [IsDeleted] = 1 where [CommentId] = @CommentId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_MasterDisablePost]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterDisablePost]
@PostId bigint
AS
BEGIN
	Update [tblPosts] SET [IsDeleted] = 1 where [PostId] = @PostId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_MasterDisableUser]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterDisableUser]
@UserId bigint
AS
BEGIN
	Update [tblUsers] SET [IsDeleted] = 1 where [UserId] = @UserId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_MasterEnableAsset]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterEnableAsset]
@AssetId bigint
AS
BEGIN
	Update [tblAssets] SET [IsDeleted] = 0 where [AssetId] = @AssetId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_MasterEnableComment]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterEnableComment]
@CommentId bigint
AS
BEGIN
	Update [tblPostComments] SET [IsDeleted] = 0 where [CommentId] = @CommentId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_MasterEnablePost]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterEnablePost]
@PostId bigint
AS
BEGIN
	Update [tblPosts] SET [IsDeleted] = 0 where [PostId] = @PostId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_MasterEnableUser]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_MasterEnableUser]
@UserId bigint
AS
BEGIN
	Update [tblUsers] SET [IsDeleted] = 0 where [UserId] = @UserId
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_publishAsset]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_publishAsset]
@UserId bigint,
@AssetId bigint
AS
BEGIN
	Begin Try
		Begin Tran
			DECLARE @IsPublished nvarchar(5);
			Select @IsPublished =  [IsPublished] from [tblAssets] where [UserId] = @UserId and [AssetId] = @AssetId;

			if(@IsPublished = '0')
			Begin
				UPDATE [tblAssets] SET [IsPublished] = 1 ,
				[PublishedOn] = default
				where [UserId] = @UserId and [AssetId] = @AssetId;
			End
			else if(@IsPublished = '1')
			Begin
				UPDATE [tblAssets] SET [IsPublished] = 0,
				[PublishedOn] = default
				where [UserId] = @UserId and [AssetId] = @AssetId;
			END
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_setPostBookmark]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_setPostBookmark]
@UserId bigint,
@PostId bigint
AS
BEGIN
	DECLARE @RecordCount int = 0;
	Select @RecordCount =  count([BookmarkId]) from [tblPostBookmarks] where [UserId] = @UserId and [PostId] = @PostId;

	if(@RecordCount<=1)
	Begin
		Begin Try
			Begin Tran
				DECLARE @IsBookmarked nvarchar(5);
				Select @IsBookmarked =  [IsBookmarked] from [tblPostBookmarks] where [UserId] = @UserId and [PostId] = @PostId;

				if(@IsBookmarked = '0')
				Begin
					UPDATE [tblPostBookmarks] SET [IsBookmarked] = 1 where [UserId] = @UserId and [PostId] = @PostId;
				End
				else if(@IsBookmarked = '1')
				Begin
					UPDATE [tblPostBookmarks] SET [IsBookmarked] = 0 where [UserId] = @UserId and [PostId] = @PostId;
				END
				else
				begin
					INSERT INTO [tblPostBookmarks] ([UserId],[PostId]) VALUES(@UserId,@PostId);
				END
			Commit Tran
		End Try
		Begin Catch
			Rollback Tran
		End Catch
	End
	ELSE
	BEGIN
		Begin Try
			Begin Tran
				DELETE FROM [tblPostBookmarks] where [UserId] = @UserId and [PostId] = @PostId;
				
				INSERT INTO [tblPostBookmarks] ([UserId],[PostId]) VALUES(@UserId,@PostId);
			Commit Tran
		End Try
		Begin Catch
			Rollback Tran
		End Catch
	END
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_UpdateAsset]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_UpdateAsset]
@AssetId bigint,
@Name NVARCHAR(50),
@UserId bigint,
@URL NVARCHAR(50),
@Description NVARCHAR(MAX) = null,
@ProfilePicture NVARCHAR(500) = null
AS
BEGIN
	Begin Try
		Begin Tran

			DECLARE @ReplaceScript NVARCHAR(MAX);
			SET @ReplaceScript = REPLACE(REPLACE(@Description, '<script>', '<b>'),'</script>','</b>');

			IF(@ProfilePicture IS NOT NULL and trim(@ProfilePicture) != '')
			BEGIN
				UPDATE [hybridcms].[tblAssets]
				SET [ProfilePicture] = @ProfilePicture
				WHERE [AssetId] = @AssetId and [UserId] = @UserId and [IsDeleted] =0
			END

				UPDATE [hybridcms].[tblAssets]
				SET [Name] = @Name
					,[URL] = @URL
					,[Description] = @ReplaceScript
				Where [AssetId] = @AssetId and [UserId] = @UserId and [IsDeleted] =0
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_UpdatePost]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [hybridcms].[usp_UpdatePost]
@PostId bigint,
@PostHeading nvarchar(50),
@PostDescription NVARCHAR(500) = null,
@ImageName NVARCHAR(500) = null
AS
BEGIN
	Begin Try
		Begin Tran
			IF(@ImageName IS NOT NULL and trim(@ImageName) != '')
			BEGIN
				UPDATE [tblPosts]
				SET [ImageName] = @ImageName
				WHERE [PostId] = @PostId and [IsDeleted] =0
			END

				UPDATE [tblPosts]
				SET [PostHeading] = @PostHeading
					,[PostDescription] = @PostDescription
				WHERE [PostId] = @PostId and [IsDeleted] =0
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_UpdatePostComment]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [hybridcms].[usp_UpdatePostComment]
@PostId bigint,
@UserId bigint,
@CommentId bigint,
@Comment nvarchar(200)
AS
BEGIN

	UPDATE [tblPostComments] SET [Comment] = @Comment
		WHERE [CommentId] = @CommentId 
		and [UserId] = @UserId 
		and [PostId] = @PostId 
		and [IsDeleted] = 0
END
GO
/****** Object:  StoredProcedure [hybridcms].[usp_UpdateUser]    Script Date: 23-03-2023 15:18:14 ******/
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
/****** Object:  StoredProcedure [hybridcms].[usp_UserDetail]    Script Date: 23-03-2023 15:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [hybridcms].[usp_UserDetail]  --'sachin'
(
@Username nvarchar(100)
)
AS
Begin
SELECT    
	UserId as Id,
	Name,
	UserName,
	EmailAddress as EmailId,
	ProfilePicture as Photo,
	IsDeleted
FROM [tblUsers] WHERE [UserName] = trim(@Username) AND isDeleted=0
END
GO
USE [master]
GO
ALTER DATABASE [hybridcms] SET  READ_WRITE 
GO
