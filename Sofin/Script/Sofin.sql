USE [master]
GO
CREATE DATABASE [Sofin]
GO
USE [Sofin]
GO 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[IDCity] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[IDCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EdIzmer](
	[IDEdIzm] [int] IDENTITY(1,1) NOT NULL,
	[Edzm] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EdIzmer] PRIMARY KEY CLUSTERED 
(
	[IDEdIzm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postavshik](
	[IDPostavshik] [int] IDENTITY(1,1) NOT NULL,
	[PostavshikName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Postavshik] PRIMARY KEY CLUSTERED 
(
	[IDPostavshik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvoditeli](
	[IDProizvoditelia] [int] IDENTITY(1,1) NOT NULL,
	[NameProizvoditelia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Proizvoditeli] PRIMARY KEY CLUSTERED 
(
	[IDProizvoditelia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PunktVidachi](
	[IDPunktVidashi] [int] NOT NULL,
	[IDCity] [int] NOT NULL,
	[AdressIndex] [int] NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[StreetNumber] [int] NULL,
 CONSTRAINT [PK_PunktVidachi] PRIMARY KEY CLUSTERED 
(
	[IDPunktVidashi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IDRole] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusZakaza](
	[IDStatusZakaza] [int] NOT NULL,
	[StatusZakazaName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusZakaza] PRIMARY KEY CLUSTERED 
(
	[IDStatusZakaza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tovar](
	[IDTovar] [int] IDENTITY(1,1) NOT NULL,
	[IDPostavshik] [int] NOT NULL,
	[IDProizvoditelia] [int] NOT NULL,
	[IDTovarCategory] [int] NOT NULL,
	[IDEdIzm] [int] NOT NULL,
	[Article] [nvarchar](6) NOT NULL,
	[TovarName] [nvarchar](150) NOT NULL,
	[Cost] [money] NOT NULL,
	[Discount] [int] NULL,
	[KolvoNaSklade] [int] NULL,
	[Description] [text] NOT NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tovar] PRIMARY KEY CLUSTERED 
(
	[IDTovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TovarCategory](
	[IDTovarCategory] [int] IDENTITY(1,1) NOT NULL,
	[TovarCategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TovarCategory] PRIMARY KEY CLUSTERED 
(
	[IDTovarCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] NOT NULL,
	[IDRole] [int] NOT NULL,
	[Familia] [nvarchar](50) NOT NULL,
	[Imya] [nvarchar](50) NOT NULL,
	[Otchestvo] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakaz](
	[IDZakaza] [int] IDENTITY(1,1) NOT NULL,
	[IDTovar] [int] NOT NULL,
	[IDPunktVidashi] [int] NULL,
	[IDUser] [int] NOT NULL,
	[IDStatusZakaza] [int] NULL,
	[NomerZakaza] [int] NOT NULL,
	[Kolvo] [int] NULL,
	[DateZakaza] [date] NULL,
	[DateDelivery] [date] NULL,
	[CodePolushenia] [int] NULL,
 CONSTRAINT [PK_Zakaz] PRIMARY KEY CLUSTERED 
(
	[IDZakaza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([IDCity], [CityName]) VALUES (1, N'Лесной')
GO
SET IDENTITY_INSERT [dbo].[EdIzmer] ON 

INSERT [dbo].[EdIzmer] ([IDEdIzm], [Edzm]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[EdIzmer] OFF
GO
SET IDENTITY_INSERT [dbo].[Postavshik] ON 

INSERT [dbo].[Postavshik] ([IDPostavshik], [PostavshikName]) VALUES (1, N'Стройландия')
INSERT [dbo].[Postavshik] ([IDPostavshik], [PostavshikName]) VALUES (2, N'Кромма')
INSERT [dbo].[Postavshik] ([IDPostavshik], [PostavshikName]) VALUES (3, N'ЗолотоеРуно')
INSERT [dbo].[Postavshik] ([IDPostavshik], [PostavshikName]) VALUES (4, N'KRYLOVMANUFACTURA')
SET IDENTITY_INSERT [dbo].[Postavshik] OFF
GO
SET IDENTITY_INSERT [dbo].[Proizvoditeli] ON 

INSERT [dbo].[Proizvoditeli] ([IDProizvoditelia], [NameProizvoditelia]) VALUES (1, N'SVМЕБЕЛЬ')
INSERT [dbo].[Proizvoditeli] ([IDProizvoditelia], [NameProizvoditelia]) VALUES (2, N'Мебелони')
INSERT [dbo].[Proizvoditeli] ([IDProizvoditelia], [NameProizvoditelia]) VALUES (3, N'Инвуд')
INSERT [dbo].[Proizvoditeli] ([IDProizvoditelia], [NameProizvoditelia]) VALUES (4, N'RIDBERG')
INSERT [dbo].[Proizvoditeli] ([IDProizvoditelia], [NameProizvoditelia]) VALUES (5, N'Aero')
INSERT [dbo].[Proizvoditeli] ([IDProizvoditelia], [NameProizvoditelia]) VALUES (6, N'Fizard')
INSERT [dbo].[Proizvoditeli] ([IDProizvoditelia], [NameProizvoditelia]) VALUES (7, N'kari')
SET IDENTITY_INSERT [dbo].[Proizvoditeli] OFF
GO
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (1, 1, 420151, N' ул. Вишневая', 32)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (2, 1, 125061, N' ул. Подгорная', 8)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (3, 1, 630370, N' ул. Шоссейная', 24)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (4, 1, 400562, N' ул. Зеленая', 32)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (5, 1, 614510, N' ул. Маяковского', 47)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (6, 1, 410542, N' ул. Светлая', 46)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (7, 1, 620839, N' ул. Цветочная', 8)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (8, 1, 443890, N' ул. Коммунистическая', 1)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (9, 1, 603379, N' ул. Спортивная', 46)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (10, 1, 603721, N' ул. Гоголя', 41)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (11, 1, 410172, N' ул. Северная', 13)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (12, 1, 614611, N' ул. Молодежная', 50)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (13, 1, 454311, N' ул. Новая', 19)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (14, 1, 660007, N' ул. Октябрьская', 19)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (15, 1, 603036, N' ул. Садовая', 4)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (16, 1, 394060, N' ул. Фрунзе', 43)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (17, 1, 410661, N' ул. Школьная', 50)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (18, 1, 625590, N' ул. Коммунистическая', 20)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (19, 1, 625683, N' ул. 8 Марта', NULL)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (20, 1, 450983, N' ул. Комсомольская', 26)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (21, 1, 394782, N' ул. Чехова', 3)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (22, 1, 603002, N' ул. Дзержинского', 28)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (23, 1, 450558, N' ул. Набережная', 30)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (24, 1, 344288, N' ул. Чехова', 1)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (25, 1, 614164, N'  ул. Степная', 30)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (26, 1, 394242, N' ул. Коммунистическая', 43)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (27, 1, 660540, N' ул. Солнечная', 25)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (28, 1, 125837, N' ул. Шоссейная', 40)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (29, 1, 125703, N' ул. Партизанская', 49)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (30, 1, 625283, N' ул. Победы', 46)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (31, 1, 614753, N' ул. Полевая', 35)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (32, 1, 426030, N' ул. Маяковского', 44)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (33, 1, 450375, N'ул. Клубная', 44)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (34, 1, 625560, N' ул. Некрасова', 12)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (35, 1, 630201, N' ул. Комсомольская', 17)
INSERT [dbo].[PunktVidachi] ([IDPunktVidashi], [IDCity], [AdressIndex], [Street], [StreetNumber]) VALUES (36, 1, 190949, N' ул. Мичурина', 26)
GO
INSERT [dbo].[Role] ([IDRole], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([IDRole], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([IDRole], [RoleName]) VALUES (3, N'Авторизированный клиент')
GO
INSERT [dbo].[StatusZakaza] ([IDStatusZakaza], [StatusZakazaName]) VALUES (1, N'Новый')
INSERT [dbo].[StatusZakaza] ([IDStatusZakaza], [StatusZakazaName]) VALUES (2, N'Завершен')
GO
SET IDENTITY_INSERT [dbo].[Tovar] ON 

INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (1, 1, 1, 1, 1, N'А112Т4', N'Прихожая Фаворит 1 1420х2056х352ммм Дуб Делано/Цемент Светлый SV-М 1 шт', 9577.0000, 10, 0, N'Удивительно функциональная и практичная прихожая Фаворит 1, обладая характерными чертами Скандинавского стиля, выглядит эффектно и способна задать тон интерьеру дома, встречая вас и ваших гостей. ', N'1.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (2, 1, 2, 1, 1, N'G843H5', N'Прихожая в коридор Твист с зеркалом мебель со шкафами, 120х37х202 см', 8803.0000, 25, 9, N'Этот стеллаж со шкафом в прихожую комнату станет отличным элементом для вашего интерьера. Мебель для дома обеспечивает удобное хранение перчаток, шапок, зонтов, сумок и других аксессуаров. ', N'2.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (3, 2, 3, 2, 1, N'D325D4', N'Угловой диван Кромма Инвуд Лайт, серый двухместный диван, Velutto 32', 29125.0000, 5, 12, N'Угловой диван Инвуд Лайт 2 - стильный и комфортный диван подойдет для комнаты любого размера.', N'3.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (4, 2, 4, 3, 1, N'S432T5', N'Обувница RIDBERG, с вешалкой, стальная, 170x60x26 см, 5 полок, вместимость до 15 пар', 885.0000, 15, 15, N'Обувница Ridberg с 5 полками и вешалкой - идеальное решение для организации хранения обуви в прихожей или гардеробной. ', N'4.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (5, 3, 3, 2, 1, N'F325D4', N'Диван, Прямой диван, Диван-кровать Сити темно-коричневый. Квест-33', 14322.0000, 18, 3, N'
Прямой диван-кровать Сити - это современное и функциональное решение для вашего дома.', N'5.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (6, 4, 3, 4, 1, N'G432G6', N'Пуф трансформер кровать раскладушка светло-коричневый велюр', 6149.0000, 22, 3, N'Пуф трансформер 5в1 представляет собой уникальное сочетание функций, выступая в качестве пуфика, столика, кресла, шезлонга и дополнительного спального места. ', N'6.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (7, 3, 3, 2, 1, N'H542F5', N'Диван, Прямой диван, диван кровать, Рио симпл механизм Пантограф. Симпл-16', 20708.0000, 4, 5, N'Диван Рио симпл от "Золотое Руно" - это сочетание комфорта, функциональности и стильного дизайна.', N'7.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (8, 4, 4, 5, 1, N'C346F5', N'Полка настенная ромб Лофт, черная, 40 см', 2843.0000, 5, 4, N'Полочки для цветов в стиле лофт. Подойдут как для цветов, так и в качестве декоративного элемента. Полки подойдут для дома, офиса, кафе, ресторана. ?', N'8.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (9, 4, 4, 6, 1, N'F256G6', N'Стулья для кухни', 4760.0000, 6, 2, N'Набор из четырех стульев в лофт-дизайне станет любимой мебелью для отдыха и подойдет для взрослых и детей. ', N'9.jpg')
INSERT [dbo].[Tovar] ([IDTovar], [IDPostavshik], [IDProizvoditelia], [IDTovarCategory], [IDEdIzm], [Article], [TovarName], [Cost], [Discount], [KolvoNaSklade], [Description], [Image]) VALUES (10, 4, 4, 5, 1, N'J532V5', N'Магнитная полка, для холодильника, металл, 3шт, универсальная, чёрная', 1387.0000, 8, 6, N'Магнитная полка для холодильника - это удобный и практичный аксессуар, который поможет организовать пространство в вашем доме.', N'10.jpg')
SET IDENTITY_INSERT [dbo].[Tovar] OFF
GO
SET IDENTITY_INSERT [dbo].[TovarCategory] ON 

INSERT [dbo].[TovarCategory] ([IDTovarCategory], [TovarCategoryName]) VALUES (1, N'Прихожая')
INSERT [dbo].[TovarCategory] ([IDTovarCategory], [TovarCategoryName]) VALUES (2, N'Диван')
INSERT [dbo].[TovarCategory] ([IDTovarCategory], [TovarCategoryName]) VALUES (3, N'Обувница')
INSERT [dbo].[TovarCategory] ([IDTovarCategory], [TovarCategoryName]) VALUES (4, N'Пуф')
INSERT [dbo].[TovarCategory] ([IDTovarCategory], [TovarCategoryName]) VALUES (5, N'Полка')
INSERT [dbo].[TovarCategory] ([IDTovarCategory], [TovarCategoryName]) VALUES (6, N'Стул')
SET IDENTITY_INSERT [dbo].[TovarCategory] OFF
GO
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (1, 1, N'Никифорова', N'Анна', N'Семеновна', N'94d5ous@gmail.com', N'uzWC67')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (2, 1, N'Стелина', N'Евгения', N'Петровна', N'uth4iz@mail.com', N'2L6KZG')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (3, 1, N'Никифорова', N'Весения', N'Николаевна', N'5d4zbu@tutanota.com', N'rwVDh9')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (4, 2, N'Сазонов', N'Руслан', N'Германович', N'ptec8ym@yahoo.com', N'LdNyos')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (5, 2, N'Одинцов', N'Серафим', N'Артёмович', N'1qz4kw@mail.com', N'gynQMT')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (6, 2, N'Старикова', N'Елена', N'Павловна', N'4np6se@mail.com', N'AtnDjr')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (7, 3, N'Степанов', N'Михаил', N'Артёмович', N'yzls62@outlook.com', N'JlFRCZ')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (8, 3, N'Михайлюк', N'Анна', N'Вячеславовна', N'1diph5e@tutanota.com', N'8ntwUp')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (9, 3, N'Ситдикова', N'Елена', N'Анатольевна', N'tjde7c@yahoo.com', N'YOyhfR')
INSERT [dbo].[User] ([IDUser], [IDRole], [Familia], [Imya], [Otchestvo], [Login], [Password]) VALUES (10, 3, N'Ворсин', N'Петр', N'Евгеньевич', N'wpmrc3do@tutanota.com', N'RSbvHv')
GO
SET IDENTITY_INSERT [dbo].[Zakaz] ON 

INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (1, 1, 1, 7, 1, 1, 2, CAST(N'2024-02-27' AS Date), CAST(N'2024-04-20' AS Date), 901)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (2, 2, 1, 7, 1, 1, 2, CAST(N'2024-02-27' AS Date), CAST(N'2024-04-20' AS Date), 901)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (3, 2, 11, 8, 1, 2, 1, CAST(N'2024-09-28' AS Date), CAST(N'2024-04-21' AS Date), 902)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (4, 1, 11, 8, 1, 2, 1, CAST(N'2024-09-28' AS Date), CAST(N'2024-04-21' AS Date), 902)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (5, 3, 2, 9, 1, 3, 10, CAST(N'2024-03-21' AS Date), CAST(N'2024-04-22' AS Date), 903)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (6, 4, 2, 9, 1, 3, 10, CAST(N'2024-03-21' AS Date), CAST(N'2024-04-22' AS Date), 903)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (7, 5, 11, 10, 2, 4, 5, CAST(N'2024-02-20' AS Date), CAST(N'2024-04-23' AS Date), 904)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (8, 3, 11, 10, 2, 4, 4, CAST(N'2024-02-20' AS Date), CAST(N'2024-04-23' AS Date), 904)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (9, 6, 2, 7, 2, 5, 20, CAST(N'2024-03-17' AS Date), CAST(N'2024-04-24' AS Date), 905)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (10, 7, 2, 7, 2, 5, 20, CAST(N'2024-03-17' AS Date), CAST(N'2024-04-24' AS Date), 905)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (11, 1, 15, 8, 2, 6, 2, CAST(N'2024-03-01' AS Date), CAST(N'2024-04-25' AS Date), 906)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (12, 2, 15, 8, 2, 6, 2, CAST(N'2024-03-01' AS Date), CAST(N'2024-04-25' AS Date), 906)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (13, 2, 3, 9, 2, 7, 1, CAST(N'2024-02-28' AS Date), CAST(N'2024-04-26' AS Date), 907)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (14, 1, 3, 9, 2, 7, 1, CAST(N'2024-02-28' AS Date), CAST(N'2024-04-26' AS Date), 907)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (15, 3, 19, 10, 1, 8, 10, CAST(N'2024-03-31' AS Date), CAST(N'2024-04-27' AS Date), 908)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (16, 4, 19, 10, 1, 8, 10, CAST(N'2024-03-31' AS Date), CAST(N'2024-04-27' AS Date), 908)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (17, 5, 5, 7, 1, 9, 5, CAST(N'2024-04-02' AS Date), CAST(N'2024-04-28' AS Date), 909)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (18, 3, 5, 7, 1, 9, 4, CAST(N'2024-04-02' AS Date), CAST(N'2024-04-28' AS Date), 909)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (19, 6, 19, 8, 1, 10, 20, CAST(N'2024-04-03' AS Date), CAST(N'2024-04-29' AS Date), 910)
INSERT [dbo].[Zakaz] ([IDZakaza], [IDTovar], [IDPunktVidashi], [IDUser], [IDStatusZakaza], [NomerZakaza], [Kolvo], [DateZakaza], [DateDelivery], [CodePolushenia]) VALUES (20, 7, 19, 8, 1, 10, 20, CAST(N'2024-04-03' AS Date), CAST(N'2024-04-29' AS Date), 910)
SET IDENTITY_INSERT [dbo].[Zakaz] OFF
GO
ALTER TABLE [dbo].[PunktVidachi]  WITH CHECK ADD  CONSTRAINT [FK_PunktVidachi_City] FOREIGN KEY([IDCity])
REFERENCES [dbo].[City] ([IDCity])
GO
ALTER TABLE [dbo].[PunktVidachi] CHECK CONSTRAINT [FK_PunktVidachi_City]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_EdIzmer] FOREIGN KEY([IDEdIzm])
REFERENCES [dbo].[EdIzmer] ([IDEdIzm])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_EdIzmer]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Postavshik] FOREIGN KEY([IDPostavshik])
REFERENCES [dbo].[Postavshik] ([IDPostavshik])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Postavshik]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Proizvoditeli] FOREIGN KEY([IDProizvoditelia])
REFERENCES [dbo].[Proizvoditeli] ([IDProizvoditelia])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Proizvoditeli]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_TovarCategory] FOREIGN KEY([IDTovarCategory])
REFERENCES [dbo].[TovarCategory] ([IDTovarCategory])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_TovarCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_PunktVidachi] FOREIGN KEY([IDPunktVidashi])
REFERENCES [dbo].[PunktVidachi] ([IDPunktVidashi])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_PunktVidachi]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_StatusZakaza] FOREIGN KEY([IDStatusZakaza])
REFERENCES [dbo].[StatusZakaza] ([IDStatusZakaza])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_StatusZakaza]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Tovar] FOREIGN KEY([IDTovar])
REFERENCES [dbo].[Tovar] ([IDTovar])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Tovar]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_User]
GO
USE [master]
GO
ALTER DATABASE [Sofin] SET  READ_WRITE 
GO