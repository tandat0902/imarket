USE [iMarketDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 19/06/2024 5:58:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[Active] [bit] NULL,
	[FullName] [nvarchar](150) NULL,
	[LastLogin] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[Levels] [int] NULL,
	[Ordering] [int] NULL,
	[Published] [bit] NULL,
	[Thumbnail] [varchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[Cover] [varchar](255) NULL,
	[SchemaMarkup] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[Birthday] [date] NULL,
	[Avatar] [varchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[DateCreated] [datetime] NULL,
	[Password] [varchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[Active] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[LocationID] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](20) NULL,
	[Slug] [nvarchar](100) NULL,
	[NameWithType] [nvarchar](255) NULL,
	[PathWithType] [nvarchar](255) NULL,
	[ParentCode] [int] NULL,
	[Levels] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NULL,
	[Deleted] [bit] NULL,
	[Paid] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[PaymentID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](255) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumbnail] [varchar](255) NULL,
	[Published] [bit] NULL,
	[Title] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[Ordering] [int] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ShortContents] [nvarchar](255) NULL,
	[Contents] [nvarchar](255) NULL,
	[Thumbnail] [varchar](255) NULL,
	[Published] [bit] NULL,
	[Alias] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Author] [nvarchar](255) NULL,
	[AccountID] [int] NULL,
	[Tags] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
	[IsHot] [bit] NULL,
	[IsNewFeed] [bit] NULL,
	[MetaDecs] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[Views] [int] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Discount] [int] NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[Video] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NULL,
	[HomeFlag] [bit] NULL,
	[Active] [bit] NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[UnitsInStock] [int] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](150) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[Company] [nvarchar](150) NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactStatus]    Script Date: 19/06/2024 5:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [PhoneNumber], [Email], [Password], [Salt], [Active], [FullName], [LastLogin], [DateCreated], [RoleID]) VALUES (1, N'0862616215', N'tandat.pham292@gmail.com', N'0862616215dat', NULL, 1, N'Phạm Trần Tấn Đạt', CAST(N'2024-04-11T15:17:00.000' AS DateTime), CAST(N'2024-04-11T15:17:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumbnail], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (1, N'Rau Củ', N'Rau củ', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumbnail], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (2, N'Trái Cây', N'Trái Cây', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [PhoneNumber], [District], [Ward], [DateCreated], [Password], [Salt], [Active], [LastLogin], [LocationID]) VALUES (1, N'Phạm Huyền Diệu', CAST(N'2007-05-19' AS Date), NULL, N'KDC Bình Giang, Bình Giang, Hòn Đất, Kiên Giang', N'dieuxinh2k7@gmail.com', N'0123456789', 5, 1, CAST(N'2024-04-11T20:48:00.000' AS DateTime), N'19052007', NULL, 1, CAST(N'2024-04-11T20:48:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (18, N'Dưa Hấu Không Hạt', NULL, N'Dưa Hấu Không Hạt', CAST(25000 AS Decimal(18, 0)), 10, N'dua-hau-khong-hat.jpg', NULL, CAST(N'2024-06-15T21:58:31.520' AS DateTime), CAST(N'2024-06-15T21:58:31.520' AS DateTime), 1, 1, 1, N'Dưa Hấu Không Hạt', N'Dưa Hấu Không Hạt', N'dua-hau-khong-hat', N'Dưa Hấu Không Hạt', N'Dưa Hấu Không Hạt', 200, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (19, N'Nho Xanh Ninh Thuận', NULL, N'Nho Xanh Ninh Thuận', CAST(60000 AS Decimal(18, 0)), 0, N'nho-xanh-ninh-thuan.jpg', NULL, CAST(N'2024-06-15T21:59:37.743' AS DateTime), CAST(N'2024-06-15T21:59:37.743' AS DateTime), 0, 0, 1, N'Nho Xanh Ninh Thuận', N'Nho Xanh Ninh Thuận', N'nho-xanh-ninh-thuan', N'Nho Xanh Ninh Thuận', N'Nho Xanh Ninh Thuận', 0, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (20, N'Rau Muống', NULL, N'Rau Muống', CAST(25000 AS Decimal(18, 0)), 0, N'rau-muong.jpg', NULL, CAST(N'2024-06-15T22:00:36.110' AS DateTime), CAST(N'2024-06-15T22:00:36.110' AS DateTime), 0, 0, 0, N'Rau Muống', N'Rau Muống', N'rau-muong', N'Rau Muống', N'Rau Muống', 50, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (21, N'Cam Úc', NULL, N'Cam Úc', CAST(45000 AS Decimal(18, 0)), 5, N'cam-uc.jpg', NULL, CAST(N'2024-06-15T22:02:11.590' AS DateTime), CAST(N'2024-06-15T22:02:11.590' AS DateTime), 1, 1, 1, N'Cam Úc', N'Cam Úc', N'cam-uc', N'Cam Úc', N'Cam Úc', 100, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (23, N'Chanh Dây', NULL, N'Chanh Dây', CAST(45000 AS Decimal(18, 0)), 0, N'chanh-day.png', NULL, CAST(N'2024-06-16T02:23:42.147' AS DateTime), CAST(N'2024-06-16T02:23:42.147' AS DateTime), 0, 0, 1, N'Chanh Dây', N'Chanh Dây', N'chanh-day', N'Chanh Dây', N'Chanh Dây', 0, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (24, N'Khoai Lang Nhật', NULL, N'Khoai Lang Nhật', CAST(20000 AS Decimal(18, 0)), 4, N'khoai-lang-nhat.jpg', NULL, CAST(N'2024-06-16T02:29:12.637' AS DateTime), CAST(N'2024-06-16T02:29:12.637' AS DateTime), 0, 0, 0, N'Khoai Lang Nhật', N'Khoai Lang Nhật', N'khoai-lang-nhat', N'Khoai Lang Nhật', N'Khoai Lang Nhật', 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (25, N'Cải Ngọt', NULL, N'Cải Ngọt', CAST(12000 AS Decimal(18, 0)), 0, N'cai-ngot.jpg', NULL, CAST(N'2024-06-16T02:30:31.547' AS DateTime), CAST(N'2024-06-16T02:30:31.547' AS DateTime), 0, 0, 1, N'Cải Ngọt', N'Cải Ngọt', N'cai-ngot', N'Cải Ngọt', N'Cải Ngọt', 50, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (27, N'Xà Lách', NULL, N'Xà Lách', CAST(13000 AS Decimal(18, 0)), 0, N'xa-lach.jpg', NULL, CAST(N'2024-06-16T02:46:06.717' AS DateTime), CAST(N'2024-06-16T02:46:06.717' AS DateTime), 0, 0, 1, N'Xà Lách', N'Xà Lách', N'xa-lach', N'Xà Lách', N'Xà Lách', 60, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (28, N'Bí Đỏ Hồ Lô', NULL, N'Bí Đỏ Hồ Lô', CAST(25000 AS Decimal(18, 0)), 0, N'bi-do-ho-lo.jpg', NULL, CAST(N'2024-06-16T02:47:22.490' AS DateTime), CAST(N'2024-06-16T02:47:22.490' AS DateTime), 1, 1, 1, N'Bí Đỏ Hồ Lô', N'Bí Đỏ Hồ Lô', N'bi-do-ho-lo', N'Bí Đỏ Hồ Lô', N'Bí Đỏ Hồ Lô', 100, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (42, N'Mận Hà Nội', N'Mận Hà Nội', N'Mua mận Hà Nội ngon tại iMartket.  Giới thiệu về mận Hà Nội Mận Hà Nội là tên gọi của mọi người trong Nam gọi để phân biệt với các loại mận trong Nam như mận An Phước. Mận Hà...', CAST(45000 AS Decimal(18, 0)), 0, N'man-ha-noi.jpg', NULL, CAST(N'2024-06-17T01:11:34.947' AS DateTime), CAST(N'2024-06-17T01:11:34.947' AS DateTime), 0, 0, 0, N'Mận Hà Nội', N'Mận Hà Nội', N'man-ha-noi', N'Mận Hà Nội', N'Mận Hà Nội', 200, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (43, N'Táo Xanh Nam Phi 1kg', N'Táo Xanh Nam Phi 1kg', N'Táo xanh là nguồn cung cấp vitamin A, vitamin C và chất chống oxy hoá vô cùng phong phú. Các hợp chất có tác dụng chống lại các dấu hiệu lão hoá da, giúp làn da duy trì sự trẻ trung, khoẻ mạnh. Nếu bạn mắc phải bệnh tiểu đường, hãy thường xuyên sử dụng táo xanh như một món ăn vặt hoặc tráng miệng.
Táo Xanh Nam Phi sau khi nhập về được bảo quản bằng hệ thống bảo quản lạnh liên tục ( ở nhiệt độ từ 1-4 o C) nên giữ được độ tươi ngon và dưỡng chất tự nhiên của quả táo.
Nhờ khả năng giảm cholesterol xấu của táo xanh, duy trì cholesterol ở mức có lợi cho cơ thể. Khi đó, nguy cơ mắc các bệnh huyết áp, tim mạch, đột quỵ sẽ giảm đáng kể.
Loại trái cây này thích hợp ăn chơi, ăn vặt, bổ sung dưỡng chất, làm quà tặng sang trọng hay quà tặng sinh nhật. Ngoài ra, loại trái cây này là một trong những loại trái cây tốt cho bà bầu.
Trong táo xanh Nam Phi có chứa nhiều thành phần dinh dưỡng như:

Hàm lượng chất xơ của táo xanh khá cao, có thể đáp ứng từ 17% nhu cầu chất xơ của cơ thể mỗi ngày. Chất xơ trong táo gồm cả chất xơ không hòa tan và chất xơ hòa tan pectin.
Hàm lượng vitamin C trong táo xanh có thể đáp ứng 11% nhu cầu của cơ thể mỗi ngày. Hàm lượng kali đáp ứng 4% nhu cầu của cơ thể mỗi ngày.
Các nghiên cứu khoa học cũng chỉ ra rằng ăn táo xanh có thể giảm triệu chứng bệnh hen suyễn. Các chất chống oxy hóa trong táo xanh bảo vệ phổi khỏi những tổn thương do quá trình oxy hóa tế bào gây ra. Hợp chất quercetin flavonoid có tác dụng giảm phản ứng dị ứng, giảm viêm và triệu chứng của bệnh hen suyễn.', CAST(85000 AS Decimal(18, 0)), 15, N'tao-xanh-nam-phi-1kg.jpg', NULL, CAST(N'2024-06-17T01:34:35.000' AS DateTime), CAST(N'2024-06-19T17:53:51.480' AS DateTime), 1, 1, 1, N'Táo Xanh Nam Phi 1kg', N'Táo Xanh Nam Phi 1kg', N'tao-xanh-nam-phi-1kg', N'Táo Xanh Nam Phi 1kg', N'Táo Xanh Nam Phi 1kg', 200, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [UnitPrice], [Discount], [Thumbnail], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock], [CategoryID]) VALUES (44, N'Táo Dazzle Nhập Khẩu New Zealand (size 5-7 Trái/kg) 1kg', N'Táo Dazzle nhập khẩu New Zealand (size 5-7 Trái/kg) 1kg', N'Táo Dazzle nhập khẩu New Zealand có kích thước lớn, vỏ sáng bóng, màu đỏ ruby đẹp mắt, thơm, ngọt. Hương vị ngọt ngào của táo Dazzle sẽ thu hút các thị trường châu Á đang phát triển.
Táo Dazzle New Zealand cũng giống như những loại táo khác có nhiều vitamin A, C, canxi, và sắt, cùng với pectin, và những chất tốt cho hệ tiêu hóa.
Táo Dazzle có lượng magiê và kali giúp điều chỉnh áp suất máu và giữ cho nhịp đập tim ở ổn định.', CAST(117000 AS Decimal(18, 0)), 8, N'tao-dazzle-nhap-khau-new-zealand-size-5-7-traikg-1kg.jpg', NULL, CAST(N'2024-06-17T01:36:16.000' AS DateTime), CAST(N'2024-06-19T17:55:17.783' AS DateTime), 1, 0, 1, N'Táo Dazzle nhập khẩu New Zealand (size 5-7 Trái/kg) 1kg', N'Táo Dazzle nhập khẩu New Zealand (size 5-7 Trái/kg) 1kg', N'tao-dazzle-nhap-khau-new-zealand-size-5-7-traikg-1kg', N'Táo Dazzle nhập khẩu New Zealand (size 5-7 Trái/kg) 1kg', N'Táo Dazzle nhập khẩu New Zealand (size 5-7 Trái/kg) 1kg', 200, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Administrator', N'Quản trị viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Staff', N'Nhân viên bán hàng')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (4, N'Warehouse Staff', N'Nhân viên kiểm kê kho')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (5, N'Guard', N'Nhân viên bảo vệ')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (6, N'Sanitation Worker', N'Nhân viên vệ sinh')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Locations]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransactStatus] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[TransactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransactStatus]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Accounts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
