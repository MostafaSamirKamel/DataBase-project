USE [finalprojectsection]
GO
/****** Object:  Schema [production]    Script Date: 12/23/2023 9:36:47 PM ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 12/23/2023 9:36:47 PM ******/
CREATE SCHEMA [sales]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](25) NULL,
	[ZipCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Position] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[StoreID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[RequiredDate] [date] NOT NULL,
	[ShippedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[BrandID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Size] [varchar](10) NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 12/23/2023 9:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](10) NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK__Stores__3B82F0E19CFE826D] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1, N'Nike')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (2, N'Adidas')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (3, N'Levi''s')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (4, N'Puma')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (5, N'New Balance')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (6, N'Reebok')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (7, N'Under Armour')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (8, N'Vans')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (9, N'Reebok')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (10, N'Converse')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (11, N'Puma')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (12, N'New Balance')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (13, N'Fila')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'T-Shirts')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Jeans')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Sneakers')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Hoodies')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Sweatpants')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Jackets')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (7, N'Running Shoes')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (8, N'Hats')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (9, N'Sandals')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (10, N'Socks')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (11, N'Backpacks')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (12, N'Hoodies')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (13, N'Sunglasses')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (1, N'John', N'Doe', N'john.doe@example.com', N'123-456-7890', N'123 Main St', N'CityA', N'StateA', N'12345')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (2, N'Jane', N'Smith', N'jane.smith@example.com', N'987-654-3210', N'456 Oak St', N'CityB', N'StateB', N'54321')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (3, N'Mary', N'Johnson', N'mary.johnson@example.com', N'555-123-7890', N'789 Oak St', N'CityC', N'StateC', N'67890')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (4, N'Michael', N'Williams', N'michael.williams@example.com', N'777-888-9999', N'101 Pine St', N'CityD', N'StateD', N'11223')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (5, N'David', N'Anderson', N'david.anderson@example.com', N'123-555-7890', N'456 Pine St', N'CityF', N'StateF', N'56789')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (6, N'Susan', N'Miller', N'susan.miller@example.com', N'444-777-8888', N'789 Oak St', N'CityG', N'StateG', N'98765')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (7, N'Robert', N'Johnson', N'robert.johnson@example.com', N'555-222-3333', N'789 Pine St', N'CityJ', N'StateJ', N'34567')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (8, N'Emily', N'Davis', N'emily.davis@example.com', N'111-444-5555', N'101 Oak St', N'CityK', N'StateK', N'87654')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (9, N'Sarah', N'Brown', N'sarah.brown@example.com', N'333-555-7777', N'321 Oak St', N'CityN', N'StateN', N'45678')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (10, N'James', N'Taylor', N'james.taylor@example.com', N'555-888-9999', N'654 Pine St', N'CityO', N'StateO', N'76543')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (11, N'Michael', N'Johnson', N'michael.johnson@example.com', N'333-555-9999', N'543 Oak St', N'CityR', N'StateR', N'98765')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (12, N'Amy', N'Martin', N'amy.martin@example.com', N'111-888-7777', N'876 Pine St', N'CityS', N'StateS', N'12345')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (1, N'ManagerA', N'LastNameA', N'managerA@example.com', N'111-222-3333', N'Store Manager')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (2, N'StaffB', N'LastNameB', N'staffB@example.com', N'444-555-6666', N'Sales Associate')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (3, N'StaffC', N'LastNameC', N'staffC@example.com', N'333-444-5555', N'Sales Associate')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (4, N'ManagerB', N'LastNameD', N'managerB@example.com', N'555-666-7777', N'Store Manager')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (5, N'StaffD', N'LastNameE', N'staffD@example.com', N'888-999-0000', N'Sales Associate')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (6, N'StaffE', N'LastNameF', N'staffE@example.com', N'333-666-7777', N'Sales Associate')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (7, N'ManagerC', N'LastNameG', N'managerC@example.com', N'777-888-9999', N'Store Manager')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (8, N'StaffG', N'LastNameH', N'staffG@example.com', N'777-000-1111', N'Sales Associate')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (9, N'ManagerD', N'LastNameI', N'managerD@example.com', N'111-222-3333', N'Store Manager')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (10, N'StaffI', N'LastNameJ', N'staffI@example.com', N'666-777-8888', N'Sales Associate')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Position]) VALUES (11, N'ManagerE', N'LastNameK', N'managerE@example.com', N'222-333-4444', N'Store Manager')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (1, 1, 100)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (1, 2, 40)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (1, 3, 20)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (2, 1, 50)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (2, 2, 50)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (2, 3, 30)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (3, 3, 15)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (3, 5, 40)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (4, 7, 30)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (4, 9, 15)
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (5, 11, 25)
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (1, 1, 1, 2, CAST(19.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (2, 1, 2, 1, CAST(49.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (3, 2, 3, 3, CAST(79.99 AS Decimal(10, 2)), CAST(0.15 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (4, 2, 1, 2, CAST(19.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (6, 3, 2, 2, CAST(49.99 AS Decimal(10, 2)), CAST(0.08 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (7, 3, 4, 1, CAST(89.99 AS Decimal(10, 2)), CAST(0.12 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (8, 4, 4, 2, CAST(29.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (9, 4, 6, 1, CAST(59.99 AS Decimal(10, 2)), CAST(0.09 AS Decimal(4, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (10, 5, 8, 2, CAST(14.99 AS Decimal(10, 2)), CAST(0.06 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (1, 1, 1, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-05' AS Date), CAST(N'2023-01-03' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (2, 2, 1, CAST(N'2023-02-01' AS Date), CAST(N'2023-02-05' AS Date), CAST(N'2023-02-03' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (3, 1, 1, CAST(N'2023-03-01' AS Date), CAST(N'2023-03-05' AS Date), CAST(N'2023-03-03' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (4, 2, 1, CAST(N'2023-04-01' AS Date), CAST(N'2023-04-05' AS Date), CAST(N'2023-04-03' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (5, 3, 1, CAST(N'2023-05-01' AS Date), CAST(N'2023-05-05' AS Date), CAST(N'2023-05-03' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (6, 4, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-06-05' AS Date), CAST(N'2023-06-03' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (7, 5, 1, CAST(N'2023-07-01' AS Date), CAST(N'2023-07-05' AS Date), CAST(N'2023-07-03' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (1, N'Cotton T-Shirt', 1, 1, N'Male', N'M', N'White', CAST(19.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (2, N'Slim Fit Jeans', 3, 2, N'Male', N'32x34', N'Blue', CAST(49.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (3, N'Running Shoes', 2, 3, N'Female', N'7', N'Pink', CAST(79.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (4, N'Fleece Hoodie', 1, 4, N'Unisex', N'M', N'Black', CAST(39.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (5, N'Jogger Pants', 2, 5, N'Unisex', N'34x32', N'Gray', CAST(29.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (6, N'Winter Jacket', 3, 6, N'Unisex', N'L', N'Black', CAST(99.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (7, N'Walking Shoes', 4, 3, N'Male', N'9', N'Gray', CAST(69.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (8, N'Snapback Cap', 5, 7, N'Unisex', N'One Size', N'Red', CAST(24.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (9, N'Slide Sandals', 6, 8, N'Female', N'8', N'Blue', CAST(34.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (10, N'Ankle Socks', 7, 9, N'Unisex', N'One Size', N'Black', CAST(9.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (11, N'Laptop Backpack', 8, 10, N'Unisex', N'One Size', N'Gray', CAST(29.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (12, N'Zip-Up Hoodie', 9, 11, N'Unisex', N'M', N'Gray', CAST(44.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (13, N'Sport Sunglasses', 10, 12, N'Unisex', N'One Size', N'Black', CAST(29.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (1, N'StoreA', N'111-222-3333', N'storeA@example.com', N'789 Broadway', N'CityA', N'StateA', 1)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (2, N'StoreB', N'444-555-6666', N'storeB@example.com', N'456 Elm St', N'CityB', N'StateB', 2)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (3, N'StoreC', N'999-000-1111', N'storeC@example.com', N'321 Maple St', N'CityE', N'StateE', 3)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (4, N'StoreD', N'123-456-7890', N'storeD@example.com', N'987 Oak St', N'CityH', N'StateH', 4)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (5, N'StoreE', N'789-012-3456', N'storeE@example.com', N'654 Elm St', N'CityI', N'StateI', 5)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (6, N'StoreF', N'222-333-4444', N'storeF@example.com', N'567 Maple St', N'CityL', N'StateL', 6)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (7, N'StoreG', N'987-654-3210', N'storeG@example.com', N'789 Elm St', N'CityM', N'StateM', 7)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (8, N'StoreH', N'444-555-6666', N'storeH@example.com', N'987 Pine St', N'CityP', N'StateP', 8)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (9, N'StoreI', N'123-789-0123', N'storeI@example.com', N'345 Elm St', N'CityQ', N'StateQ', 9)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (10, N'StoreJ', N'555-444-3333', N'storeJ@example.com', N'789 Maple St', N'CityT', N'StateT', 10)
INSERT [dbo].[Stores] ([StoreID], [StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (11, N'StoreK', N'333-789-0123', N'storeK@example.com', N'654 Pine St', N'CityU', N'StateU', 11)
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK__Inventory__Store__49C3F6B7] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([StoreID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK__Inventory__Store__49C3F6B7]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Stores_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Stores_Employees]
GO
