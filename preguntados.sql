USE [master]
GO
/****** Object:  Database [preguntados]    Script Date: 5/26/2017 10:51:11 AM ******/
CREATE DATABASE [preguntados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'preguntados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\preguntados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'preguntados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\preguntados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [preguntados] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [preguntados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [preguntados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [preguntados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [preguntados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [preguntados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [preguntados] SET ARITHABORT OFF 
GO
ALTER DATABASE [preguntados] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [preguntados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [preguntados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [preguntados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [preguntados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [preguntados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [preguntados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [preguntados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [preguntados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [preguntados] SET  ENABLE_BROKER 
GO
ALTER DATABASE [preguntados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [preguntados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [preguntados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [preguntados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [preguntados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [preguntados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [preguntados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [preguntados] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [preguntados] SET  MULTI_USER 
GO
ALTER DATABASE [preguntados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [preguntados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [preguntados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [preguntados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [preguntados] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [preguntados] SET QUERY_STORE = OFF
GO
USE [preguntados]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [preguntados]
GO
/****** Object:  Table [dbo].[PRE_Categoria]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRE_Categoria](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PRE_Categoria] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRE_Historial]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRE_Historial](
	[IDHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_PRE_Historial] PRIMARY KEY CLUSTERED 
(
	[IDHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRE_Partida]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRE_Partida](
	[IDPartida] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario1] [int] NOT NULL,
	[IDUsuario2] [int] NOT NULL,
	[Turno] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Ronda] [int] NOT NULL,
	[PreguntasCorrectas1] [int] NOT NULL,
	[Personajes1] [int] NOT NULL,
	[PreguntasCorrectas2] [int] NOT NULL,
	[Personajes2] [int] NOT NULL,
 CONSTRAINT [PK_PRE_Partida] PRIMARY KEY CLUSTERED 
(
	[IDPartida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRE_PartidaDetalle]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRE_PartidaDetalle](
	[IDPartidaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IDPartida] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDCategoria] [int] NOT NULL,
 CONSTRAINT [PK_PRE_PartidaDetalle] PRIMARY KEY CLUSTERED 
(
	[IDPartidaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRE_Pregunta]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRE_Pregunta](
	[IDPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [nvarchar](200) NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[Respuesta1] [nvarchar](30) NOT NULL,
	[Respuesta2] [nvarchar](30) NOT NULL,
	[Respuesta3] [nvarchar](30) NOT NULL,
	[Respuesta4] [nvarchar](30) NOT NULL,
	[Correcta] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL,
 CONSTRAINT [PK_PRE_Pregunta] PRIMARY KEY CLUSTERED 
(
	[IDPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRE_Usuario]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRE_Usuario](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Usuario] [nvarchar](10) NOT NULL,
	[Clave] [nvarchar](10) NOT NULL,
	[PartidasGanadas] [int] NOT NULL,
	[PartidasPerdidas] [int] NOT NULL,
 CONSTRAINT [PK_PRE_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[PRE_Categoria] ON 

INSERT [dbo].[PRE_Categoria] ([IDCategoria], [Descripcion]) VALUES (1, N'Historia')
INSERT [dbo].[PRE_Categoria] ([IDCategoria], [Descripcion]) VALUES (2, N'Arte')
INSERT [dbo].[PRE_Categoria] ([IDCategoria], [Descripcion]) VALUES (3, N'Entretenimiento')
INSERT [dbo].[PRE_Categoria] ([IDCategoria], [Descripcion]) VALUES (4, N'Deporte')
INSERT [dbo].[PRE_Categoria] ([IDCategoria], [Descripcion]) VALUES (5, N'Ciencia')
INSERT [dbo].[PRE_Categoria] ([IDCategoria], [Descripcion]) VALUES (6, N'Geografía')
SET IDENTITY_INSERT [dbo].[PRE_Categoria] OFF
SET IDENTITY_INSERT [dbo].[PRE_Pregunta] ON 

INSERT [dbo].[PRE_Pregunta] ([IDPregunta], [Pregunta], [IDCategoria], [Respuesta1], [Respuesta2], [Respuesta3], [Respuesta4], [Correcta], [IDUsuario]) VALUES (1, N'Quien escribio 100 años de soledad', 2, N'Juan rulfo', N'Nelson Mandela', N'Gabriel Garcia Marquez', N'Julio Cortazar', 3, 1)
INSERT [dbo].[PRE_Pregunta] ([IDPregunta], [Pregunta], [IDCategoria], [Respuesta1], [Respuesta2], [Respuesta3], [Respuesta4], [Correcta], [IDUsuario]) VALUES (2, N'En que año se descubrio america', 1, N'1592', N'1492', N'1494', N'1394', 2, 1)
INSERT [dbo].[PRE_Pregunta] ([IDPregunta], [Pregunta], [IDCategoria], [Respuesta1], [Respuesta2], [Respuesta3], [Respuesta4], [Correcta], [IDUsuario]) VALUES (3, N'A quien le dicen la toti', 3, N'Sofia Vergara', N'La Chicholina', N'Shakira', N'Celia Cruz', 1, 1)
INSERT [dbo].[PRE_Pregunta] ([IDPregunta], [Pregunta], [IDCategoria], [Respuesta1], [Respuesta2], [Respuesta3], [Respuesta4], [Correcta], [IDUsuario]) VALUES (4, N'A quien le dicen CR7 ', 4, N'Messi', N'Hammer Rodriguez', N'Maradona', N'Cristiano Ronaldo', 4, 1)
INSERT [dbo].[PRE_Pregunta] ([IDPregunta], [Pregunta], [IDCategoria], [Respuesta1], [Respuesta2], [Respuesta3], [Respuesta4], [Correcta], [IDUsuario]) VALUES (5, N'La memoria volatil de un PC es', 5, N'ROM', N'HD', N'USB', N'RAM', 4, 1)
INSERT [dbo].[PRE_Pregunta] ([IDPregunta], [Pregunta], [IDCategoria], [Respuesta1], [Respuesta2], [Respuesta3], [Respuesta4], [Correcta], [IDUsuario]) VALUES (6, N'El rio mas largo del mundo es', 6, N'El Nilo', N'El Volga', N'El Amazonas', N'El Magdalena', 3, 1)
INSERT [dbo].[PRE_Pregunta] ([IDPregunta], [Pregunta], [IDCategoria], [Respuesta1], [Respuesta2], [Respuesta3], [Respuesta4], [Correcta], [IDUsuario]) VALUES (7, N'En binario cuando es 1 + 1', 5, N'11', N'01', N'10', N'100', 3, 1)
SET IDENTITY_INSERT [dbo].[PRE_Pregunta] OFF
SET IDENTITY_INSERT [dbo].[PRE_Usuario] ON 

INSERT [dbo].[PRE_Usuario] ([IDUsuario], [Nombres], [Apellidos], [Usuario], [Clave], [PartidasGanadas], [PartidasPerdidas]) VALUES (1, N'Starling', N'Germosen', N'sgermosen', N'123', 0, 0)
INSERT [dbo].[PRE_Usuario] ([IDUsuario], [Nombres], [Apellidos], [Usuario], [Clave], [PartidasGanadas], [PartidasPerdidas]) VALUES (2, N'Juan', N'Zuluaga', N'zulu', N'123', 0, 0)
SET IDENTITY_INSERT [dbo].[PRE_Usuario] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PRE_Pregunta_Pregunta]    Script Date: 5/26/2017 10:51:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRE_Pregunta_Pregunta] ON [dbo].[PRE_Pregunta]
(
	[Pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PRE_Usuario_usuario]    Script Date: 5/26/2017 10:51:11 AM ******/
CREATE NONCLUSTERED INDEX [IX_PRE_Usuario_usuario] ON [dbo].[PRE_Usuario]
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRE_Partida] ADD  CONSTRAINT [DF_PRE_Partida_Ronda]  DEFAULT ((0)) FOR [Ronda]
GO
ALTER TABLE [dbo].[PRE_Partida] ADD  CONSTRAINT [DF_PRE_Partida_PreguntasCorrectas1]  DEFAULT ((0)) FOR [PreguntasCorrectas1]
GO
ALTER TABLE [dbo].[PRE_Partida] ADD  CONSTRAINT [DF_PRE_Partida_Personajes1]  DEFAULT ((0)) FOR [Personajes1]
GO
ALTER TABLE [dbo].[PRE_Partida] ADD  CONSTRAINT [DF_PRE_Partida_PreguntasCorrectas2]  DEFAULT ((0)) FOR [PreguntasCorrectas2]
GO
ALTER TABLE [dbo].[PRE_Partida] ADD  CONSTRAINT [DF_PRE_Partida_Personajes2]  DEFAULT ((0)) FOR [Personajes2]
GO
ALTER TABLE [dbo].[PRE_Usuario] ADD  CONSTRAINT [DF_PRE_Usuario_PartidasGanadas]  DEFAULT ((0)) FOR [PartidasGanadas]
GO
ALTER TABLE [dbo].[PRE_Usuario] ADD  CONSTRAINT [DF_PRE_Usuario_PartidasPerdidas]  DEFAULT ((0)) FOR [PartidasPerdidas]
GO
ALTER TABLE [dbo].[PRE_Historial]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Historial_PRE_Categoria] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[PRE_Categoria] ([IDCategoria])
GO
ALTER TABLE [dbo].[PRE_Historial] CHECK CONSTRAINT [FK_PRE_Historial_PRE_Categoria]
GO
ALTER TABLE [dbo].[PRE_Historial]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Historial_PRE_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[PRE_Usuario] ([IDUsuario])
GO
ALTER TABLE [dbo].[PRE_Historial] CHECK CONSTRAINT [FK_PRE_Historial_PRE_Usuario]
GO
ALTER TABLE [dbo].[PRE_Partida]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Partida_PRE_Usuario] FOREIGN KEY([IDUsuario1])
REFERENCES [dbo].[PRE_Usuario] ([IDUsuario])
GO
ALTER TABLE [dbo].[PRE_Partida] CHECK CONSTRAINT [FK_PRE_Partida_PRE_Usuario]
GO
ALTER TABLE [dbo].[PRE_Partida]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Partida_PRE_Usuario1] FOREIGN KEY([IDUsuario1])
REFERENCES [dbo].[PRE_Usuario] ([IDUsuario])
GO
ALTER TABLE [dbo].[PRE_Partida] CHECK CONSTRAINT [FK_PRE_Partida_PRE_Usuario1]
GO
ALTER TABLE [dbo].[PRE_Partida]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Partida_PRE_Usuario2] FOREIGN KEY([IDUsuario2])
REFERENCES [dbo].[PRE_Usuario] ([IDUsuario])
GO
ALTER TABLE [dbo].[PRE_Partida] CHECK CONSTRAINT [FK_PRE_Partida_PRE_Usuario2]
GO
ALTER TABLE [dbo].[PRE_PartidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PRE_PartidaDetalle_PRE_Categoria] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[PRE_Categoria] ([IDCategoria])
GO
ALTER TABLE [dbo].[PRE_PartidaDetalle] CHECK CONSTRAINT [FK_PRE_PartidaDetalle_PRE_Categoria]
GO
ALTER TABLE [dbo].[PRE_PartidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PRE_PartidaDetalle_PRE_Partida] FOREIGN KEY([IDPartida])
REFERENCES [dbo].[PRE_Partida] ([IDPartida])
GO
ALTER TABLE [dbo].[PRE_PartidaDetalle] CHECK CONSTRAINT [FK_PRE_PartidaDetalle_PRE_Partida]
GO
ALTER TABLE [dbo].[PRE_PartidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PRE_PartidaDetalle_PRE_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[PRE_Usuario] ([IDUsuario])
GO
ALTER TABLE [dbo].[PRE_PartidaDetalle] CHECK CONSTRAINT [FK_PRE_PartidaDetalle_PRE_Usuario]
GO
ALTER TABLE [dbo].[PRE_Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Pregunta_PRE_Categoria] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[PRE_Categoria] ([IDCategoria])
GO
ALTER TABLE [dbo].[PRE_Pregunta] CHECK CONSTRAINT [FK_PRE_Pregunta_PRE_Categoria]
GO
ALTER TABLE [dbo].[PRE_Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Pregunta_PRE_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[PRE_Usuario] ([IDUsuario])
GO
ALTER TABLE [dbo].[PRE_Pregunta] CHECK CONSTRAINT [FK_PRE_Pregunta_PRE_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[PRE_GetUsuario]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRE_GetUsuario]
(
	@Usuario nvarchar(10),
	@Clave nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT IDUsuario, Nombres, Apellidos, Usuario, Clave, PartidasGanadas, PartidasPerdidas FROM dbo.PRE_Usuario
where Usuario=@Usuario and Clave=@Clave

GO
/****** Object:  StoredProcedure [dbo].[PRE_ValidarUsuario]    Script Date: 5/26/2017 10:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRE_ValidarUsuario]
(
	@Usuario nvarchar(10),
	@Clave nvarchar(10)
)
AS
	SET NOCOUNT ON;
Select IDUsuario from PRE_Usuario where Usuario =@Usuario and Clave=@Clave

GO
USE [master]
GO
ALTER DATABASE [preguntados] SET  READ_WRITE 
GO
