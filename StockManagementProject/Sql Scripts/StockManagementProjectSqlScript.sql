USE [master]
GO
/****** Object:  Database [WarehouseStockManagement]    Script Date: 28.05.2023 21:45:59 ******/
CREATE DATABASE [WarehouseStockManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WarehouseStockManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WarehouseStockManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WarehouseStockManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WarehouseStockManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WarehouseStockManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WarehouseStockManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WarehouseStockManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WarehouseStockManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WarehouseStockManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WarehouseStockManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WarehouseStockManagement] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WarehouseStockManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WarehouseStockManagement] SET  MULTI_USER 
GO
ALTER DATABASE [WarehouseStockManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WarehouseStockManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WarehouseStockManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WarehouseStockManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WarehouseStockManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WarehouseStockManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WarehouseStockManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [WarehouseStockManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WarehouseStockManagement]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReceiverWarehouseId] [int] NOT NULL,
	[ShipperWarehouseId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[ShipmentDate] [datetime] NOT NULL,
	[ShipperManagerId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Shipments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseProductStocks]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseProductStocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.WarehouseProductStocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 28.05.2023 21:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[District] [nvarchar](max) NULL,
	[ManagerId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Warehouses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202305281538038_create-database', N'StockManagementProject.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6FE4B6157E2F90FF20E8A92D1C8FED7D498D99049BF1BA30BABBDE789CB46F062DD16325BA4C25CAB551F497F5A13F297FA1E4E8424ABC8A1A692E3B08107844F2F0F09C8F878787E4D9DFFFFBBFE90FAF51E8BCC0340B9278E69E9F9EB90E8CBDC40FE2E5CCCDD1D3B7DFB93F7CFFCD1FA61FFCE8D5F9A5AAF78ED4C32DE36CE63E23B4BA9C4C32EF1946203B8D022F4DB2E4099D7A4934017E32B9383BFBCBE4FC7C02310917D3729CE95D1EA32082EB1FF8E73C893DB84239083F253E0CB3F23B2E59ACA93A9F4104B315F0E0CC5DA0C4FBED1388C1124630465FD2E457E8A1D32B80C07BCF8359F611BCC1D475DE8701C0DC2D60F8E43A208E130410E6FDF2E70C2E509AC4CBC50A7F00E1FDDB0AE27A4F20CC6039A64B5ADD74786717647813DAB022E5E5194AA28E04CFDF95F29AB49B5B49DDADE58925FA014B1EBD9151AFA53A73E700C16592BEB94EBBB3CB7998928A52A117DA3AAD289C38E27A27357030BEC87F27CE3C0F519EC2590C739482F0C4F9923F8681F737F8769FFC06E3599C8721CB36661C97353EE04F98FE0AA6E8ED0E3E9583B9F15D67D26C376937AC9B316D8A61DEC4E8DD85EB7CC69D83C710D6A86044824798C2BFC218A678D0FE1780104C634203AEE5CAF5DEEA8BFCBFEA0DC310CF32D7F9045E3FC278899E672EFED375AE8357E8575F4A0E7E8E033C29712394E650D7C94DB6C0DCE659D5D18F491242100B06D6A2F319BC04CBF5385B14F14F3FF790EBDCC1705D9E3D07AB62729D96650F1447D76912DD25216D57973DDC837409319DFB44526191E4A9D7E26C3AA1A05542B966D316C925812390B540AE14A6EFF3202704057BDF1951015E3A23AA2963CADA023342302B64AD2A7CA8A70A65AD5DC64D56AE8268B2AA58FB3B48E1739267B024B09E65423E8535454C2B2B722350D7EE657BA8D86D8D4F45E1687DB4D6E70E7A30C05E6BADCFBE6688C87EB5417A25A43644E6A71C9462E93B460227EC2AD72697FC7D1F10136C27B002A469E7715A791A9D8C57DBAE4AAD9B29671CE6D43C0AAA0BB8E56AC9F9E6ABDAAC0C546742F6F1EE287DA0A68C72DC28E0EC6AB3B4EBB2D09E7C6AC1F2B505726D57928B95AB2992AAF12AC07065BB0CD4248EEB80761DB80A32EC33124B30B007696BE70EC3DBD55A0CE1646C96886D063F41BB9A633377D7D61A4B5D60B9E1EE68F5CCF8B7337A52EEA5E6712C4F5E38104D55436F5E3D28634B4EE0696FC449EBA3FDD6DAEF459EC66398C40F1108C2C17BF902B2EC5F49EA0FDE1181FF57BA1491A10BED0C297828262DB528F547CE76D0121BBB2D35D886FE73DB1B157BD79D8D71BF055AC8D486FCE2426DB6D694B43E5AD3433D5C28266DF729DDC62B3FD9FB6DE19AAE4DEFED1C4BEE08662D980F2B146715EFDA5010BC3D4FCC42E69B597C36E8FD9B0DC36EBD7A9F658917AC996FEA859EE134C5F121F61DDD814E611C9803216C8DF1640E5678FA621E66EE9F39292BC8D60E0C254BCF979A74CFDDF6F4BF8DAF60081174DE7BC5258439C83CE0F338C5F2F19B5FB0C5802999B2209C63D5621B14C488372F41EC052B106AB86FB533344C84AFBA8776C9155CC198D8148D3E4CBA660F357916EA9E5A22D349683A61E0A5461D17E196C1431EEEA6F0A06EA839ECE467805A346F1F7532E647409D4C1F265D330BD4564047DD2C192A043E178543E1DA0F8805111F0258168EA20EEA56C0E2C63F02A2B8B19AF4590506B682A3E6DE57A643C94658ADC781F02439D4B231A156B812CA62046C09C76DD22F7FEABB3DA4512752A95E8103B93DAC0962D99419C62B1E0E6D9C38C6821B3774938EB70D34F50E4CA66AC3ED9840F3CD9083B9DB66780B6A0F7C38A3918C8059231DEE8377A7DB81778394D29A0E04633BA3B9AB50B6B2838380D96A296884E5B6BB47E6CFF4B5BB5AC575AB0DED9B1557088C40BB91955ECFCD985B62A9D08D7634A29B9EDBC51D7717430B0AF96DB40DA14E7EF3630BA093313326E66412EFB0C9191B7145641AB741B8054CAB1B6E0001F20DBE8A6E9663CFBA3C86CACAD3BB365408CD0544DCB3051A07E782C91CDC9A346AD791235197682850A873246891860683668E0853A6A152ECFF3802C5674DDB22EEC5B52D3E9B72DFF494E42369D66B516700C5A9897984C254933D5469A3DCE098A31E1A830C6EB6189C6B3074A4509C34476A2005FECA382F0575D0DD2CECCE702F83B0599C5D2F4E0B293007E9FCF025E15F4D0098E15384784DD896692D9C6BDD87D8BA78C30F53119D34884F6A1836882A1A20C476D88CBD938C5BE2AB9844CB3A8F9C7742181272D3DC7DEC9AE3715E141DA23916F11CD1285566DB2280338871D01ED19B0AD20464A651850184391A2E5597CE15AB8F663BDB75436BBD22C977B043CB8BBFE4AE10977A17D6711F662D2CE9C6ABA7ACAA8B2AF576A02E9B4E8A9C18E587E944923C63FA09AC5641BC649269945F9C45914963FEEDA27B3A89A8A031F1324156899ADBBA2794A460095BA5B86BCCE9759066E42D2278044434733FE2AAB19B1F89435DF5D4DADFF0AAAB3CEBAA01F9BBC49F51469153196D2AD86B3C5642613D6C287268B9A60E49710242900A6EDACD93308F62F9BE58DEBAB808CAB62FBE9853A0B73C1B5CD45F794AD3494B0ADC8E99D30117756DEAD448E3F2D5BBB7C225A40DF42D6D398CBAD96B4B2C15D575A62378D840C400E891D136808FBCE930F811C6585972464158397D51408D256F12709353670ED858A28A73372D2D7AC9574091167693007D7ADF1E3B2DE92C53E6805C2051C5F1F9D6E69CCA61EB3DE9A4C40D669DA2ED30D38E3E5E6669D0AFE694242850AAFF68FE5D49D0AB370A45740D00286E360CF6EA87970DAB517D34A7533EAC64A9949F3A18DDFAD964C3DAD65F3B2C64E5F5C7C6DA25B91229A7F215CD8075E876801920A26B3003C4CD8E7BA49E5A1647D0865C7E551D75598AD574860186D44D3D00FF7450007231AB7695BAF73A76D58A514DCB78913E0B2C17402AAAB80E16C24BE093E0D1E22D43305A63F474F1CF701E06EBA85E5501A3397882192A5E51BA1767E717ADA4B1BB93C07592657E2888B789B2B836F535C253D0804855FBD8B3477682F805A4DE3348FF1881D73FB1946C9E2B3F0648C34CE76CA38721713EA167204C667813FBF075E6FE7BDDECD2B9F9C7036D79E2DCA6786A5D3A67CE7F0E52E592D72DFBAA73451A4553E50B48F442813C11A329473C855E0C31EB74373EEA869BE8BEFDEC7CCDC406F23FFAF86FB4C9FC8F1DB554B7EF20248B647C87315DDBD9EE7A59496BCDD9A86C3FAD3D1F90D95BE8B4126DF592782399562F4AED8459BD8835936219AF5FEB56070F653EB2B2B750DE07711B0430F656FE3D5CB3AFDD271B20FD0CBD2B3D766218EE4EB75DCA1BABB7268ABB382673C8B14828736009643AE86C20D4D08B76E3255CE8A2CB0D3D45DA8B47C2662960B695F6A5B8773E5EAA97B172221C524A976DA5D5D8861531D6DD982664FF52B36C0B32CC7DEC91B3AF8CFAD6FF8013AC6CDF79913C4AE99F0C63D7DD1AD323FEDDF3717A2742D942DE915D055C3723B335C8ED50D208F364259DF1C63F36DFA673342A343A7948FB9C4AE4088A61DDE6DD48F6C13F8B6B2BD1229D4771336AE6FA8F095679119B2C4B03C85D53B449F721EAA12CD4D3374A0622EAA12AD57761982B44D4495DACEF45994B44449B94E8C92AD38C88C892920E32697A0B72F934EB2965C556E53919235B497B6228D38A88B7164CC3FADBE69E3AD7247BA523E9C0AC6409601A6E302BC546F28D74CB31C2CEBE9DCD2BD22D9BC6D05ADA70EE906E83E36CF2FEA607B19D854A136C9EFA626F527E98697A47443442128F3E8219DA360C9E93631706DF21C906FF30013BFF794CAE4E16BFAE60162C298929A61943AFE1F6D7756EE2A7A4DA89B438AAAAB42FEB41047CF2D82645C113F0C8031CF2EA66FD2F7CFD02C21C925B598FD0BF896F73B4CA111E328C1EC386AB437631AAFED799449A3C4F6F57EB7FCF671343C06C06E4B6E96DFC631E847ECDF7B5E09A848404D91E951759882E11B9D0B27CAB297D4E624342A5F8EA5DDD3D8C56212696DDC60BF0026D78C30BDE47B804DE5BF5BE444E44AF88A6D8A7570158A620CA4A1AB43DFE8931EC47AFDFFF1F03459B7FCB890000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [IsStatus]) VALUES (1, N'Meyveler', 1)
INSERT [dbo].[Categories] ([Id], [Name], [IsStatus]) VALUES (2, N'Bilgisayar Parçaları', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [IsStatus]) VALUES (1, 1, N'Elma', 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [IsStatus]) VALUES (2, 1, N'Muz', 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [IsStatus]) VALUES (3, 1, N'Armut', 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [IsStatus]) VALUES (4, 2, N'Rtx 4070 Ekran kartı', 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [IsStatus]) VALUES (5, 2, N'Asus Monitör', 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [IsStatus]) VALUES (6, 2, N'Asus Anakart', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [IsStatus]) VALUES (1, N'Atanmamış Rol', 1)
INSERT [dbo].[Roles] ([Id], [Name], [IsStatus]) VALUES (2, N'Admin', 1)
INSERT [dbo].[Roles] ([Id], [Name], [IsStatus]) VALUES (3, N'Sevkiyatçı', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipments] ON 

INSERT [dbo].[Shipments] ([Id], [ReceiverWarehouseId], [ShipperWarehouseId], [ProductId], [ProductQuantity], [ShipmentDate], [ShipperManagerId]) VALUES (1, 2, 1, 3, 6, CAST(N'2023-05-28T21:41:41.183' AS DateTime), 3)
INSERT [dbo].[Shipments] ([Id], [ReceiverWarehouseId], [ShipperWarehouseId], [ProductId], [ProductQuantity], [ShipmentDate], [ShipperManagerId]) VALUES (2, 2, 1, 4, 2, CAST(N'2023-05-28T21:41:51.097' AS DateTime), 3)
INSERT [dbo].[Shipments] ([Id], [ReceiverWarehouseId], [ShipperWarehouseId], [ProductId], [ProductQuantity], [ShipmentDate], [ShipperManagerId]) VALUES (3, 1, 2, 6, 3, CAST(N'2023-05-28T21:42:42.660' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Shipments] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Surname], [Email], [Password], [RoleId], [Name], [IsStatus]) VALUES (1, NULL, N'  ', N'   ', 1, N'Yönetici Yok', 1)
INSERT [dbo].[Users] ([Id], [Surname], [Email], [Password], [RoleId], [Name], [IsStatus]) VALUES (2, N'Deneme', N'admin', N'123', 2, N'Admin', 1)
INSERT [dbo].[Users] ([Id], [Surname], [Email], [Password], [RoleId], [Name], [IsStatus]) VALUES (3, N'Yazıcı', N'ismail', N'123', 1, N'İsmail', 1)
INSERT [dbo].[Users] ([Id], [Surname], [Email], [Password], [RoleId], [Name], [IsStatus]) VALUES (4, N'Cankaya', N'furkan', N'123', 3, N'Furkan', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[WarehouseProductStocks] ON 

INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (1, 1, 1, 50)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (2, 1, 2, 100)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (3, 1, 3, 64)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (4, 1, 4, 13)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (5, 1, 5, 10)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (6, 1, 6, 23)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (7, 2, 1, 20)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (8, 2, 2, 15)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (9, 2, 3, 40)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (10, 2, 4, 3)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (11, 2, 5, 0)
INSERT [dbo].[WarehouseProductStocks] ([Id], [WarehouseId], [ProductId], [ProductQuantity]) VALUES (12, 2, 6, 0)
SET IDENTITY_INSERT [dbo].[WarehouseProductStocks] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([Id], [District], [ManagerId], [Name], [IsStatus]) VALUES (1, N'Kadıköy', 3, N'Ana Dağıtım Merkezi', 1)
INSERT [dbo].[Warehouses] ([Id], [District], [ManagerId], [Name], [IsStatus]) VALUES (2, N'Sultanbeyli', 4, N'Aydos Dağıtım Deposu', 1)
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[Shipments]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReceiverWarehouseId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_ReceiverWarehouseId] ON [dbo].[Shipments]
(
	[ReceiverWarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShipperManagerId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_ShipperManagerId] ON [dbo].[Shipments]
(
	[ShipperManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShipperWarehouseId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_ShipperWarehouseId] ON [dbo].[Shipments]
(
	[ShipperWarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[WarehouseProductStocks]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WarehouseId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_WarehouseId] ON [dbo].[WarehouseProductStocks]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ManagerId]    Script Date: 28.05.2023 21:45:59 ******/
CREATE NONCLUSTERED INDEX [IX_ManagerId] ON [dbo].[Warehouses]
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Shipments_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_dbo.Shipments_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Shipments_dbo.Users_ShipperManagerId] FOREIGN KEY([ShipperManagerId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_dbo.Shipments_dbo.Users_ShipperManagerId]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Shipments_dbo.Warehouses_ReceiverWarehouseId] FOREIGN KEY([ReceiverWarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_dbo.Shipments_dbo.Warehouses_ReceiverWarehouseId]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Shipments_dbo.Warehouses_ShipperWarehouseId] FOREIGN KEY([ShipperWarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_dbo.Shipments_dbo.Warehouses_ShipperWarehouseId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[WarehouseProductStocks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WarehouseProductStocks_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarehouseProductStocks] CHECK CONSTRAINT [FK_dbo.WarehouseProductStocks_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[WarehouseProductStocks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WarehouseProductStocks_dbo.Warehouses_WarehouseId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarehouseProductStocks] CHECK CONSTRAINT [FK_dbo.WarehouseProductStocks_dbo.Warehouses_WarehouseId]
GO
ALTER TABLE [dbo].[Warehouses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Warehouses_dbo.Users_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Warehouses] CHECK CONSTRAINT [FK_dbo.Warehouses_dbo.Users_ManagerId]
GO
USE [master]
GO
ALTER DATABASE [WarehouseStockManagement] SET  READ_WRITE 
GO
