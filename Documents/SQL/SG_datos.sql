USE [Smart_Garbage]
GO
/****** Object:  Table [dbo].[Asignación]    Script Date: 24/09/2020 19:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignación](
	[IdAsignacion] [int] NOT NULL,
	[IdRecolector] [int] NOT NULL,
	[IdContenedor] [int] NOT NULL,
	[IdSupervisor] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Secuencia] [bit] NULL,
 CONSTRAINT [PK_Reporte] PRIMARY KEY CLUSTERED 
(
	[IdAsignacion] ASC,
	[IdRecolector] ASC,
	[IdContenedor] ASC,
	[IdSupervisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contenedor]    Script Date: 24/09/2020 19:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenedor](
	[IdContenedor] [int] NOT NULL,
	[CapaCont] [nchar](10) NULL,
	[LatiCont] [nchar](10) NULL,
	[LongCont] [nchar](10) NULL,
	[EstActu] [nchar](10) NULL,
 CONSTRAINT [PK_Contenedor] PRIMARY KEY CLUSTERED 
(
	[IdContenedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recolector]    Script Date: 24/09/2020 19:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recolector](
	[IdRecolector] [int] NOT NULL,
	[Nombres] [varchar](30) NULL,
	[Apellidos] [varchar](40) NULL,
	[Direccion] [varchar](50) NULL,
	[Celular] [nchar](10) NULL,
	[Foto] [image] NULL,
	[CapaReco] [nchar](10) NULL,
	[LatiReco] [nchar](10) NULL,
	[LongReco] [nchar](10) NULL,
 CONSTRAINT [PK_Recolector] PRIMARY KEY CLUSTERED 
(
	[IdRecolector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 24/09/2020 19:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisor](
	[IdSupervisor] [int] NOT NULL,
	[Nombres] [varchar](30) NOT NULL,
	[Apellidos] [varchar](40) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Celular] [nchar](10) NOT NULL,
	[Foto] [image] NULL,
	[dni] [nchar](10) NULL,
 CONSTRAINT [PK_Supervisor] PRIMARY KEY CLUSTERED 
(
	[IdSupervisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Supervisor] ([IdSupervisor], [Nombres], [Apellidos], [Direccion], [Celular], [Foto], [dni]) VALUES (1, N'Pipo', N'Berna', N'Av. Conti', N'55555555  ', NULL, NULL)
INSERT [dbo].[Supervisor] ([IdSupervisor], [Nombres], [Apellidos], [Direccion], [Celular], [Foto], [dni]) VALUES (2, N'Erick', N'Osores', N'Av. Upla', N'66666666  ', NULL, NULL)
INSERT [dbo].[Supervisor] ([IdSupervisor], [Nombres], [Apellidos], [Direccion], [Celular], [Foto], [dni]) VALUES (3, N'Jimmy', N'Neutron', N'Av. Uap', N'77777777  ', NULL, NULL)
GO
ALTER TABLE [dbo].[Asignación]  WITH CHECK ADD  CONSTRAINT [FK_Asignación_Contenedor] FOREIGN KEY([IdContenedor])
REFERENCES [dbo].[Contenedor] ([IdContenedor])
GO
ALTER TABLE [dbo].[Asignación] CHECK CONSTRAINT [FK_Asignación_Contenedor]
GO
ALTER TABLE [dbo].[Asignación]  WITH CHECK ADD  CONSTRAINT [FK_Asignación_Recolector] FOREIGN KEY([IdRecolector])
REFERENCES [dbo].[Recolector] ([IdRecolector])
GO
ALTER TABLE [dbo].[Asignación] CHECK CONSTRAINT [FK_Asignación_Recolector]
GO
ALTER TABLE [dbo].[Asignación]  WITH CHECK ADD  CONSTRAINT [FK_Asignación_Supervisor] FOREIGN KEY([IdSupervisor])
REFERENCES [dbo].[Supervisor] ([IdSupervisor])
GO
ALTER TABLE [dbo].[Asignación] CHECK CONSTRAINT [FK_Asignación_Supervisor]
GO
