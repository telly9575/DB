USE [master]
GO
/****** Object:  Database [dbShoppingForum]    Script Date: 2020/2/4 下午 11:21:47 ******/
CREATE DATABASE [dbShoppingForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbShoppingForum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbShoppingForum.mdf' , SIZE = 512000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbShoppingForum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbShoppingForum_log.ldf' , SIZE = 65536KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbShoppingForum] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbShoppingForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbShoppingForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbShoppingForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbShoppingForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbShoppingForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbShoppingForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbShoppingForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbShoppingForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbShoppingForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbShoppingForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbShoppingForum] SET RECOVERY FULL 
GO
ALTER DATABASE [dbShoppingForum] SET  MULTI_USER 
GO
ALTER DATABASE [dbShoppingForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbShoppingForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbShoppingForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbShoppingForum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbShoppingForum] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbShoppingForum', N'ON'
GO
ALTER DATABASE [dbShoppingForum] SET QUERY_STORE = OFF
GO
USE [dbShoppingForum]
GO

/****** Object:  商品分類表 (供商品檢索&分類用) ******/
/****** Object:  Table [dbo].[tCategory]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCategory](
	[fCategoryID] [int] NOT NULL,
	[fCategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tCategory] PRIMARY KEY CLUSTERED 
(
	[fCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  優惠代碼主表 ******/
/****** Object:  Table [dbo].[tDiscount]    Script Date: 2020/2/4 上午 08:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDiscount](
	[fDiscountCode] [nvarchar](50) NOT NULL,
	[fDiscountName] [nvarchar](50) NOT NULL,
	[fDiscountCategory] [varchar](5) NOT NULL,
	[fDiscountMoneyRule] [bit] NOT NULL,
	[fMoneyLimit] [int] NOT NULL,
	[fDiscountContent] [decimal](10, 2) NOT NULL,
	[fStartdate] [datetime] NOT NULL,
	[fEndDate] [datetime] NOT NULL,
	[fEnable] [bit] NOT NULL,
	[fCount] [int] NOT NULL,
 CONSTRAINT [PK_tDiscount] PRIMARY KEY CLUSTERED 
(
	[fDiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  商品精油功效表 (供商品檢索&分類用) ******/
/****** Object:  Table [dbo].[tEfficacy]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEfficacy](
	[fEfficacyID] [int] NOT NULL,
	[fEfficacyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tEffcacy] PRIMARY KEY CLUSTERED 
(
	[fEfficacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  商品純露特性表 2020/2/4新增 ******/
/****** Object:  Table [dbo].[tfeature]    Script Date: 2020/2/4 上午 12:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tfeature](
	[ffeatureID] [int] NOT NULL,
	[ffeatureName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tfeature] PRIMARY KEY CLUSTERED 
(
	[ffeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  討論區主表 ******/
/****** Object:  Table [dbo].[tForum]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForum](
	[fPostId] [int] IDENTITY(1,1) NOT NULL,
	[fId] [int] NOT NULL,
	[fPostTitle] [nvarchar](50) NOT NULL,
	[fPostContent] [nvarchar](max) NOT NULL,
	[fIsPost] [bit] NOT NULL,
	[fCreateTime] [datetime] NOT NULL,
	[fUpdateTime] [datetime] NOT NULL,
	[fEnableFlag] [bit] NOT NULL,
	[fEnableUserId] [int] NULL,
	[fDisableTime] [datetime] NULL,
	[fTopSeq] [int] NOT NULL,
	[fTotalViewCount] [int] NOT NULL,
	[fTotalReplyCount] [int] NOT NULL,
 CONSTRAINT [PK_tForum] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  討論區數據表 ******/
/****** Object:  Table [dbo].[tForumAnalysis]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumAnalysis](
	[fPostId] [int] NOT NULL,
	[fId] [int] NOT NULL,
	[fLikeHate] [bit] NULL,
	[fShareCount] [int] NOT NULL,
 CONSTRAINT [PK_tForumAnalysis] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  討論區權限表 ******/
