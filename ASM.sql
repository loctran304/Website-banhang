create database PS23034_ASM


select * from products where [CategoryId]='1004'

drop database PS23034_ASM
use PS23034_ASM
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NULL,
	[Admin] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Categories]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]


ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE



GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'test1', N'12345', N'Tran Minh Loc', N'loctmps23034@fpt.edu.vn', N'user.png', 1, 1)


INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ALFKI', N'alfki', N'Maria Anders', N'alfki@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ANATR', N'anatr', N'Ana Trujillo', N'anatr@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ANTON', N'anton', N'Antonio Moreno', N'anton@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'AROUT', N'arout', N'Thomas Hardy', N'arout@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BERGS', N'bergs', N'Christina Berglund', N'bergs@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BLAUS', N'blaus', N'Hanna Moos', N'blaus@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BLONP', N'blonp', N'Frédérique Citeaux', N'blonp@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BOLID', N'bolid', N'Martín Sommer', N'bolid@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BONAP', N'bonap', N'Laurence Lebihan', N'bonap@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BOTTM', N'bottm', N'Elizabeth Lincoln', N'bottm@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BSBEV', N'bsbev', N'Victoria Ashworth', N'bsbev@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CACTU', N'cactu', N'Patricio Simpson', N'cactu@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CENTC', N'centc', N'Francisco Chang', N'centc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CHOPS', N'chops', N'Yang Wang', N'chops@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'COMMI', N'commi', N'Pedro Afonso', N'commi@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CONSH', N'consh', N'Elizabeth Brown', N'consh@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'customer', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'director', N'123', N'Nguyễn Chí Phèo', N'pheonc@fpt.edu.vn', N'-1407968806.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'DRACD', N'dracd', N'Sven Ottlieb', N'dracd@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'DUMON', N'dumon', N'Janine Labrune', N'dumon@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'EASTC', N'eastc', N'Ann Devon', N'eastc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ERNSH', N'ernsh', N'Roland Mendel', N'ernsh@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FAMIA', N'famia', N'Aria Cruz', N'famia@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FISSA', N'fissa', N'Diego Roel', N'fissa@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FOLIG', N'folig', N'Martine Rancé', N'folig@gmail.com', N'user.png', 0, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FOLKO', N'folko', N'Maria Larsson', N'folko@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FRANK', N'frank', N'Peter Franken', N'frank@gmail.com', N'user.png', 0, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FRANR', N'franr', N'Carine Schmitt', N'franr@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FRANS', N'frans', N'Paolo Accorti', N'frans@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FURIB', N'furib', N'Lino Rodriguez', N'furib@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GALED', N'galed', N'Eduardo Saavedra', N'galed@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GODOS', N'godos', N'José Pedro Freyre', N'godos@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GOURL', N'gourl', N'André Fonseca', N'gourl@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GREAL', N'greal', N'Howard Snyder', N'greal@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GROSR', N'grosr', N'Manuel Pereira', N'grosr@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HANAR', N'hanar', N'Mario Pontes', N'hanar@gmail.com', N'user.png', 0, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HILAA', N'hilaa', N'Carlos Hernández', N'hilaa@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HUNGC', N'hungc', N'Yoshi Latimer', N'hungc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HUNGO', N'hungo', N'Patricia McKenna', N'hungo@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ISLAT', N'islat', N'Helen Bennett', N'islat@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'KOENE', N'koene', N'Philip Cramer', N'koene@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LACOR', N'lacor', N'Daniel Tonini', N'lacor@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LAMAI', N'lamai', N'Annette Roulet', N'lamai@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LAUGB', N'laugb', N'Yoshi Tannamuri', N'laugb@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LAZYK', N'lazyk', N'John Steel', N'lazyk@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LEHMS', N'lehms', N'Renate Messner', N'lehms@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LETSS', N'letss', N'Jaime Yorres', N'letss@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LILAS', N'lilas', N'Carlos González', N'lilas@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LINOD', N'linod', N'Felipe Izquierdo', N'linod@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LONEP', N'lonep', N'Fran Wilson', N'lonep@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MAGAA', N'magaa', N'Giovanni Rovelli', N'magaa@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MAISD', N'maisd', N'Catherine Dewey', N'maisd@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MEREP', N'merep', N'Jean Fresnière', N'merep@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MORGK', N'morgk', N'Alexander Feuer', N'morgk@gmail.com', N'user.png', 1, 1)



INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Máy tính xách tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'Máy ảnh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'Điện thoại')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1004', N'Nước bông')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1005', N'Nữ trang')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1006', N'Nón thời trang')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1007', N'Túi xách du lịch')



SET IDENTITY_INSERT [dbo].[OrderDetails] ON 


INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100005, 10242, 1051, 42.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100006, 10250, 1041, 7.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100007, 10250, 1051, 42.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100008, 10250, 1065, 16.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100009, 10254, 1022, 16.8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100010, 10250, 1057, 15.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100011, 10253, 1065, 16.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100012, 10253, 1020, 64.8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100013, 10254, 1033, 2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100014, 10253, 1060, 27.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100015, 10253, 1031, 10, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100016, 10253, 1039, 14.4, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100017, 10253, 1049, 16, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100018, 10254, 1024, 3.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100019, 10254, 1055, 19.2, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100020, 10254, 1074, 8, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100021, 10255, 1002, 15.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100022, 10255, 1016, 13.9, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100023, 10255, 1036, 15.2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100024, 10255, 1059, 44, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100025, 10256, 1053, 26.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100026, 10256, 1077, 10.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100027, 10257, 1027, 35.1, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100028, 10257, 1039, 14.4, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100029, 10257, 1077, 10.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100030, 10258, 1002, 15.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100031, 10258, 1002, 15.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100032, 10258, 1032, 25.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100033, 10259, 1021, 8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100034, 10259, 1037, 20.8, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100035, 10260, 1041, 7.7, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100036, 10260, 1057, 15.6, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100037, 10260, 1062, 39.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100038, 10260, 1070, 12, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100039, 10261, 1021, 8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100040, 10261, 1035, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100041, 10261, 1035, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100042, 10262, 1007, 24, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100043, 10262, 1056, 30.4, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100044, 10263, 1016, 13.9, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100045, 10263, 1024, 3.6, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100046, 10263, 1030, 20.7, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100047, 10263, 1074, 8, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100048, 10264, 1002, 15.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100049, 10264, 1041, 7.7, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100050, 10265, 1017, 31.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100051, 10265, 1070, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100052, 10266, 1012, 30.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100053, 10267, 1040, 14.7, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100054, 10267, 1059, 44, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100055, 10267, 1076, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100056, 10268, 1029, 99, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100058, 10269, 1033, 2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100060, 10270, 1036, 15.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100061, 10270, 1043, 36.8, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100062, 10271, 1033, 2, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100063, 10272, 1020, 64.8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100064, 10272, 1031, 10, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100066, 10273, 1010, 24.8, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100067, 10273, 1031, 10, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100068, 10273, 1033, 2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100069, 10273, 1040, 14.7, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100070, 10273, 1076, 14.4, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100071, 10274, 1071, 17.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100073, 10275, 1024, 3.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100074, 10275, 1059, 44, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100075, 10276, 1010, 24.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100076, 10276, 1013, 4.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100077, 10277, 1028, 36.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100078, 10277, 1062, 39.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100079, 10278, 1044, 15.5, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100080, 10278, 1059, 44, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100081, 10278, 1063, 35.1, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100082, 10278, 1073, 12, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100083, 10279, 1017, 31.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100084, 10280, 1024, 3.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100085, 10280, 1055, 19.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100086, 10280, 1075, 6.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100087, 10281, 1019, 7.3, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100088, 10281, 1024, 3.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100089, 10281, 1035, 14.4, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100090, 10282, 1030, 20.7, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100091, 10282, 1057, 15.6, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100092, 10283, 1015, 12.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100093, 10283, 1019, 7.3, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100094, 10283, 1060, 27.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100096, 10284, 1027, 35.1, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100097, 10284, 1044, 15.5, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100098, 10284, 1060, 27.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100099, 10284, 1067, 11.2, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100100, 10285, 1001, 14.4, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100101, 10285, 1040, 14.7, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100102, 10285, 1053, 26.2, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100103, 10286, 1035, 14.4, 100)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100104, 10286, 1062, 39.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100105, 10287, 1016, 13.9, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100106, 10287, 1034, 11.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100107, 10287, 1046, 9.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100108, 10288, 1054, 5.9, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100109, 10288, 1068, 10, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100110, 10289, 1003, 8, 30)
GO
select * from orderDetails

