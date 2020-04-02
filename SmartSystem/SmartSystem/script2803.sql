USE [SmartShutter]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoruID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoruID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Container]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CNumber] [int] NULL,
	[CDescription] [nvarchar](max) NULL,
	[CDate] [datetime] NULL,
	[CUser] [nvarchar](128) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContainerData]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContainerID] [int] NULL,
	[MaterialID] [int] NULL,
	[StoreID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Notes] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ContainerData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](50) NULL,
	[CurrentRate] [decimal](18, 2) NULL,
	[LastRate] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](250) NULL,
	[Address] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[CreationDate] [date] NULL,
	[CreationUser] [nvarchar](256) NULL,
	[PhoneNumber] [int] NULL,
	[IsActive] [bit] NULL,
	[IsLocked] [bit] NULL,
	[CreditLimitAmount] [int] NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[CustomerNumber] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CuttingListsMaterials]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuttingListsMaterials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NULL,
	[StoreID] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[ActionDate] [datetime] NULL,
	[Height] [decimal](18, 2) NULL,
	[Width] [decimal](18, 2) NULL,
	[UnitID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[UserName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_DefectiveMaterials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeadMaterials]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeadMaterials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NULL,
	[StoreID] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[ActionDate] [datetime] NULL,
	[Height] [decimal](18, 2) NULL,
	[Width] [decimal](18, 2) NULL,
	[UnitID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[UserName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_DeadMaterials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logger]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logger](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](max) NULL,
	[UserName] [nvarchar](50) NULL,
	[ActionDate] [datetime] NULL,
	[ActionType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Logger] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaterialHistory]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActionDate] [datetime] NULL,
	[UserName] [nvarchar](128) NULL,
	[TransactionName] [nvarchar](100) NULL,
	[OldStock] [decimal](18, 2) NULL,
	[NewStock] [decimal](18, 2) NULL,
	[Note] [nvarchar](250) NULL,
	[MaterialID] [int] NULL,
	[StoreID] [int] NULL,
 CONSTRAINT [PK_MaterialHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaterialInStock]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialInStock](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NULL,
	[StoreID] [int] NULL,
	[CurrencyID] [int] NULL,
	[StockOnHand] [decimal](18, 2) NULL,
	[SafetyStock] [decimal](18, 2) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUser] [nvarchar](256) NULL,
	[IsActive] [bit] NULL,
	[LastReceiptDate] [datetime] NULL,
	[LastSalesDate] [datetime] NULL,
	[OpeningStock] [decimal](18, 2) NULL,
	[Location] [nvarchar](50) NULL,
	[ReservedStock] [decimal](18, 2) NULL,
	[LastOrderDate] [datetime] NULL,
	[UnitID] [int] NULL,
	[Supplier] [int] NULL,
 CONSTRAINT [PK_MaterialInStock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Materials]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialNo] [nvarchar](50) NULL,
	[MaterialName] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[TypeID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[UnitID] [int] NULL,
	[Height] [decimal](18, 2) NULL,
	[Width] [decimal](18, 2) NULL,
	[imagepath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Materials_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[MaterialID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Height] [decimal](18, 2) NULL,
	[Width] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[MaterialType] [nvarchar](50) NULL,
	[StoreID] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Notes] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Orders_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](4000) NOT NULL,
	[PropertyValueStrings] [nvarchar](4000) NOT NULL,
	[PropertyValueBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReservedMaterials]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedMaterials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialInStock] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[ReservedDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[UserName] [nvarchar](250) NULL,
	[Paid] [bit] NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ReservedMaterials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockLogger]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockLogger](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialInStock] [int] NOT NULL,
	[OldStock] [decimal](18, 2) NULL,
	[NewStock] [decimal](18, 2) NULL,
	[OldReservedStock] [decimal](18, 2) NULL,
	[NewReservedStock] [decimal](18, 2) NULL,
	[OldSafetyStock] [decimal](18, 2) NULL,
	[newSafetyStock] [decimal](18, 2) NULL,
	[ActionDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_StockLogger] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stores]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [int] NULL,
	[StoreLocation] [nvarchar](50) NULL,
	[StoreName] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[PhoneNumber] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](250) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_SubCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[Rate] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TC] [nvarchar](50) NULL,
	[Serial] [bigint] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransferDetails]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransferID] [int] NULL,
	[MaterialID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Height] [decimal](18, 2) NULL,
	[Width] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[Notes] [nvarchar](250) NULL,
	[MaterialType] [nvarchar](50) NULL,
 CONSTRAINT [PK_TransferDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transfers]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SerialNo] [int] NOT NULL,
	[TransferDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[Note] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[FromStore] [int] NULL,
	[ToStore] [int] NULL,
 CONSTRAINT [PK_Transfers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Units]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NULL,
	[UnitSymbol] [nchar](10) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[MaterialsForOrder]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MaterialsForOrder]
AS
SELECT        MaterialID, StoreID, Stock, IsActive, Height, Width, Notes, MaterialType
FROM            (SELECT DISTINCT MS.MaterialID, MS.StoreID, MS.StockOnHand AS Stock, MS.IsActive, M.Height, M.Width, 'Good Material' AS Notes, 'Material' AS MaterialType
                          FROM            dbo.MaterialInStock AS MS INNER JOIN
                                                    dbo.Materials AS M ON MS.MaterialID = M.ID
                          WHERE        (MS.IsActive = 1)
                          UNION
                          SELECT DISTINCT MaterialID, StoreID, Quantity AS Stock, IsActive, Height, Width, Notes, 'CuttingList' AS MaterialType
                          FROM            dbo.CuttingListsMaterials
                          WHERE        (IsActive = 1)
                          UNION
                          SELECT DISTINCT MaterialID, StoreID, Quantity AS Stock, IsActive, Height, Width, Notes, 'DeadMaterial' AS MaterialType
                          FROM            dbo.DeadMaterials
                          WHERE        (IsActive = 1)) AS t