/****** Object:  Table [dbo].[tForumAuth]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumAuth](
	[fId] [int] NOT NULL,
	[fAuthBlackList] [nvarchar](50) NULL,
	[fAuthPostFlag] [nvarchar](50) NULL,
	[fAuthReplyFlag] [nvarchar](50) NULL,
	[fAuthUpdatePostFlag] [nvarchar](50) NULL,
	[fAuthUpdateReplyFlag] [nvarchar](50) NULL,
	[fAuthDeletePostFlag] [nvarchar](50) NULL,
	[fAuthDeleteReplyFlag] [nvarchar](50) NULL,
 CONSTRAINT [PK_tForumAuth] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  討論區回覆表 ******/
/****** Object:  Table [dbo].[tForumReply]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumReply](
	[fPostId] [int] NOT NULL,
	[fReplyId] [nvarchar](50) NOT NULL,
	[fReplyTargetId] [nvarchar](50) NOT NULL,
	[fReplySeqNo] [int] NOT NULL,
	[fId] [int] NOT NULL,
	[fReplyTime] [datetime] NOT NULL,
	[fEnableFlag] [bit] NOT NULL,
	[fDeleteUserId] [int] NULL,
	[fContent] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tForumReply] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  討論區回覆分析表 ******/
/****** Object:  Table [dbo].[tForumReplyAnalysis]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumReplyAnalysis](
	[fPostId] [int] NOT NULL,
	[fReplyId] [nvarchar](50) NOT NULL,
	[fId] [int] NOT NULL,
	[fLikeHate] [bit] NULL,
 CONSTRAINT [PK_tForumReplyAnalysis] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fReplyId] ASC,
        [fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  最新消息文章  ******/
/****** Object:  0227增加fNewsDiscontinue欄位  ******/
/****** Object:  Table [dbo].[tNews]    Script Date: 2020/2/14 下午 03:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNews](
	[fNewsId] [int] NOT NULL,
	[fNewsStart] [datetime] NOT NULL,
	[fNewsEnd] [datetime] NOT NULL,
	[fClass] [nvarchar](50) NULL,
	[fNewsTitle] [nvarchar](50) NOT NULL,
	[fNewsDesc] [nvarchar](100) NOT NULL,
	[fNewsArticle] [nvarchar](max) NOT NULL,
	[fNewsTag] [int] NOT NULL,
	[fGet_No] [int] NOT NULL,
	[fAddUser] [nvarchar](50) NOT NULL,
	[fChangUser] [nvarchar](50) NULL,
	[fDeleteUser] [nvarchar](50) NULL,
	[fApproved] [char](1) NULL,
	[fNewsDiscontinue][bit] NULL,
 CONSTRAINT [PK_tNews] PRIMARY KEY CLUSTERED 
(
	[fNewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  LineBot帳號連結主表  ******/
/****** Object:  Table [dbo].[tLineBotAccountLink]    Script Date: 2020/2/27 上午 12:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLineBotAccountLink](
	[fId] [int] NOT NULL,
	[fLineNonce] [nvarchar](50) NULL,
	[fLineUserId] [nvarchar](50) NULL,
	[fAccountLinkDatetime] [datetime] NULL,
 CONSTRAINT [PK_tLineBotAccountLink] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  最新消息留言區  ******/
/****** Object:  Table [dbo].[tNewsMessage]    Script Date: 2020/2/14 下午 03:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNewsMessage](
	[fMessageId] [int] NOT NULL,
	[fNewsId] [int] NOT NULL,
	[fMessageTime] [datetime] NOT NULL,
	[fMessageArticle] [varchar](max) NULL,
	[fM_AddUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tMessage] PRIMARY KEY CLUSTERED 
(
	[fMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  商品精油香調表 (供單方精油檢索&分類用) ******/
/****** Object:  Table [dbo].[tNote]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNote](
	[fNoteID] [int] NOT NULL,
	[fNoteName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tNote] PRIMARY KEY CLUSTERED 
(
	[fNoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  訂單主表 ******/
