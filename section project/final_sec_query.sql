-- Insert data into [dbo].[Brands]
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Puma')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Reebok')

-- Insert data into [dbo].[Categories]
INSERT [dbo].[Categories] ([CategoryName]) VALUES (N'Hats')
INSERT [dbo].[Categories] ([CategoryName]) VALUES (N'Socks')

-- Insert data into [dbo].[Customers]
INSERT [dbo].[Customers] ([FirstName], [LastName], [Email], [Phone], [Address], [City], [State], [ZipCode]) VALUES (N'Mary', N'Johnson', N'mary.j@example.com', N'555-123-4567', N'789 Oak St', N'CityC', N'StateC', N'54321')

-- Insert data into [dbo].[Employees]
INSERT [dbo].[Employees] ([FirstName], [LastName], [Email], [Phone], [Position]) VALUES (N'EmployeeC', N'LastNameC', N'employeeC@example.com', N'777-888-9999', N'Sales Associate')

-- Insert data into [dbo].[Inventory]
INSERT [dbo].[Inventory] ([StoreID], [ProductID], [Quantity]) VALUES (2, 3, 30)

-- Insert data into [dbo].[OrderItems]
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (2, 1, 2, CAST(29.99 AS Decimal(10, 2)), CAST(0.08 AS Decimal(4, 2)))

-- Insert data into [dbo].[Orders]
INSERT [dbo].[Orders] ([CustomerID], [OrderStatus], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (3, 1, CAST(N'2023-03-01' AS Date), CAST(N'2023-03-05' AS Date), CAST(N'2023-03-03' AS Date))

-- Insert data into [dbo].[Products]
INSERT [dbo].[Products] ([ProductName], [BrandID], [CategoryID], [Gender], [Size], [Color], [Price]) VALUES (N'Running Hat', 1, 4, N'Unisex', N'One Size', N'Black', CAST(14.99 AS Decimal(10, 2)))

-- Insert data into [dbo].[Stores]
INSERT [dbo].[Stores] ([StoreName], [Phone], [Email], [Address], [City], [State], [EmployeeID]) VALUES (N'StoreC', N'333-444-5555', N'storeC@example.com', N'123 Pine St', N'CityC', N'StateC', 3)


-----------------------------------------
--Update customer information:
UPDATE [dbo].[Customers] SET [Phone] = N'555-123-4567' WHERE [CustomerID] = 1

--Update employee position:
UPDATE [dbo].[Employees] SET [Position] = N'Senior Sales Associate' WHERE [EmployeeID] = 2

--Update product price:
UPDATE [dbo].[Products] SET [Price] = 39.99 WHERE [ProductID] = 1

--Update order status:
UPDATE [dbo].[Orders] SET [OrderStatus] = 2 WHERE [OrderID] = 1

--Update store email:
UPDATE [dbo].[Stores] SET [Email] = N'newemail@storeA.com' WHERE [StoreID] = 1

-----------------------------------------------------------------------------------

--Delete a specific customer:
DELETE FROM [dbo].[Customers] WHERE [CustomerID] = 1


--Delete an employee by ID:
DELETE FROM [dbo].[Employees] WHERE [EmployeeID] = 2


--Delete a product by ID:
DELETE FROM [dbo].[Products] WHERE [ProductID] = 1


--Delete an order by ID:
DELETE FROM [dbo].[Orders] WHERE [OrderID] = 1


--Delete a store by ID:
DELETE FROM [dbo].[Stores] WHERE [StoreID] = 1

----------------------------------------------------------

--Add a new column to the "Customers" table:
ALTER TABLE [dbo].[Customers] ADD [DateOfBirth] DATE


--Modify the data type of the "Price" column in the "Products" table:
ALTER TABLE [dbo].[Products] ALTER COLUMN [Price] DECIMAL(12, 2)


--Rename the "CategoryName" column in the "Categories" table:
EXEC sp_rename 'dbo.Categories.CategoryName', 'CategoryType', 'COLUMN'

--Add a foreign key constraint to the "OrderItems" table:
ALTER TABLE [dbo].[OrderItems] ADD CONSTRAINT FK_OrderItems_Products FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID]) ON DELETE CASCADE


--Add a unique constraint to the "Email" column in the "Employees" table:
ALTER TABLE [dbo].[Employees] ADD CONSTRAINT UQ_Employees_Email UNIQUE ([Email])

-----------------------------------------------------------------

--Drop the "DateOfBirth" column from the "Customers" table:
ALTER TABLE [dbo].[Customers] DROP COLUMN [DateOfBirth]


--Remove the foreign key constraint from the "OrderItems" table:
ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT FK_OrderItems_Products


--Drop the "BrandName" column from the "Brands" table:
ALTER TABLE [dbo].[Brands] DROP COLUMN [BrandName]


--Remove the unique constraint from the "Email" column in the "Employees" table:
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT UQ_Employees_Email


--Drop the entire "Categories" table:
DROP TABLE [dbo].[Categories]