GO
/****** Object:  View [dbo].[OrderDetailsData]    Script Date: 3/28/2020 1:04:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderDetailsData]
AS
SELECT        dbo.Customers.CustomerName, dbo.Units.UnitName, dbo.Materials.MaterialNo, dbo.Materials.MaterialName, dbo.OrderDetails.Quantity, dbo.OrderDetails.Height, dbo.OrderDetails.Width, dbo.Orders.ID, 
                         dbo.Orders.OrderDate, dbo.Orders.UserName, dbo.Orders.Notes, dbo.Stores.StoreName, dbo.OrderDetails.Notes AS ItemNotes
FROM            dbo.OrderDetails INNER JOIN
                         dbo.Materials ON dbo.OrderDetails.MaterialID = dbo.Materials.ID INNER JOIN
                         dbo.Orders ON dbo.OrderDetails.OrderID = dbo.Orders.ID INNER JOIN
                         dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID INNER JOIN
                         dbo.Stores ON dbo.OrderDetails.StoreID = dbo.Stores.ID INNER JOIN
                         dbo.Units ON dbo.Materials.UnitID = dbo.Units.ID
WHERE        (dbo.OrderDetails.IsActive = 1)

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'940B4467-16EF-410C-B977-EBA3D0E3D569', N'Management')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'BB6EA78F-F97B-4C84-96F1-1CB51136808E', N'sales')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'048A771A-BBFB-44DE-9139-66572E98962C', N'StoreMan')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1CE88F01-2639-4C37-B952-983A047CB2B0', N'StoreManager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1aa2d59c-b2a9-47e1-9194-bccf010cadf9', N'940B4467-16EF-410C-B977-EBA3D0E3D569')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f0a795c-3d60-4db3-acc2-b1261d92b317', N'940B4467-16EF-410C-B977-EBA3D0E3D569')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1aa2d59c-b2a9-47e1-9194-bccf010cadf9', NULL, 0, N'AC1dvLGEWHtohb5Q9qMuGcOhDeJ4Ys6aRi8ZM6L6NT+E6hynLBVpKQ9m/xYLFfZ+Gg==', N'a3369d82-7b85-41ed-879f-1b1f65e8f323', NULL, 0, 0, NULL, 0, 0, N'Michael')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2f0a795c-3d60-4db3-acc2-b1261d92b317', NULL, 0, N'AC1y6ThxSLz7CBilCRZbHSAJK+qt7pXKArH8t+9v28Hlpjq+yVbVMBK1Ex+YOtkDFg==', N'62cc9b89-ea6e-44b0-adbf-d59d2d2436c0', NULL, 0, 0, NULL, 0, 0, N'MichaelMalak')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoruID], [CategoryName]) VALUES (1, N'Curtains')
INSERT [dbo].[Category] ([CategoruID], [CategoryName]) VALUES (2, N'test Category')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Container] ON 

INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (1, 202012, N'Description 1', CAST(N'2020-03-28 12:04:43.917' AS DateTime), N'MichaelMalak', N'No Notes Added')
INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (2, 2020111, N'Desc 111', CAST(N'2020-03-28 12:09:24.913' AS DateTime), N'MichaelMalak', N'No Notes Added')
INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (3, 2020211, N'Desc 111', CAST(N'2020-03-28 12:11:01.403' AS DateTime), N'MichaelMalak', N'No Notes Added')
INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (4, 202013, N'desc', CAST(N'2020-03-28 12:18:42.937' AS DateTime), N'MichaelMalak', N'No Notes Added')
INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (5, 202014, N'desc 14', CAST(N'2020-03-28 12:37:58.887' AS DateTime), N'', N'No Notes Added')
INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (6, 202015, N'Desc 11t', CAST(N'2020-03-28 12:51:25.547' AS DateTime), N'', N'Notes 223')
INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (7, 202016, N'desc 16', CAST(N'2020-03-28 12:57:02.333' AS DateTime), N'', N'No Notes Added')
INSERT [dbo].[Container] ([ID], [CNumber], [CDescription], [CDate], [CUser], [Notes]) VALUES (8, 202017, N'125', CAST(N'2020-03-28 12:58:31.637' AS DateTime), N'', N'No Notes Added')
SET IDENTITY_INSERT [dbo].[Container] OFF
SET IDENTITY_INSERT [dbo].[ContainerData] ON 

INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (1, 4, 6, 1, NULL, N'Note item 1', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (2, 5, 6, 1, CAST(5.00 AS Decimal(18, 2)), N'note1', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (3, 6, 6, 1, CAST(3.00 AS Decimal(18, 2)), N'No Notes Added For item', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (4, 6, 6, 1, CAST(5.00 AS Decimal(18, 2)), N'No Notes Added For item', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (5, 6, 6, 1, CAST(6.00 AS Decimal(18, 2)), N'No Notes Added For item', 0)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (6, 7, 6, 1, CAST(5.00 AS Decimal(18, 2)), N'No Notes Added For item', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (7, 7, 6, 1, CAST(6.00 AS Decimal(18, 2)), N'No Notes Added For item', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (8, 7, 6, 1, CAST(7.00 AS Decimal(18, 2)), N'No Notes Added For item', 0)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (9, 8, 6, 1, CAST(5.00 AS Decimal(18, 2)), N'No Notes Added For item', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (10, 8, 6, 1, CAST(4.00 AS Decimal(18, 2)), N'No Notes Added For item', 1)
INSERT [dbo].[ContainerData] ([ID], [ContainerID], [MaterialID], [StoreID], [Quantity], [Notes], [IsActive]) VALUES (11, 8, 6, 1, CAST(7.00 AS Decimal(18, 2)), N'No Notes Added For item', 0)
SET IDENTITY_INSERT [dbo].[ContainerData] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [EmailAddress], [CreationDate], [CreationUser], [PhoneNumber], [IsActive], [IsLocked], [CreditLimitAmount], [ContactPerson], [CustomerNumber]) VALUES (1, N'Michael', N'shrouk', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [EmailAddress], [CreationDate], [CreationUser], [PhoneNumber], [IsActive], [IsLocked], [CreditLimitAmount], [ContactPerson], [CustomerNumber]) VALUES (2, N'Monica Ghaly', N'', N'', CAST(N'2020-03-19' AS Date), N'', NULL, 0, 0, 0, N'', 2)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[CuttingListsMaterials] ON 

INSERT [dbo].[CuttingListsMaterials] ([ID], [MaterialID], [StoreID], [Notes], [ActionDate], [Height], [Width], [UnitID], [Quantity], [UserName], [IsActive]) VALUES (1, 1, 1, N'Noted 12* 10 Meter for Order number ', CAST(N'2020-03-18 10:44:26.003' AS DateTime), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 2, CAST(0.00 AS Decimal(18, 2)), N'', 1)
INSERT [dbo].[CuttingListsMaterials] ([ID], [MaterialID], [StoreID], [Notes], [ActionDate], [Height], [Width], [UnitID], [Quantity], [UserName], [IsActive]) VALUES (2, 2, 1, N'1222', CAST(N'2020-03-18 11:05:51.787' AS DateTime), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, CAST(4.00 AS Decimal(18, 2)), N'', 1)
INSERT [dbo].[CuttingListsMaterials] ([ID], [MaterialID], [StoreID], [Notes], [ActionDate], [Height], [Width], [UnitID], [Quantity], [UserName], [IsActive]) VALUES (3, 2, 1, N'12223365', CAST(N'2020-03-21 09:42:08.493' AS DateTime), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2, CAST(0.00 AS Decimal(18, 2)), N'', 1)
INSERT [dbo].[CuttingListsMaterials] ([ID], [MaterialID], [StoreID], [Notes], [ActionDate], [Height], [Width], [UnitID], [Quantity], [UserName], [IsActive]) VALUES (4, 2, 1, N'Note Defective Material Test', CAST(N'2020-03-22 20:29:09.040' AS DateTime), CAST(33.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 2, CAST(22.00 AS Decimal(18, 2)), N'Michael', 1)
SET IDENTITY_INSERT [dbo].[CuttingListsMaterials] OFF
SET IDENTITY_INSERT [dbo].[DeadMaterials] ON 

INSERT [dbo].[DeadMaterials] ([ID], [MaterialID], [StoreID], [Notes], [ActionDate], [Height], [Width], [UnitID], [Quantity], [UserName], [IsActive]) VALUES (1, 2, 1, N'12222', CAST(N'2020-03-22 20:15:43.513' AS DateTime), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 2, CAST(3.00 AS Decimal(18, 2)), N'', 1)
SET IDENTITY_INSERT [dbo].[DeadMaterials] OFF
SET IDENTITY_INSERT [dbo].[Logger] ON 

INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (1, N'new Category (  Curtains ) is added ', N'', CAST(N'2020-03-16 13:10:36.257' AS DateTime), N'New Category')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (2, N'New SubCategory  ( Curtains 1 )  is added ', N'', CAST(N'2020-03-16 13:10:44.787' AS DateTime), N'New SubCategory')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (3, N'New Unit ( LM ) added Successfully', N'', CAST(N'2020-03-16 13:10:51.787' AS DateTime), N'New Unit')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (4, N'New Unit ( CM ) added Successfully', N'', CAST(N'2020-03-16 13:10:56.560' AS DateTime), N'New Unit')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (5, N'New Unit ( CubicMeter ) added Successfully', N'', CAST(N'2020-03-16 13:11:02.837' AS DateTime), N'New Unit')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (6, N'New Supplier  Created Successfully', N'', CAST(N'2020-03-16 13:11:20.950' AS DateTime), N'New Supplier')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (7, N'new Category (  test Category ) is added ', N'', CAST(N'2020-03-18 11:04:50.297' AS DateTime), N'New Category')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (8, N'New SubCategory  ( test2 )  is added ', N'', CAST(N'2020-03-18 11:04:57.123' AS DateTime), N'New SubCategory')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (9, N'New Order 1 is now created ', N'', CAST(N'2020-03-19 10:45:03.540' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (10, N'CuttingList Material (Code1 ) , The Stock changed from 23.00 to 22.00', N'', CAST(N'2020-03-19 10:45:33.277' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (11, N'CuttingList Material (Code1 ) , The Stock changed from 22.00 to 18.00', N'', CAST(N'2020-03-19 10:45:40.730' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (12, N'New Order 2 is now created ', N'', CAST(N'2020-03-19 10:54:50.123' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (13, N' Material Order (Code1 ) , The Stock changed from 12.00 to 10.00 For Customer Michael', N'', CAST(N'2020-03-19 10:55:00.830' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (14, N'New Order 3 is now created ', N'', CAST(N'2020-03-19 11:12:49.627' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (15, N'CuttingList Material (Code1 ) , The Stock changed from 18.00 to 16.00', N'', CAST(N'2020-03-19 11:12:59.117' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (16, N'CuttingList Material (Code1 ) , The Stock changed from 16.00 to 14.00', N'', CAST(N'2020-03-19 11:13:16.333' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (17, N'New Order 4 is now created ', N'', CAST(N'2020-03-19 11:15:02.683' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (18, N'New Order 5 is now created ', N'', CAST(N'2020-03-19 11:16:01.010' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (19, N'New Order 6 is now created ', N'', CAST(N'2020-03-19 11:16:53.353' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (20, N'New Order 7 is now created ', N'', CAST(N'2020-03-19 11:21:22.277' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (21, N' Material Order (michaelfinal11 ) , The Stock changed from 1.00 to 0.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-19 11:21:33.707' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (22, N'New Order 8 is now created ', N'', CAST(N'2020-03-19 11:24:54.413' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (23, N' Material Order (Code1 ) , The Stock changed from 10.00 to 8.00 For Customer Michael', N'', CAST(N'2020-03-19 11:25:07.933' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (24, N'New Order 9 is now created ', N'', CAST(N'2020-03-19 11:26:06.187' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (25, N' Material Order (Code1 ) , The Stock changed from 8.00 to 7.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-19 11:26:21.727' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (26, N'New Order 10 is now created ', N'', CAST(N'2020-03-19 12:47:06.633' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (27, N' Material Order (Code1 ) , The Stock changed from 7.00 to 6.00 For Customer Michael', N'', CAST(N'2020-03-19 12:47:16.910' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (28, N'New Order 11 is now created ', N'', CAST(N'2020-03-19 12:50:25.107' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (29, N'New Order 12 is now created ', N'', CAST(N'2020-03-19 12:51:42.873' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (30, N' Material Order (Code1 ) , The Stock changed from 6.00 to 5.00 For Customer Michael', N'', CAST(N'2020-03-19 12:51:54.983' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (31, N'New Order 13 is now created ', N'', CAST(N'2020-03-19 13:32:08.487' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (32, N' Material Order (Code1 ) , The Stock changed from 5.00 to 4.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-19 13:32:21.960' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (33, N'New Order 14 is now created ', N'', CAST(N'2020-03-19 13:33:55.673' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (34, N' Material Order (Code1 ) , The Stock changed from 4.00 to 3.00 For Customer Michael', N'', CAST(N'2020-03-19 13:34:05.460' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (35, N' Material Order (Code1 ) , The Stock changed from 3.00 to 2.00 For Customer Michael', N'', CAST(N'2020-03-19 13:34:48.690' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (36, N'New Order 15 is now created ', N'', CAST(N'2020-03-19 13:35:52.803' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (37, N' Material Order (Code1 ) , The Stock changed from 2.00 to 1.00 For Customer Michael', N'', CAST(N'2020-03-19 13:36:01.327' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (38, N'New Order 16 is now created ', N'', CAST(N'2020-03-19 13:42:08.063' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (39, N' Material Order (Code1 ) , The Stock changed from 1.00 to 0.00 For Customer Michael', N'', CAST(N'2020-03-19 13:42:17.500' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (40, N'New Order 17 is now created ', N'', CAST(N'2020-03-19 14:25:37.923' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (41, N'CuttingList Material (Code1 ) , The Stock changed from 14.00 to 13.00', N'', CAST(N'2020-03-19 14:25:49.943' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (42, N'New Order 18 is now created ', N'', CAST(N'2020-03-19 14:27:21.547' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (43, N'New Order 19 is now created ', N'', CAST(N'2020-03-19 14:32:53.673' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (44, N'New Order 20 is now created ', N'', CAST(N'2020-03-19 14:33:31.607' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (45, N'CuttingList Material (Code1 ) , The Stock changed from 13.00 to 12.00', N'', CAST(N'2020-03-19 14:33:51.407' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (46, N'New Order 21 is now created ', N'', CAST(N'2020-03-19 15:33:20.987' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (47, N'New Order 22 is now created ', N'', CAST(N'2020-03-19 15:33:21.113' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (48, N'CuttingList Material (Code1 ) , The Stock changed from 12.00 to 11.00', N'', CAST(N'2020-03-19 15:33:32.917' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (49, N'New Order 23 is now created ', N'', CAST(N'2020-03-19 15:36:37.547' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (50, N'CuttingList Material (Code1 ) , The Stock changed from 11.00 to 10.00', N'', CAST(N'2020-03-19 15:36:45.853' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (51, N'CuttingList Material (Code1 ) , The Stock changed from 10.00 to 8.00', N'', CAST(N'2020-03-19 15:45:22.897' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (52, N'CuttingList Material (Code1 ) , The Stock changed from 8.00 to 7.00', N'', CAST(N'2020-03-19 15:45:50.330' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (53, N'New Order 24 is now created ', N'', CAST(N'2020-03-19 16:14:58.583' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (54, N'CuttingList Material (Code1 ) , The Stock changed from 7.00 to 5.00', N'', CAST(N'2020-03-19 16:15:09.790' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (55, N'New Order 25 is now created ', N'', CAST(N'2020-03-19 16:15:49.107' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (56, N'CuttingList Material (Code1 ) , The Stock changed from 5.00 to 4.00', N'', CAST(N'2020-03-19 16:15:58.943' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (57, N'New Order 26 is now created ', N'', CAST(N'2020-03-19 16:22:26.113' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (58, N'CuttingList Material (Code1 ) , The Stock changed from 4.00 to 3.00', N'', CAST(N'2020-03-19 16:22:34.667' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (59, N'New Order 27 is now created ', N'', CAST(N'2020-03-21 10:01:32.567' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (60, N'CuttingList Material (Code1 ) , The Stock changed from 3.00 to 2.00', N'', CAST(N'2020-03-21 10:02:15.550' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (61, N'New Order 28 is now created ', N'', CAST(N'2020-03-21 10:03:46.933' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (62, N'CuttingList Material (Code1 ) , The Stock changed from 2.00 to 0.00', N'', CAST(N'2020-03-21 10:04:04.757' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (63, N'New Order 29 is now created ', N'', CAST(N'2020-03-21 10:05:14.407' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (64, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 2.00 to 1.00', N'', CAST(N'2020-03-21 10:05:27.417' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (65, N'New Order 30 is now created ', N'', CAST(N'2020-03-21 10:36:38.413' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (66, N'New Order 31 is now created ', N'', CAST(N'2020-03-21 11:22:10.187' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (67, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 1.00 to 0.00', N'', CAST(N'2020-03-21 11:22:28.037' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (68, N'New Order 32 is now created ', N'', CAST(N'2020-03-21 11:23:23.253' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (69, N'New Order 33 is now created ', N'', CAST(N'2020-03-21 11:25:22.863' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (70, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 1.00 to 0.00', N'', CAST(N'2020-03-21 11:25:39.027' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (71, N'New Order 34 is now created ', N'', CAST(N'2020-03-21 11:27:05.190' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (72, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 5.00 to 3.00', N'', CAST(N'2020-03-21 11:27:16.097' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (73, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 34', N'', CAST(N'2020-03-21 11:27:59.237' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (74, N'New Order 35 is now created ', N'', CAST(N'2020-03-21 11:30:08.927' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (75, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 5.00 to 2.00', N'', CAST(N'2020-03-21 11:30:20.513' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (76, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 35', N'', CAST(N'2020-03-21 11:30:22.780' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (77, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 35', N'', CAST(N'2020-03-21 11:30:44.273' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (78, N'New Order 36 is now created ', N'', CAST(N'2020-03-21 11:32:22.063' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (79, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 8.00 to 6.00', N'', CAST(N'2020-03-21 11:32:33.033' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (80, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 36', N'', CAST(N'2020-03-21 11:32:35.730' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (81, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 36', N'', CAST(N'2020-03-21 11:32:40.647' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (82, N'New Order 37 is now created ', N'', CAST(N'2020-03-21 11:36:31.257' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (83, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 10.00 to 9.00', N'', CAST(N'2020-03-21 11:36:41.837' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (84, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 37', N'', CAST(N'2020-03-21 11:36:44.770' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (85, N'New Order 38 is now created ', N'', CAST(N'2020-03-21 11:38:50.880' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (86, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 10.00 to 8.00', N'', CAST(N'2020-03-21 11:39:01.107' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (87, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 38', N'', CAST(N'2020-03-21 11:39:03.807' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (88, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 10.00 to 9.00', N'', CAST(N'2020-03-21 11:39:16.823' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (89, N'Return of Cutting List of Material michaelfinal11 In store Shrouk from Order 38', N'', CAST(N'2020-03-21 11:39:19.043' AS DateTime), N'CuttingList Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (90, N'New Order 39 is now created ', N'', CAST(N'2020-03-21 21:27:32.283' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (91, N' Material Order (Code1 ) , The Stock changed from 5.00 to 3.00 For Customer Michael', N'', CAST(N'2020-03-21 21:27:56.267' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (92, N'Return of Cutting List of Material ( Code1 ) In store ( Shrouk ) from Order  ( 39 )', N'', CAST(N'2020-03-21 21:28:12.450' AS DateTime), N'Material Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (93, N'New Order 40 is now created ', N'', CAST(N'2020-03-22 08:19:10.977' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (94, N' Material Order ( Code2323 ) , The Stock changed from 12.00 to 10.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-22 08:19:28.640' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (95, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 10.00 to 5.00', N'', CAST(N'2020-03-22 08:19:44.283' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (96, N' Material Order (michaelfinal11 ) , The Stock changed from 20.00 to 18.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-22 08:19:51.047' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (97, N'CuttingList Material (Code1 ) , The Stock changed from 5.00 to 3.00', N'', CAST(N'2020-03-22 08:20:04.923' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (98, N'New Order 41 is now created ', N'Michael', CAST(N'2020-03-22 09:57:28.117' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (99, N' Material Order ( Code2323 ) , The Stock changed from 10.00 to 8.00 For Customer Michael', N'Michael', CAST(N'2020-03-22 09:57:57.773' AS DateTime), N'CuttingList Order')
GO
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (100, N' Material Order ( Code2323 ) , The Stock changed from 8.00 to 7.00 For Customer Michael', N'Michael', CAST(N'2020-03-22 09:58:05.657' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (101, N'CuttingList Material (Code1 ) , The Stock changed from 3.00 to 0.00', N'Michael', CAST(N'2020-03-22 09:58:21.023' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (102, N' Material Order (Code1 ) , The Stock changed from 5.00 to 3.00 For Customer Michael', N'Michael', CAST(N'2020-03-22 09:58:36.007' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (103, N' Material Order (michaelfinal11 ) , The Stock changed from 18.00 to 14.00 For Customer Michael', N'Michael', CAST(N'2020-03-22 09:58:54.387' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (104, N'CuttingList Material (michaelfinal11 ) , The Stock changed from 5.00 to 4.00', N'Michael', CAST(N'2020-03-22 09:59:01.570' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (105, N'New Order 42 is now created ', N'', CAST(N'2020-03-22 11:30:15.233' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (106, N' Material Order (Code1 ) , The Stock changed from 3.00 to 2.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-22 11:30:38.743' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (107, N'New Order 43 is now created ', N'Michael', CAST(N'2020-03-22 13:54:00.090' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (108, N'New Order 44 is now created ', N'', CAST(N'2020-03-22 14:03:26.543' AS DateTime), N'Order Creation')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (109, N' Material Order (Code1 ) , The Stock changed from 2.00 to 1.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-22 14:03:47.483' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (110, N' Material Order (michaelfinal11 ) , The Stock changed from 14.00 to 10.00 For Customer Monica Ghaly', N'', CAST(N'2020-03-22 14:04:15.953' AS DateTime), N'CuttingList Order')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (111, N'Material White curtains Stock is now increased From 12.00 To 17.00', N'', CAST(N'2020-03-28 12:38:21.530' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (112, N'Material White curtains Stock is now increased From 17.00 To 20.00', N'', CAST(N'2020-03-28 12:51:35.460' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (113, N'Material White curtains Stock is now increased From 20.00 To 25.00', N'', CAST(N'2020-03-28 12:51:43.130' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (114, N'Material White curtains Stock is now increased From 25.00 To 31.00', N'', CAST(N'2020-03-28 12:51:48.123' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (115, N'Material White curtains Stock is now increased From 31.00 To 25.00', N'', CAST(N'2020-03-28 12:51:50.373' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (116, N'Material White curtains Stock is now increased From 25.00 To 30.00', N'', CAST(N'2020-03-28 12:57:15.623' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (117, N'Material White curtains Stock is now increased From 30.00 To 36.00', N'', CAST(N'2020-03-28 12:57:20.357' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (118, N'Material White curtains Stock is now increased From 36.00 To 43.00', N'', CAST(N'2020-03-28 12:57:24.487' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (119, N'Material White curtains Stock is now increased From 43.00 To 36.00', N'', CAST(N'2020-03-28 12:57:26.730' AS DateTime), N'Item Addition Return')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (120, N'Material White curtains Stock is now increased From 36.00 To 41.00', N'', CAST(N'2020-03-28 12:58:41.157' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (121, N'Material White curtains Stock is now increased From 41.00 To 45.00', N'', CAST(N'2020-03-28 12:58:47.280' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (122, N'Material White curtains Stock is now increased From 45.00 To 52.00', N'', CAST(N'2020-03-28 12:58:50.557' AS DateTime), N'Item Addition')
INSERT [dbo].[Logger] ([LogID], [Action], [UserName], [ActionDate], [ActionType]) VALUES (123, N'Material White curtains Stock is now increased From 52.00 To 45.00', N'', CAST(N'2020-03-28 12:58:53.160' AS DateTime), N'Item Addition Return')
SET IDENTITY_INSERT [dbo].[Logger] OFF
SET IDENTITY_INSERT [dbo].[MaterialHistory] ON 

INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (1, CAST(N'2020-03-27 12:58:28.217' AS DateTime), N'MichaelMalak', N'Initial Stock', CAST(0.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'Material White curtains is now created in Store 1', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (2, CAST(N'2020-03-28 12:38:21.663' AS DateTime), N'', N'Addition', CAST(12.00 AS Decimal(18, 2)), CAST(17.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container System.Web.UI.WebControls.Label', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (3, CAST(N'2020-03-28 12:51:35.510' AS DateTime), N'', N'Addition', CAST(17.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 6', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (4, CAST(N'2020-03-28 12:51:43.183' AS DateTime), N'', N'Addition', CAST(20.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 6', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (5, CAST(N'2020-03-28 12:51:48.160' AS DateTime), N'', N'Addition', CAST(25.00 AS Decimal(18, 2)), CAST(31.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 6', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (6, CAST(N'2020-03-28 12:51:50.397' AS DateTime), N'', N'Addition', CAST(31.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), N'Material White curtains stock decreased in Container 6', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (7, CAST(N'2020-03-28 12:57:15.653' AS DateTime), N'', N'Addition', CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 7', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (8, CAST(N'2020-03-28 12:57:20.407' AS DateTime), N'', N'Addition', CAST(30.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 7', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (9, CAST(N'2020-03-28 12:57:24.550' AS DateTime), N'', N'Addition', CAST(36.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 7', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (10, CAST(N'2020-03-28 12:57:26.737' AS DateTime), N'', N'Addition Return', CAST(43.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), N'Material White curtains stock decreased in Container 7', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (11, CAST(N'2020-03-28 12:58:41.210' AS DateTime), N'', N'Addition', CAST(36.00 AS Decimal(18, 2)), CAST(41.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 8', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (12, CAST(N'2020-03-28 12:58:47.303' AS DateTime), N'', N'Addition', CAST(41.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 8', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (13, CAST(N'2020-03-28 12:58:50.583' AS DateTime), N'', N'Addition', CAST(45.00 AS Decimal(18, 2)), CAST(52.00 AS Decimal(18, 2)), N'Material White curtains stock increased in Container 8', 6, 1)
INSERT [dbo].[MaterialHistory] ([ID], [ActionDate], [UserName], [TransactionName], [OldStock], [NewStock], [Note], [MaterialID], [StoreID]) VALUES (14, CAST(N'2020-03-28 12:58:53.170' AS DateTime), N'', N'Addition Return', CAST(52.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), N'Material White curtains stock decreased in Container 8', 6, 1)
SET IDENTITY_INSERT [dbo].[MaterialHistory] OFF
SET IDENTITY_INSERT [dbo].[MaterialInStock] ON 

INSERT [dbo].[MaterialInStock] ([ID], [MaterialID], [StoreID], [CurrencyID], [StockOnHand], [SafetyStock], [CreationDate], [CreationUser], [IsActive], [LastReceiptDate], [LastSalesDate], [OpeningStock], [Location], [ReservedStock], [LastOrderDate], [UnitID], [Supplier]) VALUES (1, 1, 1, NULL, CAST(1.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(N'2020-03-16 14:32:06.690' AS DateTime), N'', 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), N'1222', CAST(0.00 AS Decimal(18, 2)), NULL, 2, 1)
INSERT [dbo].[MaterialInStock] ([ID], [MaterialID], [StoreID], [CurrencyID], [StockOnHand], [SafetyStock], [CreationDate], [CreationUser], [IsActive], [LastReceiptDate], [LastSalesDate], [OpeningStock], [Location], [ReservedStock], [LastOrderDate], [UnitID], [Supplier]) VALUES (2, 2, 1, NULL, CAST(10.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(N'2020-03-18 11:05:37.873' AS DateTime), N'', 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), N'12', CAST(0.00 AS Decimal(18, 2)), NULL, 3, 1)
INSERT [dbo].[MaterialInStock] ([ID], [MaterialID], [StoreID], [CurrencyID], [StockOnHand], [SafetyStock], [CreationDate], [CreationUser], [IsActive], [LastReceiptDate], [LastSalesDate], [OpeningStock], [Location], [ReservedStock], [LastOrderDate], [UnitID], [Supplier]) VALUES (3, 3, 1, NULL, CAST(7.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(N'2020-03-21 11:55:14.127' AS DateTime), N'', 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), N'1222', CAST(0.00 AS Decimal(18, 2)), NULL, 2, 1)
INSERT [dbo].[MaterialInStock] ([ID], [MaterialID], [StoreID], [CurrencyID], [StockOnHand], [SafetyStock], [CreationDate], [CreationUser], [IsActive], [LastReceiptDate], [LastSalesDate], [OpeningStock], [Location], [ReservedStock], [LastOrderDate], [UnitID], [Supplier]) VALUES (4, 5, 1, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-26 09:36:28.123' AS DateTime), N'MichaelMalak', 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), N'', CAST(0.00 AS Decimal(18, 2)), NULL, 2, 1)
INSERT [dbo].[MaterialInStock] ([ID], [MaterialID], [StoreID], [CurrencyID], [StockOnHand], [SafetyStock], [CreationDate], [CreationUser], [IsActive], [LastReceiptDate], [LastSalesDate], [OpeningStock], [Location], [ReservedStock], [LastOrderDate], [UnitID], [Supplier]) VALUES (5, 6, 1, NULL, CAST(45.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), CAST(N'2020-03-27 12:58:12.007' AS DateTime), N'MichaelMalak', 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), N'122', CAST(0.00 AS Decimal(18, 2)), NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[MaterialInStock] OFF
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([MaterialNo], [MaterialName], [Description], [IsActive], [TypeID], [ID], [SupplierID], [UnitID], [Height], [Width], [imagepath]) VALUES (N'Code1', N'Code1', NULL, 1, 1, 1, 1, 2, NULL, NULL, N'Uploads/383361.jpg')
INSERT [dbo].[Materials] ([MaterialNo], [MaterialName], [Description], [IsActive], [TypeID], [ID], [SupplierID], [UnitID], [Height], [Width], [imagepath]) VALUES (N'Code2', N'michaelfinal11', NULL, 1, 2, 2, 1, 3, NULL, NULL, N'Uploads/favicon.ico')
INSERT [dbo].[Materials] ([MaterialNo], [MaterialName], [Description], [IsActive], [TypeID], [ID], [SupplierID], [UnitID], [Height], [Width], [imagepath]) VALUES (N'test', N' Code2323', NULL, 1, 1, 3, 1, 2, NULL, NULL, N'Uploads/index.jpg')
INSERT [dbo].[Materials] ([MaterialNo], [MaterialName], [Description], [IsActive], [TypeID], [ID], [SupplierID], [UnitID], [Height], [Width], [imagepath]) VALUES (N'1222', N'12222', NULL, 1, 1, 4, 1, 3, NULL, NULL, N'Uploads/Add.png')
INSERT [dbo].[Materials] ([MaterialNo], [MaterialName], [Description], [IsActive], [TypeID], [ID], [SupplierID], [UnitID], [Height], [Width], [imagepath]) VALUES (N'12345', N'michaeltesthh', NULL, 1, 1, 5, 1, 2, NULL, NULL, N'Uploads/20130216_152607.jpg')
INSERT [dbo].[Materials] ([MaterialNo], [MaterialName], [Description], [IsActive], [TypeID], [ID], [SupplierID], [UnitID], [Height], [Width], [imagepath]) VALUES (N'12345121', N'White curtains', NULL, 1, 1, 6, 1, 2, NULL, NULL, N'Uploads/')
INSERT [dbo].[Materials] ([MaterialNo], [MaterialName], [Description], [IsActive], [TypeID], [ID], [SupplierID], [UnitID], [Height], [Width], [imagepath]) VALUES (N'1212122', N'121212121111', NULL, 1, 1, 7, 1, 2, NULL, NULL, N'Uploads/20130216_152607.jpg')
SET IDENTITY_INSERT [dbo].[Materials] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (1, 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (2, 1, 1, CAST(4.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (3, 2, 1, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (4, 3, 1, CAST(2.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (5, 3, 1, CAST(2.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (6, 7, 2, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (7, 8, 1, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (8, 9, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (9, 10, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (10, 12, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (11, 13, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (12, 14, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (13, 14, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (14, 15, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (15, 16, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (16, 17, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (17, 20, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (18, 22, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (19, 23, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (20, 23, 1, CAST(2.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (21, 23, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (22, 24, 1, CAST(2.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (23, 25, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (24, 26, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (25, 27, 1, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (26, 28, 1, CAST(2.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (27, 29, 2, CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (28, 31, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (29, 33, 2, CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (30, 34, 2, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (31, 35, 2, CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (32, 36, 2, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (33, 37, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (34, 38, 2, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (35, 38, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (36, 39, 1, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (37, 40, 3, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (38, 40, 2, CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (39, 40, 2, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (40, 40, 1, CAST(2.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (41, 41, 3, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (43, 41, 1, CAST(3.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (46, 41, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'CuttingList', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (47, 42, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (48, 44, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, N'')
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [MaterialID], [Quantity], [Height], [Width], [IsActive], [MaterialType], [StoreID], [Notes]) VALUES (49, 44, 2, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'Material', 1, N'باقى 2 متر من 4 متر ')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (1, 0, 1, CAST(N'2020-03-19 10:45:00.930' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (2, 0, 1, CAST(N'2020-03-19 10:54:47.647' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (3, 0, 1, CAST(N'2020-03-19 11:12:47.127' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (4, 0, 1, CAST(N'2020-03-19 11:15:02.670' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (5, 0, 1, CAST(N'2020-03-19 11:16:01.003' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (6, 0, 1, CAST(N'2020-03-19 11:16:53.347' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (7, 0, 2, CAST(N'2020-03-19 11:21:19.760' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (8, 0, 1, CAST(N'2020-03-19 11:24:51.727' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (9, 0, 2, CAST(N'2020-03-19 11:26:06.177' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (10, 0, 1, CAST(N'2020-03-19 12:47:03.953' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (11, 0, 1, CAST(N'2020-03-19 12:50:25.097' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (12, 0, 1, CAST(N'2020-03-19 12:51:42.863' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (13, 0, 2, CAST(N'2020-03-19 13:32:08.470' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (14, 0, 1, CAST(N'2020-03-19 13:33:55.663' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (15, 0, 1, CAST(N'2020-03-19 13:35:52.793' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (16, 0, 1, CAST(N'2020-03-19 13:42:08.047' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (17, 0, 1, CAST(N'2020-03-19 14:25:35.260' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (18, 0, 1, CAST(N'2020-03-19 14:27:21.537' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (19, 0, 1, CAST(N'2020-03-19 14:32:53.660' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (20, 0, 1, CAST(N'2020-03-19 14:33:31.597' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (21, 0, 1, CAST(N'2020-03-19 15:33:18.400' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (22, 0, 1, CAST(N'2020-03-19 15:33:21.110' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (23, 0, 1, CAST(N'2020-03-19 15:36:37.537' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (24, 0, 1, CAST(N'2020-03-19 16:14:56.063' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (25, 0, 1, CAST(N'2020-03-19 16:15:49.097' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (26, 0, 1, CAST(N'2020-03-19 16:22:26.097' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (27, 0, 1, CAST(N'2020-03-21 10:01:29.983' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (28, 0, 1, CAST(N'2020-03-21 10:03:46.923' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (29, 0, 2, CAST(N'2020-03-21 10:05:14.400' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (30, 0, 1, CAST(N'2020-03-21 10:36:38.397' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (31, 0, 2, CAST(N'2020-03-21 11:22:07.110' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (32, 0, 2, CAST(N'2020-03-21 11:23:23.243' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (33, 0, 1, CAST(N'2020-03-21 11:25:22.093' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (34, 0, 2, CAST(N'2020-03-21 11:27:02.247' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (35, 0, 1, CAST(N'2020-03-21 11:30:06.450' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (36, 0, 1, CAST(N'2020-03-21 11:32:22.053' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (37, 0, 2, CAST(N'2020-03-21 11:36:28.697' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (38, 0, 1, CAST(N'2020-03-21 11:38:48.323' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (39, 0, 1, CAST(N'2020-03-21 21:27:27.593' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (40, 0, 2, CAST(N'2020-03-22 08:19:09.703' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (41, 0, 1, CAST(N'2020-03-22 09:57:27.017' AS DateTime), N'Monica Ghaly', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (42, 0, 2, CAST(N'2020-03-22 11:30:09.777' AS DateTime), N'', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (43, 0, 2, CAST(N'2020-03-22 13:53:59.377' AS DateTime), N'Michael', N'', 1)
INSERT [dbo].[Orders] ([ID], [OrderNo], [CustomerID], [OrderDate], [UserName], [Notes], [IsActive]) VALUES (44, 0, 2, CAST(N'2020-03-22 14:03:24.580' AS DateTime), N'Michael ', N'', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[StockLogger] ON 

INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (1, 2, CAST(12.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(N'2020-03-18 11:11:39.180' AS DateTime), N'', NULL)
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (2, 1, CAST(12.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 10:55:00.633' AS DateTime), N'', N'Order Number 2   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (3, 2, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 11:21:33.553' AS DateTime), N'', N'Order Number 7   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (4, 1, CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 11:25:07.793' AS DateTime), N'', N'Order Number 8   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (5, 1, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 11:26:21.717' AS DateTime), N'', N'Order Number 9   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (6, 1, CAST(7.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 12:47:16.763' AS DateTime), N'', N'Order Number 10   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (7, 1, CAST(6.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 12:51:54.957' AS DateTime), N'', N'Order Number 12   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (8, 1, CAST(5.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 13:32:21.953' AS DateTime), N'', N'Order Number 13   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (9, 1, CAST(4.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 13:34:05.453' AS DateTime), N'', N'Order Number 14   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (10, 1, CAST(3.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 13:34:48.683' AS DateTime), N'', N'Order Number 14   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (11, 1, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 13:36:01.320' AS DateTime), N'', N'Order Number 15   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (12, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-19 13:42:17.490' AS DateTime), N'', N'Order Number 16   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (13, 1, CAST(5.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-21 21:27:55.877' AS DateTime), N'', N'Order Number 39   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (14, 1, CAST(3.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-21 21:28:12.447' AS DateTime), N'', N'Return of Cutting List of Material ( Code1 ) In store ( Shrouk ) from Order  ( 39 )')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (15, 3, CAST(12.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 08:19:28.390' AS DateTime), N'', N'Order Number 40   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (16, 2, CAST(20.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 08:19:51.017' AS DateTime), N'', N'Order Number 40   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (17, 3, CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 09:57:57.633' AS DateTime), N'Michael', N'Order Number 41   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (18, 3, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 09:58:05.633' AS DateTime), N'Michael', N'Order Number 41   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (19, 1, CAST(5.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 09:58:35.980' AS DateTime), N'Michael', N'Order Number 41   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (20, 2, CAST(18.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 09:58:54.333' AS DateTime), N'Michael', N'Order Number 41   For Customer Michael')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (21, 1, CAST(3.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 11:30:38.523' AS DateTime), N'', N'Order Number 42   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (22, 1, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 14:03:47.367' AS DateTime), N'', N'Order Number 44   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (23, 2, CAST(14.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-22 14:04:15.807' AS DateTime), N'', N'Order Number 44   For Customer Monica Ghaly')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (24, 5, CAST(12.00 AS Decimal(18, 2)), CAST(17.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:38:21.610' AS DateTime), N'', N'Material White curtains stock increased in Container System.Web.UI.WebControls.Label')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (25, 5, CAST(17.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:51:35.483' AS DateTime), N'', N'Material White curtains stock increased in Container 6')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (26, 5, CAST(20.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:51:43.150' AS DateTime), N'', N'Material White curtains stock increased in Container 6')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (27, 5, CAST(25.00 AS Decimal(18, 2)), CAST(31.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:51:48.150' AS DateTime), N'', N'Material White curtains stock increased in Container 6')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (28, 5, CAST(31.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:51:50.390' AS DateTime), N'', N'Material White curtains stock decreased in Container 6')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (29, 5, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:57:15.637' AS DateTime), N'', N'Material White curtains stock increased in Container 7')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (30, 5, CAST(30.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:57:20.383' AS DateTime), N'', N'Material White curtains stock increased in Container 7')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (31, 5, CAST(36.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:57:24.533' AS DateTime), N'', N'Material White curtains stock increased in Container 7')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (32, 5, CAST(43.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:57:26.733' AS DateTime), N'', N'Material White curtains stock decreased in Container 7')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (33, 5, CAST(36.00 AS Decimal(18, 2)), CAST(41.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:58:41.187' AS DateTime), N'', N'Material White curtains stock increased in Container 8')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (34, 5, CAST(41.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:58:47.297' AS DateTime), N'', N'Material White curtains stock increased in Container 8')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (35, 5, CAST(45.00 AS Decimal(18, 2)), CAST(52.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:58:50.577' AS DateTime), N'', N'Material White curtains stock increased in Container 8')
INSERT [dbo].[StockLogger] ([ID], [MaterialInStock], [OldStock], [NewStock], [OldReservedStock], [NewReservedStock], [OldSafetyStock], [newSafetyStock], [ActionDate], [UserName], [Notes]) VALUES (36, 5, CAST(52.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(N'2020-03-28 12:58:53.163' AS DateTime), N'', N'Material White curtains stock decreased in Container 8')
SET IDENTITY_INSERT [dbo].[StockLogger] OFF
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([ID], [StoreNumber], [StoreLocation], [StoreName], [ContactPerson], [PhoneNumber], [IsActive]) VALUES (1, 1, N'Shrouk', N'Shrouk', N'Michael', 120, 1)
SET IDENTITY_INSERT [dbo].[Stores] OFF
SET IDENTITY_INSERT [dbo].[SubCategories] ON 

INSERT [dbo].[SubCategories] ([ID], [SubCategoryName], [CategoryID]) VALUES (1, N'Curtains 1', 1)
INSERT [dbo].[SubCategories] ([ID], [SubCategoryName], [CategoryID]) VALUES (2, N'test2', 2)
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [Name], [Country], [ContactPerson], [EmailAddress], [PhoneNumber], [Address], [IsActive], [Rate]) VALUES (1, N'Phito', N'', N'', N'', NULL, N'', 1, NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([ID], [TC], [Serial]) VALUES (1, N'Internal', 1000)
INSERT [dbo].[Transactions] ([ID], [TC], [Serial]) VALUES (2, N'Transfer', 5000)
INSERT [dbo].[Transactions] ([ID], [TC], [Serial]) VALUES (3, N'Addition', 30000)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([ID], [UnitName], [UnitSymbol]) VALUES (1, N'LM', NULL)
INSERT [dbo].[Units] ([ID], [UnitName], [UnitSymbol]) VALUES (2, N'CM', NULL)
INSERT [dbo].[Units] ([ID], [UnitName], [UnitSymbol]) VALUES (3, N'CubicMeter', NULL)
SET IDENTITY_INSERT [dbo].[Units] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/28/2020 1:04:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 3/28/2020 1:04:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 3/28/2020 1:04:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 3/28/2020 1:04:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 3/28/2020 1:04:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/28/2020 1:04:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ContainerData]  WITH CHECK ADD  CONSTRAINT [FK_ContainerData_Container] FOREIGN KEY([ContainerID])
REFERENCES [dbo].[Container] ([ID])
GO
ALTER TABLE [dbo].[ContainerData] CHECK CONSTRAINT [FK_ContainerData_Container]
GO
ALTER TABLE [dbo].[ContainerData]  WITH CHECK ADD  CONSTRAINT [FK_ContainerData_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[ContainerData] CHECK CONSTRAINT [FK_ContainerData_Materials]
GO
ALTER TABLE [dbo].[ContainerData]  WITH CHECK ADD  CONSTRAINT [FK_ContainerData_Stores] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[ContainerData] CHECK CONSTRAINT [FK_ContainerData_Stores]
GO
ALTER TABLE [dbo].[CuttingListsMaterials]  WITH CHECK ADD  CONSTRAINT [FK_DefectiveMaterials_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[CuttingListsMaterials] CHECK CONSTRAINT [FK_DefectiveMaterials_Materials]
GO
ALTER TABLE [dbo].[CuttingListsMaterials]  WITH CHECK ADD  CONSTRAINT [FK_DefectiveMaterials_Stores] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[CuttingListsMaterials] CHECK CONSTRAINT [FK_DefectiveMaterials_Stores]
GO
ALTER TABLE [dbo].[CuttingListsMaterials]  WITH CHECK ADD  CONSTRAINT [FK_DefectiveMaterials_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[CuttingListsMaterials] CHECK CONSTRAINT [FK_DefectiveMaterials_Units]
GO
ALTER TABLE [dbo].[DeadMaterials]  WITH CHECK ADD  CONSTRAINT [FK_DeadMaterials_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[DeadMaterials] CHECK CONSTRAINT [FK_DeadMaterials_Materials]
GO
ALTER TABLE [dbo].[DeadMaterials]  WITH CHECK ADD  CONSTRAINT [FK_DeadMaterials_Stores] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[DeadMaterials] CHECK CONSTRAINT [FK_DeadMaterials_Stores]
GO
ALTER TABLE [dbo].[DeadMaterials]  WITH CHECK ADD  CONSTRAINT [FK_DeadMaterials_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[DeadMaterials] CHECK CONSTRAINT [FK_DeadMaterials_Units]
GO
ALTER TABLE [dbo].[MaterialHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialHistory_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[MaterialHistory] CHECK CONSTRAINT [FK_MaterialHistory_Materials]
GO
ALTER TABLE [dbo].[MaterialHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialHistory_Stores] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[MaterialHistory] CHECK CONSTRAINT [FK_MaterialHistory_Stores]
GO
ALTER TABLE [dbo].[MaterialInStock]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInStock_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currency] ([CurrencyID])
GO
ALTER TABLE [dbo].[MaterialInStock] CHECK CONSTRAINT [FK_MaterialInStock_Currency]
GO
ALTER TABLE [dbo].[MaterialInStock]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInStock_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[MaterialInStock] CHECK CONSTRAINT [FK_MaterialInStock_Materials]
GO
ALTER TABLE [dbo].[MaterialInStock]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInStock_Stores] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[MaterialInStock] CHECK CONSTRAINT [FK_MaterialInStock_Stores]
GO
ALTER TABLE [dbo].[MaterialInStock]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInStock_Supplier] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[MaterialInStock] CHECK CONSTRAINT [FK_MaterialInStock_Supplier]
GO
ALTER TABLE [dbo].[MaterialInStock]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInStock_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MaterialInStock] CHECK CONSTRAINT [FK_MaterialInStock_Units]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Materials] FOREIGN KEY([ID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Materials]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_SubCategories] FOREIGN KEY([TypeID])
REFERENCES [dbo].[SubCategories] ([ID])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_SubCategories]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Supplier]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Units]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Materials]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Stores] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Stores]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
ALTER TABLE [dbo].[ReservedMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ReservedMaterials_MaterialInStock] FOREIGN KEY([MaterialInStock])
REFERENCES [dbo].[MaterialInStock] ([ID])
GO
ALTER TABLE [dbo].[ReservedMaterials] CHECK CONSTRAINT [FK_ReservedMaterials_MaterialInStock]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
ALTER TABLE [dbo].[StockLogger]  WITH CHECK ADD  CONSTRAINT [FK_StockLogger_MaterialInStock] FOREIGN KEY([MaterialInStock])
REFERENCES [dbo].[MaterialInStock] ([ID])
GO
ALTER TABLE [dbo].[StockLogger] CHECK CONSTRAINT [FK_StockLogger_MaterialInStock]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_SubCategories_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoruID])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_SubCategories_Category]
GO
ALTER TABLE [dbo].[TransferDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransferDetails_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[TransferDetails] CHECK CONSTRAINT [FK_TransferDetails_Materials]
GO
ALTER TABLE [dbo].[TransferDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransferDetails_Transfers] FOREIGN KEY([TransferID])
REFERENCES [dbo].[Transfers] ([ID])
GO
ALTER TABLE [dbo].[TransferDetails] CHECK CONSTRAINT [FK_TransferDetails_Transfers]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfers_Stores] FOREIGN KEY([FromStore])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfers_Stores]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfers_Stores1] FOREIGN KEY([ToStore])
REFERENCES [dbo].[Stores] ([ID])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfers_Stores1]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfers_Transfers] FOREIGN KEY([ID])
REFERENCES [dbo].[Transfers] ([ID])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfers_Transfers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail]    Script Date: 3/28/2020 1:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbo].[OrderDetail]
 as
 Select * from MaterialInStock MS inner join Materials M on MS.MaterialID = M.ID

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MaterialsForOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MaterialsForOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 6
               Left = 476
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Materials"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 136
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 684
               Bottom = 136
               Right = 854
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stores"
            Begin Extent = 
               Top = 6
               Left = 892
               Bottom = 136
               Right = 1062
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Units"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderDetailsData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderDetailsData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderDetailsData'
GO
USE [master]
GO
ALTER DATABASE [SmartShutter] SET  READ_WRITE 
GO