/****** Object:  Table [dbo].[tOrder]    Script Date: 2020/2/10 上午 06:53:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrder](
	[fOrderId] [int] IDENTITY(1000,1) NOT NULL,
	[fId] [int] NOT NULL,
	[fOrderDate] [datetime] NOT NULL,
	[fShippedDate] [datetime] NULL,
	[fRequiredDate] [datetime] NULL,
	[fScore] [int] NULL,
	[fConsigneeName] [nvarchar](20) NULL,
	[fConsigneeTelephone] [nvarchar](50) NULL,
	[fConsigneeCellPhone] [nvarchar](50) NULL,
	[fConsigneeAddress] [nvarchar](50) NULL,
	[fOrderCompanyTitle] [nvarchar](50) NULL,
	[fOrderTaxIdDNumber] [int] NULL,
	[fOrderPostScript] [nvarchar](max) NULL,
	[fDiscountCode] [nvarchar](50) NULL,
	[fPayment] [nvarchar](50) NULL,
 CONSTRAINT [PK_tOrder] PRIMARY KEY CLUSTERED 
(
	[fOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  訂單明細表 ******/
/****** 刪除[fOrderDetailCheck]欄位   Edit Date: 2020/2/03 下午 02:15:43******/
/****** Object:  Table [dbo].[tOrderDetail]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderDetail](
	[fOrderId] [int] NOT NULL,
	[fProductId] [int] NOT NULL,
	[fUnitPrice] [int] NULL,
	[fOrderQuantity] [int] NULL,
 CONSTRAINT [PK_tOrderDetail] PRIMARY KEY CLUSTERED 
(
	[fOrderId] ASC,
	[fProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  商品精油萃取部位表 (供商品檢索&分類用) ******/
/****** Object:  Table [dbo].[tPart]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPart](
	[fPartID] [int] NOT NULL,
	[fPartName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tPart] PRIMARY KEY CLUSTERED 
(
	[fPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  商品功效關聯表(一對多) ******/
/****** Object:  Table [dbo].[tProdEfficacyRelation]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProdEfficacyRelation](
	[fProductID] [int] NOT NULL,
	[fEfficacyID] [int] NOT NULL,
 CONSTRAINT [PK_tEfficacy] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC,
	[fEfficacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  商品圖片表(尚未新增資料) ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductImage](
	[fProductID] [int] NOT NULL,
	[fProductImageId] [int] NOT NULL,
	[fProductImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_tProductImage] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC,
	[fProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  商品主表 ******/
/****** Object:  Table [dbo].[tProduct]    Script Date: 2020/2/4 上午 12:13:17 ******/
/****** Object:  刪除[fUnitsOnOrder][fReorderLevel][fPart][fNote] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[fProductID] [int] NOT NULL,
	[fProductChName] [nvarchar](50) NOT NULL,
	[fProductDesc] [nvarchar](max) NULL,
	[fUnitPrice] [int] NULL,
	[fQuantityPerUnit] [nvarchar](50) NULL,
	[fUnitsInStock] [int] NULL,
	[fDiscontinued] [bit] NULL,
	[fCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  商品副表_單方精油 2020/2/4新增 ******/
/****** Object:  Table [dbo].[tProductUnilateral]    Script Date: 2020/2/4 上午 12:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductUnilateral](
	[fProductID] [int] NOT NULL,
	[fPartID] [int] NULL,
	[fNoteID] [int] NULL,
	[fOrigin] [nvarchar](20) NULL,
	[fextraction] [nvarchar](20) NULL,
 CONSTRAINT [PK_tProduct_Unilateral] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  商品副表_植物油&純露 2020/2/4新增 ******/
/****** Object:  Table [dbo].[tProductVegetableoil]    Script Date: 2020/2/4 上午 12:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductVegetableoil](
	[fProductID] [int] NOT NULL,
	[ffeatureID] [int] NULL,
 CONSTRAINT [PK_tProductVegetableoil] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  每日題目區  ******/
