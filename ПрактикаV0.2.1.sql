USE [master]
GO
/****** Object:  Database [MEFFLAB]    Script Date: 17.05.2023 9:56:10 ******/
CREATE DATABASE [MEFFLAB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MEFFLAB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\MEFFLAB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MEFFLAB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\MEFFLAB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MEFFLAB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MEFFLAB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MEFFLAB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MEFFLAB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MEFFLAB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MEFFLAB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MEFFLAB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MEFFLAB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MEFFLAB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MEFFLAB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MEFFLAB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MEFFLAB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MEFFLAB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MEFFLAB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MEFFLAB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MEFFLAB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MEFFLAB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MEFFLAB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MEFFLAB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MEFFLAB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MEFFLAB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MEFFLAB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MEFFLAB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MEFFLAB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MEFFLAB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MEFFLAB] SET  MULTI_USER 
GO
ALTER DATABASE [MEFFLAB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MEFFLAB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MEFFLAB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MEFFLAB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MEFFLAB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MEFFLAB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MEFFLAB] SET QUERY_STORE = OFF
GO
USE [MEFFLAB]
GO
/****** Object:  Table [dbo].[Биоматериал]    Script Date: 17.05.2023 9:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Биоматериал](
	[Id_материала] [int] IDENTITY(1,1) NOT NULL,
	[Штрихкод] [int] NOT NULL,
 CONSTRAINT [PK_Биоматериал] PRIMARY KEY CLUSTERED 
(
	[Id_материала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ВидМатериала]    Script Date: 17.05.2023 9:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ВидМатериала](
	[Id_видаМатериала] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ВидМатериала] PRIMARY KEY CLUSTERED 
(
	[Id_видаМатериала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 17.05.2023 9:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Id_заказа] [int] IDENTITY(1,1) NOT NULL,
	[Id_Штрихкода] [int] NOT NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Id_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 17.05.2023 9:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Фамилия] [nvarchar](50) NOT NULL,
	[имя] [nvarchar](50) NOT NULL,
	[Id_Клиента] [int] IDENTITY(1,1) NOT NULL,
	[Id_Заказа] [int] NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[Id_Клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отдел]    Script Date: 17.05.2023 9:56:10 ******/
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
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 17.05.2023 9:56:10 ******/
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
/****** Object:  Table [dbo].[Услуга]    Script Date: 17.05.2023 9:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуга](
	[Id_Услуги] [int] IDENTITY(1,1) NOT NULL,
	[Наименование1] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Услуга] PRIMARY KEY CLUSTERED 
(
	[Id_Услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Штрихкод]    Script Date: 17.05.2023 9:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Штрихкод](
	[Id_Штрихкода] [int] NOT NULL,
	[ДатаСоздания] [date] NOT NULL,
	[ВидМатериала] [int] NOT NULL,
	[Id_услуги] [int] NOT NULL,
	[Id_биоматериала] [int] NOT NULL,
 CONSTRAINT [PK_Штрихкод] PRIMARY KEY CLUSTERED 
(
	[Id_Штрихкода] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ВидМатериала] ON 

INSERT [dbo].[ВидМатериала] ([Id_видаМатериала], [Наименование]) VALUES (1, N'Кровь')
INSERT [dbo].[ВидМатериала] ([Id_видаМатериала], [Наименование]) VALUES (2, N'Витамин')
INSERT [dbo].[ВидМатериала] ([Id_видаМатериала], [Наименование]) VALUES (3, N'Шёлочь')
SET IDENTITY_INSERT [dbo].[ВидМатериала] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 

INSERT [dbo].[Клиенты] ([Фамилия], [имя], [Id_Клиента], [Id_Заказа]) VALUES (N'Катаргин', N'Никита', 1, NULL)
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
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
SET IDENTITY_INSERT [dbo].[Услуга] ON 

INSERT [dbo].[Услуга] ([Id_Услуги], [Наименование1]) VALUES (1, N'Проверка')
INSERT [dbo].[Услуга] ([Id_Услуги], [Наименование1]) VALUES (2, N'Анализ')
INSERT [dbo].[Услуга] ([Id_Услуги], [Наименование1]) VALUES (3, N'Сдача')
SET IDENTITY_INSERT [dbo].[Услуга] OFF
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Штрихкод] FOREIGN KEY([Id_Штрихкода])
REFERENCES [dbo].[Штрихкод] ([Id_Штрихкода])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Штрихкод]
GO
ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [FK_Клиенты_Заказ] FOREIGN KEY([Id_Заказа])
REFERENCES [dbo].[Заказ] ([Id_заказа])
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [FK_Клиенты_Заказ]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Отдел] FOREIGN KEY([Id_отдела])
REFERENCES [dbo].[Отдел] ([Id_отдела])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Отдел]
GO
ALTER TABLE [dbo].[Штрихкод]  WITH CHECK ADD  CONSTRAINT [FK_Штрихкод_Биоматериал] FOREIGN KEY([Id_биоматериала])
REFERENCES [dbo].[Биоматериал] ([Id_материала])
GO
ALTER TABLE [dbo].[Штрихкод] CHECK CONSTRAINT [FK_Штрихкод_Биоматериал]
GO
ALTER TABLE [dbo].[Штрихкод]  WITH CHECK ADD  CONSTRAINT [FK_Штрихкод_ВидМатериала] FOREIGN KEY([ВидМатериала])
REFERENCES [dbo].[ВидМатериала] ([Id_видаМатериала])
GO
ALTER TABLE [dbo].[Штрихкод] CHECK CONSTRAINT [FK_Штрихкод_ВидМатериала]
GO
ALTER TABLE [dbo].[Штрихкод]  WITH CHECK ADD  CONSTRAINT [FK_Штрихкод_Услуга] FOREIGN KEY([Id_услуги])
REFERENCES [dbo].[Услуга] ([Id_Услуги])
GO
ALTER TABLE [dbo].[Штрихкод] CHECK CONSTRAINT [FK_Штрихкод_Услуга]
GO
USE [master]
GO
ALTER DATABASE [MEFFLAB] SET  READ_WRITE 
GO
