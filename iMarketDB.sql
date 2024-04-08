Create Database iMarketDB
Go

Use iMarketDB
Go


--------------------------------------------- CREATE TABLE ---------------------------------------------
--------------- ROLES TABLE
Create Table Roles
(
	RoleID		Int Not Null Identity(1, 1),
	RoleName	Nvarchar(255),
	Description	Nvarchar(MAX),
	Constraint PK_Roles Primary Key(RoleID)
);

--------------- STAFFS TABLE
Create Table Accounts
(
	AccountID	Int Not Null Identity(1, 1),
	PhoneNumber	Varchar(10),
	Email		Varchar(50),
	Password	Varchar(50),
	Salt		Nchar(10),
	Active		Bit,
	FullName	Nvarchar(150),
	LastLogin	Datetime,
	DateCreated	Datetime,	
	RoleID		Int,
	Constraint PK_Accounts Primary Key(AccountID)
);

--------------- LOCATIONS TABLE
Create Table Locations
(
	LocationID		Int Not Null Identity(1, 1),
	Name			Nvarchar(100),
	Type			Nvarchar(20),
	Slug			Nvarchar(100),
	NameWithType	Nvarchar(255),
	PathWithType	Nvarchar(255),
	ParentCode		Int,
	Levels			Int,
	Constraint PK_Locations Primary Key(LocationID)
);

--------------- CUSTOMERS TABLE
Create Table Customers
(
	CustomerID	Int Not Null Identity(1, 1),
	FullName	Nvarchar(150),
	Birthday	Date,
	Avatar		Varchar(255),
	Address		Nvarchar(255),
	Email		Varchar(50),
	PhoneNumber	Varchar(10),
	District	Int,
	Ward		Int,
	DateCreated	Datetime,	
	Password	Varchar(50),
	Salt		Nchar(10),
	Active		Bit,
	LastLogin	Datetime,
	LocationID	Int,
	Constraint PK_Customers Primary Key(CustomerID)
);

--------------- CATEGORIES TABLE
Create Table Categories
(
	CategoryID		Int Not Null Identity(1, 1),
	CategoryName	Nvarchar(255),
	Description		Nvarchar(MAX),
	ParentID		Int,
	Levels			Int,
	Ordering		Int,
	Published		Bit,
	Thumbnail		Varchar(255),
	Title			Nvarchar(255),	
	Alias			Nvarchar(255),
	MetaDesc		Nvarchar(255),
	MetaKey			Nvarchar(255),
	Cover			Varchar(255),
	SchemaMarkup	Nvarchar(MAX),
	Constraint PK_Categories Primary Key(CategoryID)
);

--------------- PRODUCTS TABLE
Create Table Products
(
	ProductID		Int Not Null Identity(1, 1),
	ProductName		Nvarchar(255),
	ShortDesc		Nvarchar(255),
	Description		Nvarchar(MAX),
	UnitPrice		Decimal(18, 0),
	Discount		Int,
	Thumbnail		Nvarchar(255),
	Video			Nvarchar(255),
	DateCreated		Datetime,
	DateModified	Datetime,
	BestSellers		Bit,
	HomeFlag		Bit,
	Active			Bit,
	Tags			Nvarchar(MAX),
	Title			Nvarchar(255),
	Alias			Nvarchar(255),
	MetaDesc		Nvarchar(255),
	MetaKey			Nvarchar(255),
	UnitsInStock	Int,
	CategoryID		Int,
	Constraint PK_Products Primary Key(ProductID)
);

--------------- TRANSACTSTATUS TABLE
Create Table TransactStatus
(
	TransactStatusID	Int Not Null Identity(1, 1),
	Status				Nvarchar(50),
	Description			Nvarchar(MAX),
	Constraint PK_TransactStatus Primary Key(TransactStatusID)
);