/****** Object:  Table [dbo].[tQuestion]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tQuestion](
	[fQuestionId] [int] IDENTITY(1,1) NOT NULL,
	[fQuestionName] [nvarchar](50) NULL,
	[fQuestion] [nvarchar](max) NULL,
	[fAnswer] [nvarchar](50) NOT NULL,
	[fItemA] [nvarchar](50) NULL,
	[fItemB] [nvarchar](50) NULL,
	[fItemC] [nvarchar](50) NULL,
	[fItemD] [nvarchar](50) NULL,
	[fItemE] [nvarchar](50) NULL,
 CONSTRAINT [PK_tQuestion] PRIMARY KEY CLUSTERED 
(
	[fQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  積分異動表  ******/
/****** Object:  Table [dbo].[tScore]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tScore](
	[fId] [int] NOT NULL,
	[fScore] [int] NULL,
	[fActiveScore] [int] NULL,
	[fQuestionScore] [int] NULL,
	[fScoreDate] [datetime] NULL,
	[fAuthTestFlag] [bit] NULL,
 CONSTRAINT [PK_tScore] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  購物車主表 ******/
/****** Object:  Table [dbo].[tShoppingCart]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShoppingCart](
	[fBasketId] [int] IDENTITY(1,1) NOT NULL,
	[fId] [int] NOT NULL,
	[fProductID] [int] NOT NULL,
	[fQuantity] [smallint] NOT NULL,
	[fAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tShoppingCart] PRIMARY KEY CLUSTERED 
(
	[fBasketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  測驗積分表  ******/
/****** Object:  Table [dbo].[tTest]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTest](
	[fTestId] [int] IDENTITY(1,1) NOT NULL,
	[fId] [int] NOT NULL,
	[fQuestionId] [int] NOT NULL,
	[fScoreDate] [datetime] NULL,
	[fQuestionScore] [int] NULL,
	[fTestDiscontinue][bit] NULL,
 CONSTRAINT [PK_tTest] PRIMARY KEY CLUSTERED 
(
	[fTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: 會員登入資訊表 ******/
/****** Object:  Table [dbo].[tUserLog]     Script Date: 2020/2/6 下午 11:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserLog](
	[fId] [int] NOT NULL,
	[fLoginTime] [datetime] NOT NULL,
	[fLogoutTime] [datetime] NULL,
	[fErrorPasswordCount] [int] NULL,
	[fUserIP] [nvarchar](20) NULL,
	[fpw_reset_action_date] [datetime] NULL,
	[fpw_reset_authcode] [nvarchar](200) NULL,
 CONSTRAINT [PK_tUserLog] PRIMARY KEY CLUSTERED 
(
	[fId] ASC,
	[fLoginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: 網站管理員 ******/
/****** Object:  Table [dbo].[tAdminManager]    Script Date: 2020/2/8 下午 17:12:30 更新******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAdminManager](
	[ManagerId] [nvarchar](50) NOT NULL,
	[ManagerPassword] [nvarchar](50) NOT NULL,
	[ManagerPasswordSalt] [nvarchar](max) NULL,
	[ManagerEmail] [nvarchar](50) NOT NULL,
	[ManagerAuth] [int] NOT NULL,
 CONSTRAINT [PK_tAdminManager] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******會員瀏覽商品紀錄清單 ******/
/****** Object:  Table [dbo].[tUserBrowseHistory]    Script Date: 2020/2/5 上午 12:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserBrowseHistory](
	[fBrowseHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[fId] [int] NOT NULL,
	[fProductId] [int] NOT NULL,
	[fBrowseTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tUserBrowseHistory] PRIMARY KEY CLUSTERED 
(
	[fBrowseHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  會員擁有優惠清單 ******/
/****** Object:  Table [dbo].[tUserDiscountList]    Script Date: 2020/2/4 上午 08:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserDiscountList](
	[fId] [int] NOT NULL,
	[fDiscountCode] [nvarchar](50) NOT NULL,
	[fCount] [int] NOT NULL,
 CONSTRAINT [PK_tUserDiscountList] PRIMARY KEY CLUSTERED 
(
	[fId] ASC,
	[fDiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  會員收藏文章清單 ******/