select * from orders

SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10249, N'TOMSP', CAST(N'1996-07-05T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10250, N'HANAR', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10251, N'HANAR', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10252, N'CHOPS', CAST(N'1996-07-09T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10253, N'HANAR', CAST(N'1996-07-10T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10254, N'CHOPS', CAST(N'1996-07-11T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10255, N'CENTC', CAST(N'1996-07-12T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10256, N'CENTC', CAST(N'1996-07-15T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10257, N'HILAA', CAST(N'1996-07-16T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10258, N'ERNSH', CAST(N'1996-07-17T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10259, N'CENTC', CAST(N'1996-07-18T00:00:00.000' AS DateTime), N'Sierras de Granada 9993')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10260, N'HILAA', CAST(N'1996-07-19T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10261, N'HILAA', CAST(N'1996-07-19T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10262, N'HILAA', CAST(N'1996-07-22T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10263, N'ERNSH', CAST(N'1996-07-23T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10264, N'FOLKO', CAST(N'1996-07-24T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10265, N'BLONP', CAST(N'1996-07-25T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10266, N'BLONP', CAST(N'1996-07-26T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10267, N'FRANK', CAST(N'1996-07-29T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10268, N'GROSR', CAST(N'1996-07-30T00:00:00.000' AS DateTime), N'5ª Ave. Los Palos Grandes')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10269, N'BLONP', CAST(N'1996-07-31T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10270, N'BLONP', CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10271, N'ERNSH', CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10272, N'ERNSH', CAST(N'1996-08-02T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10273, N'ERNSH', CAST(N'1996-08-05T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10274, N'BLONP', CAST(N'1996-08-06T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10275, N'MAGAA', CAST(N'1996-08-07T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10276, N'BLONP', CAST(N'1996-08-08T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10277, N'MORGK', CAST(N'1996-08-09T00:00:00.000' AS DateTime), N'Heerstr. 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10278, N'BERGS', CAST(N'1996-08-12T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10279, N'LEHMS', CAST(N'1996-08-13T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10280, N'BERGS', CAST(N'1996-08-14T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10281, N'FRANK', CAST(N'1996-08-14T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10282, N'FRANK', CAST(N'1996-08-15T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10283, N'FRANK', CAST(N'1996-08-16T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10284, N'LEHMS', CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10285, N'ERNSH', CAST(N'1996-08-20T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10286, N'ERNSH', CAST(N'1996-08-21T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10287, N'ERNSH', CAST(N'1996-08-22T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10288, N'ERNSH', CAST(N'1996-08-23T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10289, N'ERNSH', CAST(N'1996-08-26T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10290, N'COMMI', CAST(N'1996-08-27T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10291, N'ERNSH', CAST(N'1996-08-27T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10292, N'ERNSH', CAST(N'1996-08-28T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10293, N'ERNSH', CAST(N'1996-08-29T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10294, N'ERNSH', CAST(N'1996-08-30T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10295, N'ERNSH', CAST(N'1996-09-02T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10296, N'LILAS', CAST(N'1996-09-03T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10297, N'BLONP', CAST(N'1996-09-04T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10298, N'HUNGO', CAST(N'1996-09-05T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10299, N'LILAS', CAST(N'1996-09-06T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10300, N'MAGAA', CAST(N'1996-09-09T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10301, N'LILAS', CAST(N'1996-09-09T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10302, N'LILAS', CAST(N'1996-09-10T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10303, N'GODOS', CAST(N'1996-09-11T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10304, N'LILAS', CAST(N'1996-09-12T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10305, N'LILAS', CAST(N'1996-09-13T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10306, N'LILAS', CAST(N'1996-09-16T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10307, N'LONEP', CAST(N'1996-09-17T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10308, N'ANATR', CAST(N'1996-09-18T00:00:00.000' AS DateTime), N'Avda. de la Constitución 2222')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10309, N'HUNGO', CAST(N'1996-09-19T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10310, N'LILAS', CAST(N'1996-09-20T00:00:00.000' AS DateTime), N'89 Jefferson Way Suite 2')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10311, N'DUMON', CAST(N'1996-09-20T00:00:00.000' AS DateTime), N'67, rue des Cinquante Otages')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10312, N'LILAS', CAST(N'1996-09-23T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10313, N'LILAS', CAST(N'1996-09-24T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10314, N'LILAS', CAST(N'1996-09-25T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10315, N'ISLAT', CAST(N'1996-09-26T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10316, N'LILAS', CAST(N'1996-09-27T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10317, N'LONEP', CAST(N'1996-09-30T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10318, N'ISLAT', CAST(N'1996-10-01T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10319, N'LILAS', CAST(N'1996-10-02T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10320, N'LILAS', CAST(N'1996-10-03T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10321, N'ISLAT', CAST(N'1996-10-03T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10322, N'LILAS', CAST(N'1996-10-04T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10323, N'KOENE', CAST(N'1996-10-07T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10324, N'LILAS', CAST(N'1996-10-08T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10325, N'KOENE', CAST(N'1996-10-09T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10326, N'BOLID', CAST(N'1996-10-10T00:00:00.000' AS DateTime), N'C/ Araquil, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10327, N'FOLKO', CAST(N'1996-10-11T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10328, N'FURIB', CAST(N'1996-10-14T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10329, N'LILAS', CAST(N'1996-10-15T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10330, N'LILAS', CAST(N'1996-10-16T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10331, N'BONAP', CAST(N'1996-10-16T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10332, N'MEREP', CAST(N'1996-10-17T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10333, N'LILAS', CAST(N'1996-10-18T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10334, N'LILAS', CAST(N'1996-10-21T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10335, N'HUNGO', CAST(N'1996-10-22T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10336, N'LILAS', CAST(N'1996-10-23T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10337, N'FRANK', CAST(N'1996-10-24T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10338, N'LILAS', CAST(N'1996-10-25T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10339, N'MEREP', CAST(N'1996-10-28T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10340, N'BONAP', CAST(N'1996-10-29T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10341, N'LILAS', CAST(N'1996-10-29T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10342, N'FRANK', CAST(N'1996-10-30T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10343, N'LEHMS', CAST(N'1996-10-31T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10344, N'LILAS', CAST(N'1996-11-01T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10345, N'LILAS', CAST(N'1996-11-04T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10346, N'LILAS', CAST(N'1996-11-05T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10347, N'FAMIA', CAST(N'1996-11-06T00:00:00.000' AS DateTime), N'Rua Orós, 92')
GO

SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1001, N'Quartz Belt Watch', N'product1.png', 190, CAST(N'1980-03-29' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1002, N'Women Freshwash', N'product2.png', 19, CAST(N'1982-12-18' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1003, N'Room Flash Light', N'product3.png', 10, CAST(N'1973-06-14' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1004, N'Room Flash Light', N'product4.png', 22, CAST(N'1976-03-10' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1005, N'Man Office Bag', N'product5.png', 21.35, CAST(N'1978-12-06' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1006, N'Charging Car', N'product6.png', 25, CAST(N'1981-09-03' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1007, N'Blutooth Speaker', N'product7.png', 30, CAST(N'1983-03-13' AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1008, N'Charging Car', N'product8.png', 40, CAST(N'1972-02-26' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1009, N'Gray Coffee Cup', N'product-sm-1.png', 97, CAST(N'1985-12-10' AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1010, N'Gray Coffee Cup', N'product-sm-2.png', 31, CAST(N'1994-03-23' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1011, N'Queso Cabrales', N'product-sm-3.png', 21, CAST(N'1985-11-28' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1012, N'Queso Manchego La Pastora', N'product-sm-4.png', 38, CAST(N'1988-08-27' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1013, N'Konbu', N'product-sm-5.png', 6, CAST(N'2002-07-01' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1014, N'Tofu', N'product-sm-6.png', 23.25, CAST(N'2002-06-24' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1015, N'Genen Shouyu', N'product-sm-7.png', 15.5, CAST(N'1991-05-04' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1016, N'Pavlova', N'product-sm-8.png', 17.45, CAST(N'1996-11-09' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1017, N'Alice Mutton', N'product-sm-9.png', 39, CAST(N'2007-12-15' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1018, N'Carnarvon Tigers', N'product1.png', 62.5, CAST(N'2011-04-13' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1019, N'Teatime Chocolate Biscuits', N'product1.png', 9.2, CAST(N'2005-02-02' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1020, N'Sir Rodney''s Marmalade', N'product1.png', 81, CAST(N'2007-11-01' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1021, N'Sir Rodney''s Scones', N'product1.png', 10, CAST(N'2010-07-29' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1022, N'Gustaf flower', N'product1.png', 21, CAST(N'2008-12-01' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1023, N'Tunnbr Korea', N'product1.png', 9, CAST(N'2011-08-31' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1024, N'Guarana¡ Fanta¡stica', N'product1.png', 4.5, CAST(N'2008-03-13' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1025, N'NuNuCa Nuaa-Nougat-Creme', N'product2.png', 14, CAST(N'2011-07-20' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1026, N'Gumbar Gummibarchen', N'product3.png', 31.23, CAST(N'2009-04-17' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1027, N'Schoggi Schokolade', N'product6.png', 43.9, CAST(N'2007-01-14' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1028, N'Russle Sauerkraut', N'product8.png', 45.6, CAST(N'2011-01-14' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1029, N'Tharinger Rostbratwurst', N'product1.png', 123.79, CAST(N'2010-12-21' AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1030, N'Nord-Ost Matjeshering', N'product2.png', 25.89, CAST(N'2011-05-14' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1031, N'Gorgonzola Telino', N'product5.png', 12.5, CAST(N'2010-10-30' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1032, N'Mascarpone Fabioli', N'product3.png', 32, CAST(N'2011-07-30' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1033, N'Geitost', N'product8.png', 2.5, CAST(N'2010-04-29' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1034, N'Sasquatch Ale', N'product3.png', 14, CAST(N'2010-07-30' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1035, N'Steeleye Stout', N'product3.png', 18, CAST(N'2011-04-25' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1036, N'Inlagd Sill', N'product4.png', 19, CAST(N'1980-11-28' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1037, N'Gravad lax', N'product5.png', 26, CAST(N'1983-08-31' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1038, N'Cate de Blaye', N'product7.png', 263.5, CAST(N'1981-07-12' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1039, N'Chartreuse verte', N'product6.png', 18, CAST(N'1984-04-08' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1040, N'Boston Crab Meat', N'product8.png', 18.4, CAST(N'1976-12-08' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1041, N'Jack''s New England Clam Chowder', N'product1.pngg', 9.65, CAST(N'1979-09-10' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1042, N'Singaporean Hokkien Fried Mee', N'product1.png', 14, CAST(N'1973-11-21' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1043, N'Ipoh Coffee', N'product6.png', 46, CAST(N'1980-03-20' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1044, N'Gula Malacca', N'product3.png', 19.45, CAST(N'1970-10-25' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1045, N'Rogede sild', N'product2.png', 9.5, CAST(N'1990-09-21' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1046, N'Spegesild', N'product1.png', 12, CAST(N'1993-06-23' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1047, N'Zaanse koeken', N'product7.png', 9.5, CAST(N'1981-11-25' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1048, N'Chocolade', N'product6.png', 12.75, CAST(N'1984-08-24' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1049, N'Maxilaku', N'product4.png', 20, CAST(N'1987-05-23' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1050, N'Valkoinen suklaa', N'product3.png', 16.25, CAST(N'1990-02-17' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1051, N'Manjimup Dried Apples', N'product8.png', 53, CAST(N'2004-05-22' AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1052, N'Filo Mix', N'product5.png', 7, CAST(N'2001-05-20' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1053, N'Perth Pasties', N'product3.png', 32.8, CAST(N'2007-01-06' AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1054, N'Tourtiare', N'product2.png', 7.45, CAST(N'2009-10-07' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1055, N'Pacta chinois', N'product7.png', 24, CAST(N'2007-07-08' AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1056, N'Gnocchi di nonna Alice', N'product3.png', 38, CAST(N'2007-05-18' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1057, N'Ravioli Angelo', N'product7.png', 19.5, CAST(N'2010-02-16' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1058, N'Escargots de Bourgogne', N'product1.png', 13.25, CAST(N'2011-07-26' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1059, N'Raclette Courdavault', N'product4.png', 55, CAST(N'2007-09-22' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1060, N'Camembert Pierrot', N'product6.png', 34, CAST(N'2010-06-20' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1061, N'Sirop d''aOrable', N'product4.png', 28.5, CAST(N'2007-05-29' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1062, N'Tarte au sucre', N'product7.png', 49.3, CAST(N'2008-01-21' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1063, N'Vegie-spread', N'product8.png', 43.9, CAST(N'2007-11-21' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1064, N'Wimmers gute Semmelknade3', N'product1.png', 33.25, CAST(N'2009-05-15' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1065, N'Louisiana Fiery Hot Pepper Sauce', N'product1.png', 21.05, CAST(N'2008-05-15' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1066, N'Louisiana Hot Spiced Okra', N'product1.png', 17, CAST(N'2011-02-10' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1067, N'Laughing Lumberjack Lager', N'product1.png', 14, CAST(N'2010-12-05' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1068, N'Scottish Longbreads', N'product1.png', 12.5, CAST(N'2009-07-08' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1069, N'Gudbrandsdalsost', N'product3.png', 36, CAST(N'2011-03-09' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1070, N'Outback Lager', N'product4.png', 15, CAST(N'2009-02-21' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1071, N'Flotemysost', N'product3.png', 21.5, CAST(N'1980-09-04' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1072, N'Mozzarella di Giovanni', N'product1.png', 34.8, CAST(N'1983-06-03' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1073, N'Rad Kaviar', N'product6.png', 15, CAST(N'1982-12-03' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1074, N'Longlife Tofu', N'product7.png', 10, CAST(N'1982-09-27' AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1075, N'RhanbrAu Klosterbier', N'product2.png', 7.75, CAST(N'1982-10-31' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1076, N'Lakkalik AAri', N'product3.png', 18, CAST(N'1970-07-28' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1077, N'Original Frankfurter grane Soae', N'1077.gif', 13, CAST(N'1976-04-04' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1081, N'Chai', N'product3.png', 19, CAST(N'1984-04-04' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1083, N'Mishi Kobe Niku', N'product1.png', 97, CAST(N'1989-07-23' AS Date), 0, N'1005')
SET IDENTITY_INSERT [dbo].[Products] OFF