USE [master]
GO
/****** Object:  Database [Restaurante_OLTP]    Script Date: 23/8/2019 15:41:12 ******/
CREATE DATABASE [Restaurante_OLTP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurante_OLTP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SERVIDOR\MSSQL\DATA\Restaurante_OLTP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Restaurante_OLTP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SERVIDOR\MSSQL\DATA\Restaurante_OLTP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Restaurante_OLTP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurante_OLTP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurante_OLTP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Restaurante_OLTP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurante_OLTP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurante_OLTP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Restaurante_OLTP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurante_OLTP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restaurante_OLTP] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurante_OLTP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurante_OLTP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurante_OLTP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurante_OLTP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Restaurante_OLTP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restaurante_OLTP] SET QUERY_STORE = OFF
GO
USE [Restaurante_OLTP]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[IdCargo] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[RTN] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuentos]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuentos](
	[IdDescuentos] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Valor] [int] NOT NULL,
 CONSTRAINT [PK_Descuentos] PRIMARY KEY CLUSTERED 
(
	[IdDescuentos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Orden]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Orden](
	[IdDetalleOrden] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
 CONSTRAINT [PK_Detalle_Orden] PRIMARY KEY CLUSTERED 
(
	[IdDetalleOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdCargo] [int] NOT NULL,
	[Descuento_Empleado] [int] NOT NULL,
	[Fecha_Inicio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] NOT NULL,
	[IdInformacionFactura] [int] NOT NULL,
	[IdOrden] [int] NOT NULL,
	[IdTipoPago] [int] NOT NULL,
	[IdDescuento] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[ISV] [decimal](10, 2) NOT NULL,
	[Total] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informacion_Factura]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion_Factura](
	[IdInformacionFactura] [int] NOT NULL,
	[RTN] [varchar](50) NOT NULL,
	[nFactura] [varchar](50) NOT NULL,
	[CAI] [varchar](50) NOT NULL,
	[Correlativo] [int] NOT NULL,
	[Fecha_Limite] [date] NOT NULL,
	[Rango_Minimo] [int] NOT NULL,
	[Rango_Maximo] [int] NOT NULL,
 CONSTRAINT [PK_Informacion_Factura] PRIMARY KEY CLUSTERED 
(
	[IdInformacionFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[IdOrden] [int] NOT NULL,
	[IdDetalleOrden] [int] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Orden] PRIMARY KEY CLUSTERED 
(
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Sexo] [char](2) NOT NULL,
	[IDE] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planilla]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planilla](
	[IdPlanilla] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Sueldo] [decimal](10, 2) NOT NULL,
	[Adelantos] [decimal](10, 2) NOT NULL,
	[Deduccioes] [decimal](10, 2) NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Planilla] PRIMARY KEY CLUSTERED 
(
	[IdPlanilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Pago]    Script Date: 23/8/2019 15:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Pago](
	[IdTipoPago] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Tipo_Pago] PRIMARY KEY CLUSTERED 
(
	[IdTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalle_Orden]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Orden_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Detalle_Orden] CHECK CONSTRAINT [FK_Detalle_Orden_Producto]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Cargo] FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Cargo] ([IdCargo])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Cargo]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Persona]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Descuentos] FOREIGN KEY([IdDescuento])
REFERENCES [dbo].[Descuentos] ([IdDescuentos])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Descuentos]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Informacion_Factura] FOREIGN KEY([IdInformacionFactura])
REFERENCES [dbo].[Informacion_Factura] ([IdInformacionFactura])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Informacion_Factura]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Orden] FOREIGN KEY([IdOrden])
REFERENCES [dbo].[Orden] ([IdOrden])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Orden]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Tipo_Pago] FOREIGN KEY([IdTipoPago])
REFERENCES [dbo].[Tipo_Pago] ([IdTipoPago])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Tipo_Pago]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Detalle_Orden] FOREIGN KEY([IdDetalleOrden])
REFERENCES [dbo].[Detalle_Orden] ([IdDetalleOrden])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_Orden_Detalle_Orden]
GO
ALTER TABLE [dbo].[Planilla]  WITH CHECK ADD  CONSTRAINT [FK_Planilla_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Planilla] CHECK CONSTRAINT [FK_Planilla_Empleados]
GO
USE [master]
GO
ALTER DATABASE [Restaurante_OLTP] SET  READ_WRITE 
GO