/****** Object:  Table [dbo].[tUserFavorite]    Script Date: 2020/1/30 下午 04:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserFavorite](
	[fId] [int] NOT NULL,
	[fPostId] [int] NOT NULL,
	[fIsFavorite] [bit] NULL,
 CONSTRAINT [PK_tUserFavorite] PRIMARY KEY CLUSTERED 
(
	[fId] ASC,
	[fPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  會員商品收藏清單 ******/
/****** Object:  Table [dbo].[tUserProductFavorite]    Script Date: 2020/2/5 上午 12:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserProductFavorite](
	[fFavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[fId] [int] NOT NULL,
	[fProductId] [int] NOT NULL,
	[fAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tUserProductFavorite] PRIMARY KEY CLUSTERED 
(
	[fFavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  會員主表--個人資料 ******/
/****** Object:  Table [dbo].[tUserProfile]   Script Date: 2020/2/6 下午 11:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserProfile](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fUserId] [nvarchar](50) NOT NULL,
	[fPassword] [nvarchar](50) NOT NULL,
	[fPasswordSalt] [nvarchar](max) NULL,
	[fName] [nvarchar](50) NOT NULL,
	[fGender] [nvarchar](20) NOT NULL,
	[fBirthday] [datetime] NOT NULL,
	[fTel] [nvarchar](50) NULL,
	[fPhone] [nvarchar](50) NOT NULL,
	[fCity] [nvarchar](50) NOT NULL,
	[fAddress] [nvarchar](max) NOT NULL,
	[fPhoto] [nvarchar](max) NULL,
	[fCreateDate] [datetime] NOT NULL,
	[fScore] [int] NULL,
	[fAuth] [nvarchar](50) NOT NULL,
	[fAuthPost] [bit] NOT NULL,
	[fAuthReply] [bit] NOT NULL,
 CONSTRAINT [PK_tUserProfile] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** table關聯設定 ******/
