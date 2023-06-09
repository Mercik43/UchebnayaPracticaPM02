USE [MEFFLAB]
GO
/****** Object:  Table [dbo].[Отдел]    Script Date: 15.05.2023 16:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отдел](
	[Id_отдела] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Отдел] PRIMARY KEY CLUSTERED 
(
	[Id_отдела] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 15.05.2023 16:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[Почта] [nvarchar](50) NOT NULL,
	[ID_Сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Id_отдела] [int] NOT NULL,
	[заблокирован_до] [time](7) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Отдел] ON 

INSERT [dbo].[Отдел] ([Id_отдела], [Наименование]) VALUES (1, N'Лаборант')
INSERT [dbo].[Отдел] ([Id_отдела], [Наименование]) VALUES (2, N'Лаб-Иследователь')
INSERT [dbo].[Отдел] ([Id_отдела], [Наименование]) VALUES (3, N'Бухалтер')
INSERT [dbo].[Отдел] ([Id_отдела], [Наименование]) VALUES (4, N'Администратор')
SET IDENTITY_INSERT [dbo].[Отдел] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([Фамилия], [Имя], [Отчество], [Логин], [Пароль], [Почта], [ID_Сотрудника], [Id_отдела], [заблокирован_до]) VALUES (N'Катаргин', N'Никита', N'Андреевич', N'Mercik43', N'1234', N'Katargin.04@mail.ru', 2, 4, NULL)
INSERT [dbo].[Сотрудники] ([Фамилия], [Имя], [Отчество], [Логин], [Пароль], [Почта], [ID_Сотрудника], [Id_отдела], [заблокирован_до]) VALUES (N'Семаков', N'Дмитрий', N'Алексеевич', N'Dima21231', N'1234', N'Dima123@gmail.com', 3, 3, NULL)
INSERT [dbo].[Сотрудники] ([Фамилия], [Имя], [Отчество], [Логин], [Пароль], [Почта], [ID_Сотрудника], [Id_отдела], [заблокирован_до]) VALUES (N'Шмыров', N'Егор', N'Павлович', N'Egor123', N'1234', N'Ergor@yandex.ru', 4, 1, NULL)
INSERT [dbo].[Сотрудники] ([Фамилия], [Имя], [Отчество], [Логин], [Пароль], [Почта], [ID_Сотрудника], [Id_отдела], [заблокирован_до]) VALUES (N'Воробьёв', N'Лев', N'Дмитриевич', N'LEWAMEFF', N'1234', N'LEF@Bk.ru', 5, 2, NULL)
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Отдел] FOREIGN KEY([Id_отдела])
REFERENCES [dbo].[Отдел] ([Id_отдела])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Отдел]
GO