--------------- ORDERS TABLE
Create Table Orders
(
	OrderID				Int Not Null Identity(1, 1),
	CustomerID			Int,
	OrderDate			Datetime,
	ShipDate			Datetime,
	TransactStatusID	Int,
	Deleted				Bit,
	Paid				Bit,
	PaymentDate			Datetime,
	Note				Nvarchar(MAX),	
	PaymentID			Int,
	Constraint PK_Orders Primary Key(OrderID)
);

--------------- ORDERDETAILS TABLE
Create Table OrderDetails
(
	OrderDetailID		Int Not Null Identity(1, 1),
	OrderID				Int,
	ProductID			Int,
	OrderNumber			Int,
	Quantity			Int,
	Discount			Int,
	Total				Decimal(18, 0),
	ShipDate			Datetime,
	Constraint PK_OrderDetails Primary Key(OrderDetailID)
);


--------------- POSTS TABLE
Create Table Posts
(
	PostID			Int Not Null Identity(1, 1),
	Title			Nvarchar(255),
	ShortContents	Nvarchar(255),
	Contents		Nvarchar(255),
	Thumbnail		Varchar(255),
	Published		Bit,
	Alias			Nvarchar(255),
	CreatedDate		Datetime,
	Author			Nvarchar(255),
	AccountID		Int,
	Tags			Nvarchar(MAX),
	CategoryID		Int,
	IsHot			Bit,
	IsNewFeed		Bit,
	MetaDecs		Nvarchar(255),	
	MetaKey			Nvarchar(255),
	Views			Int,
	Constraint PK_Posts Primary Key(PostID)
);

--------------- PAGES TABLE
Create Table Pages
(
	PageID		Int Not Null Identity(1, 1),
	PageName	Nvarchar(255),
	Contents	Nvarchar(MAX),
	Thumbnail	Varchar(255),
	Published	Bit,
	Title		Nvarchar(255),
	MetaDesc	Nvarchar(255),
	MetaKey		Nvarchar(255),
	Alias		Nvarchar(255),
	CreatedAt	DateTime,
	Ordering	Int,
	Constraint PK_Pages Primary Key(PageID)
);

--------------- SHIPPERS TABLE
Create Table Shippers
(
	ShipperID	Int Not Null Identity(1, 1),
	ShipperName	Nvarchar(150),
	PhoneNumber	Varchar(10),
	Company		Nvarchar(150),
	ShipDate	Datetime,
	Constraint PK_Shippers Primary Key(ShipperID)
);

--------------------------------------- CREATE CONSTRAINTS FOR DATA TABLES ---------------------------------------
--------------- CREATE A FOREIGN KEY FOR THE PRODUCTS TABLE
Alter Table Products
Add Constraint FK_Products_Categories Foreign Key(CategoryID) References Categories(CategoryID)

--------------- CREATE A FOREIGN KEY FOR THE ACCOUNTS TABLE
Alter Table Accounts
Add Constraint FK_Accounts_Roles Foreign Key(RoleID) References Roles(RoleID)

--------------- CREATE A FOREIGN KEY FOR THE CUSTOMERS TABLE
Alter Table Customers
Add Constraint FK_Customers_Locations Foreign Key(LocationID) References Locations(LocationID)

--------------- CREATE A FOREIGN KEY FOR THE POSTS TABLE
Alter Table Posts
Add Constraint FK_Posts_Accounts Foreign Key(AccountID) References Accounts(AccountID),
	Constraint FK_Posts_Categories Foreign Key(CategoryID) References Categories(CategoryID)

--------------- CREATE A FOREIGN KEY FOR THE ORDERS TABLE
Alter Table Orders
Add Constraint FK_Orders_TransactStatus Foreign Key(TransactStatusID) References TransactStatus(TransactStatusID),
	Constraint FK_Orders_Customers Foreign Key(CustomerID) References Customers(CustomerID)

--------------- CREATE A FOREIGN KEY FOR THE ORDERDETAILS TABLE
Alter Table OrderDetails
Add Constraint FK_OrderDetails_Orders Foreign Key(OrderID) References Orders(OrderID),
	Constraint FK_OrderDetails_Products Foreign Key(ProductID) References Products(ProductID)