ALTER TABLE [dbo].[tForum]  WITH CHECK ADD  CONSTRAINT [FK_tForum_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tForum] CHECK CONSTRAINT [FK_tForum_tUserProfile]
GO
ALTER TABLE [dbo].[tForum]  WITH CHECK ADD  CONSTRAINT [FK_tForum_tUserProfile1] FOREIGN KEY([fEnableUserId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tForum] CHECK CONSTRAINT [FK_tForum_tUserProfile1]
GO
ALTER TABLE [dbo].[tForumAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumAnalysis_tForum] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tForumAnalysis] CHECK CONSTRAINT [FK_tForumAnalysis_tForum]
GO
ALTER TABLE [dbo].[tForumAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumAnalysis_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tForumAnalysis] CHECK CONSTRAINT [FK_tForumAnalysis_tUserProfile]
GO
ALTER TABLE [dbo].[tForumAuth]  WITH CHECK ADD  CONSTRAINT [FK_tForumAuth_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tForumAuth] CHECK CONSTRAINT [FK_tForumAuth_tUserProfile]
GO
ALTER TABLE [dbo].[tForumReply]  WITH CHECK ADD  CONSTRAINT [FK_tForumReply_tForum] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tForumReply] CHECK CONSTRAINT [FK_tForumReply_tForum]
GO
ALTER TABLE [dbo].[tForumReply]  WITH CHECK ADD  CONSTRAINT [FK_tForumReply_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tForumReply] CHECK CONSTRAINT [FK_tForumReply_tUserProfile]
GO
ALTER TABLE [dbo].[tForumReply]  WITH CHECK ADD  CONSTRAINT [FK_tForumReply_tUserProfile1] FOREIGN KEY([fDeleteUserId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tForumReply] CHECK CONSTRAINT [FK_tForumReply_tUserProfile1]
GO
ALTER TABLE [dbo].[tForumReplyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumReplyAnalysis_tForumReply] FOREIGN KEY([fPostId], [fReplyId])
REFERENCES [dbo].[tForumReply] ([fPostId], [fReplyId])
GO
ALTER TABLE [dbo].[tForumReplyAnalysis] CHECK CONSTRAINT [FK_tForumReplyAnalysis_tForumReply]
GO
ALTER TABLE [dbo].[tForumReplyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumReplyAnalysis_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tForumReplyAnalysis] CHECK CONSTRAINT [FK_tForumReplyAnalysis_tUserProfile]
GO
ALTER TABLE [dbo].[tLineBotAccountLink]  WITH CHECK ADD  CONSTRAINT [FK_tLineBotAccountLink_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tLineBotAccountLink] CHECK CONSTRAINT [FK_tLineBotAccountLink_tUserProfile]
GO
ALTER TABLE [dbo].[tNewsMessage]  WITH CHECK ADD  CONSTRAINT [FK_tNewsMessage_tNews] FOREIGN KEY([fNewsId])
REFERENCES [dbo].[tNews] ([fNewsId])
GO
ALTER TABLE [dbo].[tNewsMessage] CHECK CONSTRAINT [FK_tNewsMessage_tNews]
GO
ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tUser] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tUser]
GO
ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tOrder] FOREIGN KEY([fOrderId])
REFERENCES [dbo].[tOrder] ([fOrderId])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tOrder]
GO
ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tProduct] FOREIGN KEY([fProductId])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tProduct]
GO
ALTER TABLE [dbo].[tProdEfficacyRelation]  WITH CHECK ADD  CONSTRAINT [FK_tProdEfficacyRelation_tEffcacy] FOREIGN KEY([fEfficacyID])
REFERENCES [dbo].[tEfficacy] ([fEfficacyID])
GO
ALTER TABLE [dbo].[tProdEfficacyRelation] CHECK CONSTRAINT [FK_tProdEfficacyRelation_tEffcacy]
GO
ALTER TABLE [dbo].[tProdEfficacyRelation]  WITH CHECK ADD  CONSTRAINT [FK_tProdEfficacyRelation_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tProdEfficacyRelation] CHECK CONSTRAINT [FK_tProdEfficacyRelation_tProduct]
GO
ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tCategory] FOREIGN KEY([fCategoryID])
REFERENCES [dbo].[tCategory] ([fCategoryID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tCategory]
GO
ALTER TABLE [dbo].[tProductImage]  WITH CHECK ADD  CONSTRAINT [FK_tProductImage_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tProductImage] CHECK CONSTRAINT [FK_tProductImage_tProduct]
GO
ALTER TABLE [dbo].[tProductUnilateral]  WITH CHECK ADD  CONSTRAINT [FK_tProductUnilateral_tNote] FOREIGN KEY([fNoteID])
REFERENCES [dbo].[tNote] ([fNoteID])
GO
ALTER TABLE [dbo].[tProductUnilateral] CHECK CONSTRAINT [FK_tProductUnilateral_tNote]
GO
ALTER TABLE [dbo].[tProductUnilateral]  WITH CHECK ADD  CONSTRAINT [FK_tProductUnilateral_tPart] FOREIGN KEY([fPartID])
REFERENCES [dbo].[tPart] ([fPartID])
GO
ALTER TABLE [dbo].[tProductUnilateral] CHECK CONSTRAINT [FK_tProductUnilateral_tPart]
GO
ALTER TABLE [dbo].[tProductUnilateral]  WITH CHECK ADD  CONSTRAINT [FK_tProductUnilateral_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tProductUnilateral] CHECK CONSTRAINT [FK_tProductUnilateral_tProduct]
GO
ALTER TABLE [dbo].[tProductVegetableoil]  WITH CHECK ADD  CONSTRAINT [FK_tProductVegetableoil_tfeature] FOREIGN KEY([ffeatureID])
REFERENCES [dbo].[tfeature] ([ffeatureID])
GO
ALTER TABLE [dbo].[tProductVegetableoil] CHECK CONSTRAINT [FK_tProductVegetableoil_tfeature]
GO
ALTER TABLE [dbo].[tProductVegetableoil]  WITH CHECK ADD  CONSTRAINT [FK_tProductVegetableoil_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tProductVegetableoil] CHECK CONSTRAINT [FK_tProductVegetableoil_tProduct]
GO
ALTER TABLE [dbo].[tScore]  WITH CHECK ADD  CONSTRAINT [FK_tScore_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tScore] CHECK CONSTRAINT [FK_tScore_tUserProfile]
GO
ALTER TABLE [dbo].[tShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingCart_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tShoppingCart] CHECK CONSTRAINT [FK_tShoppingCart_tProduct]
GO
ALTER TABLE [dbo].[tShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingCart_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tShoppingCart] CHECK CONSTRAINT [FK_tShoppingCart_tUserProfile]
GO
ALTER TABLE [dbo].[tTest]  WITH CHECK ADD  CONSTRAINT [FK_tTest_fQuestionId] FOREIGN KEY([fQuestionId])
REFERENCES [dbo].[tQuestion] ([fQuestionId])
GO
ALTER TABLE [dbo].[tTest] CHECK CONSTRAINT [FK_tTest_fQuestionId]
GO
ALTER TABLE [dbo].[tTest]  WITH CHECK ADD  CONSTRAINT [FK_tTest_fUserId] FOREIGN KEY([fId])
REFERENCES [dbo].[tScore] ([fId])
GO
ALTER TABLE [dbo].[tTest] CHECK CONSTRAINT [FK_tTest_fUserId]
GO
ALTER TABLE [dbo].[tUserBrowseHistory]  WITH CHECK ADD  CONSTRAINT [FK_tUserBrowseHistory_tProduct] FOREIGN KEY([fProductId])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tUserBrowseHistory] CHECK CONSTRAINT [FK_tUserBrowseHistory_tProduct]
GO
ALTER TABLE [dbo].[tUserBrowseHistory]  WITH CHECK ADD  CONSTRAINT [FK_tUserBrowseHistory_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tUserBrowseHistory] CHECK CONSTRAINT [FK_tUserBrowseHistory_tUserProfile]
GO
ALTER TABLE [dbo].[tUserDiscountList]  WITH CHECK ADD  CONSTRAINT [FK_tUserDiscountList_tDiscount] FOREIGN KEY([fDiscountCode])
REFERENCES [dbo].[tDiscount] ([fDiscountCode])
GO
ALTER TABLE [dbo].[tUserDiscountList] CHECK CONSTRAINT [FK_tUserDiscountList_tDiscount]
GO
ALTER TABLE [dbo].[tUserDiscountList]  WITH CHECK ADD  CONSTRAINT [FK_tUserDiscountList_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tUserDiscountList] CHECK CONSTRAINT [FK_tUserDiscountList_tUserProfile]
GO
ALTER TABLE [dbo].[tUserFavorite]  WITH CHECK ADD  CONSTRAINT [FK_tUserFavorite_tUserFavorite] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tUserFavorite] CHECK CONSTRAINT [FK_tUserFavorite_tUserFavorite]
GO
ALTER TABLE [dbo].[tUserLog]  WITH CHECK ADD  CONSTRAINT [FK_tUserLog_tUserProfile] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tUserLog] CHECK CONSTRAINT [FK_tUserLog_tUserProfile]
GO
ALTER TABLE [dbo].[tUserProductFavorite]  WITH CHECK ADD  CONSTRAINT [FK_tUserProductFavorite_tProduct] FOREIGN KEY([fProductId])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tUserProductFavorite] CHECK CONSTRAINT [FK_tUserProductFavorite_tProduct]
GO
ALTER TABLE [dbo].[tUserProductFavorite]  WITH CHECK ADD  CONSTRAINT [FK_tUserProductFavorite_tUserProductFavorite] FOREIGN KEY([fId])
REFERENCES [dbo].[tUserProfile] ([fId])
GO
ALTER TABLE [dbo].[tUserProductFavorite] CHECK CONSTRAINT [FK_tUserProductFavorite_tUserProductFavorite]
GO
USE [master]
GO
ALTER DATABASE [dbShoppingForum] SET  READ_WRITE 
GO
