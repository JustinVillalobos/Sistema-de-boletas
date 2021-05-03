USE [Ing_System]
GO
/****** Object:  Table [dbo].[Boleta]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleta](
	[IdBoleta] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[PalabraClaveConsulta1] [varchar](100) NOT NULL,
	[PalabraClaveConsulta2] [varchar](100) NULL,
	[AsuntoDetallado] [varchar](500) NULL,
	[IpComputadora] [varchar](15) NOT NULL,
	[CantidadCambios] [tinyint] NULL,
	[IdClasificador] [tinyint] NOT NULL,
	[IdRespuesta] [tinyint] NOT NULL,
	[DetalleRespuesta] [varchar](500) NULL,
	[FechaHoraRespuesta] [datetime] NULL,
	[IdUsuarioRespuesta] [int] NULL,
	[IpComputadoraRespuesta] [varchar](15) NULL,
 CONSTRAINT [PK__Boleta__362F6EB689344EDB] PRIMARY KEY CLUSTERED 
(
	[IdBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasificador]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificador](
	[IdClasificador] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdClasificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IdDepartamento] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[IdBoleta] [int] NOT NULL,
	[Linea] [int] IDENTITY(1,1) NOT NULL,
	[EvidenciaArchivo] [varchar](450) NOT NULL,
	[Detalle] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBoleta] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestaLegal]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestaLegal](
	[IdRespuesta] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[IdSession] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IpComputadora] [varchar](15) NOT NULL,
	[fechaSession] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[IdSexo] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](15) NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[IdSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/5/2021 20:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellidos] [varchar](150) NOT NULL,
	[IdSexo] [tinyint] NOT NULL,
	[Cedula] [int] NOT NULL,
	[Foto] [varchar](150) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[IdDepartamento] [tinyint] NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Celular] [varchar](8) NOT NULL,
	[Contrasenia] [varchar](25) NOT NULL,
 CONSTRAINT [PK__Usuario__645723A633DD7E23] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clasificador] ON 

INSERT [dbo].[Clasificador] ([IdClasificador], [Descripcion]) VALUES (1, N'ClasificadorUno')
SET IDENTITY_INSERT [dbo].[Clasificador] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([IdDepartamento], [Descripcion]) VALUES (1, N'Departamento Legal')
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([IdSession], [IdUsuario], [IpComputadora], [fechaSession]) VALUES (1, 1, N'201.192.219.187', CAST(N'2021-05-03T02:05:10.153' AS DateTime))
INSERT [dbo].[Session] ([IdSession], [IdUsuario], [IpComputadora], [fechaSession]) VALUES (2, 1, N'201.192.219.187', CAST(N'2021-05-03T02:06:29.647' AS DateTime))
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Sexo] ON 

INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (1, N'Femenino')
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (2, N'Masculina')
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (3, N'Otro')
SET IDENTITY_INSERT [dbo].[Sexo] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [Nombre], [Apellidos], [IdSexo], [Cedula], [Foto], [FechaNacimiento], [IdDepartamento], [Correo], [Celular], [Contrasenia]) VALUES (1, N'Justin', N'Villalobos', 2, 702720202, N'null.png', CAST(N'1999-11-01' AS Date), 1, N'justin@gmail.com', N'64484040', N'Justin1234..')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_Boleta_Clasificador] FOREIGN KEY([IdClasificador])
REFERENCES [dbo].[Clasificador] ([IdClasificador])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_Boleta_Clasificador]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_Boleta_Respuesta] FOREIGN KEY([IdRespuesta])
REFERENCES [dbo].[RespuestaLegal] ([IdRespuesta])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_Boleta_Respuesta]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_Boleta_UsuarioD] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_Boleta_UsuarioD]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_Boleta_UsuarioR] FOREIGN KEY([IdUsuarioRespuesta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_Boleta_UsuarioR]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Boleta] FOREIGN KEY([IdBoleta])
REFERENCES [dbo].[Boleta] ([IdBoleta])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_Boleta]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_User] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_User]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Departamento]
GO
/****** Object:  StoredProcedure [dbo].[sp_Clasificador_delete]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Clasificador_delete]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from Clasificador where IdClasificador=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Clasificador_insertar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Clasificador_insertar]
	--@id tinyint
	@Descripcion varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into Clasificador(Descripcion) values(@Descripcion);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Clasificador_list]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Clasificador_list]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Clasificador;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Clasificador_modificar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Clasificador_modificar]
	@idClasificador tinyint,
	@Descripcion varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update Clasificador set Descripcion=@Descripcion where IdClasificador=@idClasificador;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Clasificador_select_by_id]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Clasificador_select_by_id]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Clasificador where IdClasificador=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_delete]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Departamento_delete]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from Departamento where IdDepartamento=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_insertar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Departamento_insertar]
	@Descripcion varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into Departamento(Descripcion) values(@Descripcion);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_list]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Departamento_list]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Departamento;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_modificar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Departamento_modificar]
	@Descripcion varchar(15),
	@IdDepartamento tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update Departamento set Descripcion=@Descripcion where IdDepartamento=@IdDepartamento;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_select_by_id]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Departamento_select_by_id]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Departamento where IdDepartamento=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestaLegal_delete]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RespuestaLegal_delete]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from RespuestaLegal where IdRespuesta=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestaLegal_insertar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RespuestaLegal_insertar]
	--@id tinyint,
	@Descripcion varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into RespuestaLegal(Descripcion) values(@Descripcion);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestaLegal_list]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RespuestaLegal_list]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from RespuestaLegald;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestaLegal_modificar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RespuestaLegal_modificar]
	@id tinyint,
	@Descripcion varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update RespuestaLegal set Descripcion=@Descripcion where IdRespuesta=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RespuestaLegal_select_by_id]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RespuestaLegal_select_by_id]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from RespuestaLegal where IdRespuesta=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Session_insert]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Session_insert]
	 @IdUsuario int,
	 @IpComputadora varchar(15),
	 @FechaSession datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into Session(IdUsuario,IpComputadora,fechaSession) values(@IdUsuario,@IpComputadora,@FechaSession);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Session_list]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Session_list]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Session;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Session_select_by_id]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Session_select_by_id]
	 @id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Session where IdSession=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sexo_delete]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sexo_delete]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from Sexo where IdSexo=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sexo_insertar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sexo_insertar]
	@Descripcion varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into Sexo(Descripcion) values(@Descripcion);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sexo_list]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sexo_list]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Sexo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sexo_modificar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sexo_modificar]
	@Descripcion varchar(15),
	@IdSexo tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update Sexo set Descripcion=@Descripcion where IdSexo=@IdSexo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sexo_select_by_id]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sexo_select_by_id]
	@id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Sexo where IdSexo=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_delete]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_usuario_delete]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   delete from Usuario where idUsuario=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_insertar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_usuario_insertar]
	@Nombre varchar(100),@Apellidos varchar(150),@Cedula int,@IdSexo tinyint,
	@Foto varchar(150),@FechaNacimiento date, @IdDepartamento tinyint,
	@Correo varchar(100),@Celular varchar(8),@Contrasenia varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Usuario(Nombre, Apellidos, Cedula, IdSexo, Foto, FechaNacimiento, IdDepartamento, Correo, Celular, Contrasenia) VALUES(@Nombre, @Apellidos, @Cedula, @IdSexo, @Foto, @FechaNacimiento, @IdDepartamento, @Correo, @Celular, @Contrasenia)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_list]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_usuario_list]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT        idUsuario, Nombre, Apellidos, IdSexo, Cedula, Foto, FechaNacimiento, IdDepartamento, Correo, Celular, Contrasenia
FROM            Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_modificar]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_usuario_modificar]
	@IdUsuario int,@Nombre varchar(100),@Apellidos varchar(150),@Cedula int,@IdSexo tinyint,
	@Foto varchar(150),@FechaNacimiento date, @IdDepartamento tinyint,
	@Correo varchar(100),@Celular varchar(8),@Contrasenia varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update Usuario set Nombre=@Nombre, Apellidos=@Apellidos, Cedula=@Cedula, IdSexo=@IdSexo,Foto=@Foto, FechaNacimiento=@FechaNacimiento, IdDepartamento=@IdDepartamento, Correo=@Correo,Celular= @Celular, Contrasenia=@Contrasenia where idUsuario=@IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_select_by_cedula_id]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_usuario_select_by_cedula_id]
	-- Add the parameters for the stored procedure here
	@cedula int,
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Usuario.*,Departamento.Descripcion from Usuario inner join Departamento on Usuario.IdDepartamento=Departamento.IdDepartamento and Usuario.cedula=@cedula and Usuario.IdUsuario=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_select_by_Id]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_usuario_select_by_Id]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT        idUsuario, Nombre, Apellidos, IdSexo, Cedula, Foto, FechaNacimiento, IdDepartamento, Correo, Celular, Contrasenia
FROM            Usuario where idUsuario=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_select_by_sesion]    Script Date: 2/5/2021 20:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_usuario_select_by_sesion] 
	-- Add the parameters for the stored procedure here
	@correo varchar(100),
	@password varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Usuario where correo=@correo and Contrasenia=@password
END
GO
