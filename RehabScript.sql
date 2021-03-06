USE [master]
GO
/****** Object:  Database [Rehab]    Script Date: 12/5/2018 9:47:33 PM ******/
CREATE DATABASE [Rehab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rehab', FILENAME = N'C:\Users\Developer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Rehab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rehab_log', FILENAME = N'C:\Users\Developer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Rehab.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Rehab] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rehab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rehab] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Rehab] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Rehab] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Rehab] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Rehab] SET ARITHABORT ON 
GO
ALTER DATABASE [Rehab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rehab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rehab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rehab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rehab] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Rehab] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Rehab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rehab] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Rehab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rehab] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rehab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rehab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rehab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rehab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rehab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rehab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rehab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rehab] SET RECOVERY FULL 
GO
ALTER DATABASE [Rehab] SET  MULTI_USER 
GO
ALTER DATABASE [Rehab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rehab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rehab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rehab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rehab] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rehab] SET QUERY_STORE = OFF
GO
USE [Rehab]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Rehab]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/5/2018 9:47:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SSN] [nvarchar](9) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Created] [date] NULL,
	[Modified] [date] NULL,
 CONSTRAINT [PK__Contact__3214EC07FEA9FFCD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[TreatmentCode] [nvarchar](20) NULL,
	[TreatmentStart] [date] NULL,
	[TreatmentEnd] [date] NULL,
	[History] [nvarchar](4000) NULL,
	[Development] [nvarchar](4000) NULL,
	[TherapistName] [nvarchar](500) NULL,
	[ProviderNumber] [nvarchar](500) NULL,
	[PhysicianName] [nvarchar](500) NULL,
	[DateSingned] [date] NULL,
	[AuthorizationNumber] [nvarchar](500) NULL,
	[Recomendations] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Created] [date] NOT NULL,
	[Modified] [date] NOT NULL,
 CONSTRAINT [PK_Eval] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation_Assesment]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation_Assesment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvalId] [int] NOT NULL,
	[Assesment] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Eval_Assesment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation_TestAdmin]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation_TestAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[TestAdminId] [int] NOT NULL,
 CONSTRAINT [PK_Evaluation_TestAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation_TherapMethod]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation_TherapMethod](
	[EvalId] [int] NOT NULL,
	[TherapyMethodId] [int] NOT NULL,
 CONSTRAINT [PK_Evaluation_TherapMethod] PRIMARY KEY CLUSTERED 
(
	[EvalId] ASC,
	[TherapyMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation_TreatmentMethod]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation_TreatmentMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[TreatmentMethodId] [int] NOT NULL,
 CONSTRAINT [PK_Eval_TreatmentMeth] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationGoal]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationGoal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[Name] [nvarchar](4000) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Eval_Goals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationNote]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationNote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[Note] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_Eval_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NOT NULL,
	[Insurance] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK__Patient__3214EC0793C1CC68] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgressNote]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgressNote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[TherapistName] [nvarchar](100) NOT NULL,
	[TherapyType] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[TreatmentUnit] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Created] [date] NOT NULL,
	[Modified] [date] NOT NULL,
 CONSTRAINT [PK_ProgressNote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgressNote_EvaluationGoal]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgressNote_EvaluationGoal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationGoalId] [int] NOT NULL,
	[ProgressNoteId] [int] NOT NULL,
	[Value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProgressNote_Goal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgressNote_Note]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgressNote_Note](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProgressNoteId] [int] NULL,
	[Response] [nchar](10) NULL,
 CONSTRAINT [PK_ProgressNote_Response] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgressNote_Treatment]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgressNote_Treatment](
	[EvalTreatmentId] [int] NOT NULL,
	[ProgressNoteId] [int] NOT NULL,
	[Value] [nchar](10) NULL,
 CONSTRAINT [PK_ProgressNote_Treatment] PRIMARY KEY CLUSTERED 
(
	[EvalTreatmentId] ASC,
	[ProgressNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestAdmin]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Test] [nvarchar](100) NOT NULL,
	[Tx] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TherapyMethod]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapyMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TherapyMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TreatmentModality]    Script Date: 12/5/2018 9:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreatmentModality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TreatmentModality] [nvarchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TreatmentModality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Evaluation_TestAdmin]    Script Date: 12/5/2018 9:47:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Evaluation_TestAdmin] ON [dbo].[Evaluation_TestAdmin]
(
	[EvaluationId] ASC,
	[TestAdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgressNote_Goal]    Script Date: 12/5/2018 9:47:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProgressNote_Goal] ON [dbo].[ProgressNote_EvaluationGoal]
(
	[EvaluationGoalId] ASC,
	[ProgressNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[TherapyMethod] ADD  CONSTRAINT [DF_TherapyMethod_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_Patient]
GO
ALTER TABLE [dbo].[Evaluation_Assesment]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Assesment_Evaluation] FOREIGN KEY([EvalId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[Evaluation_Assesment] CHECK CONSTRAINT [FK_Evaluation_Assesment_Evaluation]
GO
ALTER TABLE [dbo].[Evaluation_TestAdmin]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_TestAdmin_Evaluation] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[Evaluation_TestAdmin] CHECK CONSTRAINT [FK_Evaluation_TestAdmin_Evaluation]
GO
ALTER TABLE [dbo].[Evaluation_TestAdmin]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_TestAdmin_NTestAdmin] FOREIGN KEY([TestAdminId])
REFERENCES [dbo].[TestAdmin] ([Id])
GO
ALTER TABLE [dbo].[Evaluation_TestAdmin] CHECK CONSTRAINT [FK_Evaluation_TestAdmin_NTestAdmin]
GO
ALTER TABLE [dbo].[Evaluation_TherapMethod]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_TherapMethod_Evaluation] FOREIGN KEY([EvalId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[Evaluation_TherapMethod] CHECK CONSTRAINT [FK_Evaluation_TherapMethod_Evaluation]
GO
ALTER TABLE [dbo].[Evaluation_TherapMethod]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_TherapMethod_NTherapyMethod] FOREIGN KEY([TherapyMethodId])
REFERENCES [dbo].[TherapyMethod] ([Id])
GO
ALTER TABLE [dbo].[Evaluation_TherapMethod] CHECK CONSTRAINT [FK_Evaluation_TherapMethod_NTherapyMethod]
GO
ALTER TABLE [dbo].[Evaluation_TreatmentMethod]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_TreatmentModality_Evaluation] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[Evaluation_TreatmentMethod] CHECK CONSTRAINT [FK_Evaluation_TreatmentModality_Evaluation]
GO
ALTER TABLE [dbo].[Evaluation_TreatmentMethod]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_TreatmentModality_NTreatmentModality] FOREIGN KEY([TreatmentMethodId])
REFERENCES [dbo].[TreatmentModality] ([Id])
GO
ALTER TABLE [dbo].[Evaluation_TreatmentMethod] CHECK CONSTRAINT [FK_Evaluation_TreatmentModality_NTreatmentModality]
GO
ALTER TABLE [dbo].[EvaluationGoal]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Goal_Evaluation] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[EvaluationGoal] CHECK CONSTRAINT [FK_Evaluation_Goal_Evaluation]
GO
ALTER TABLE [dbo].[EvaluationNote]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Note_Evaluation] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[EvaluationNote] CHECK CONSTRAINT [FK_Evaluation_Note_Evaluation]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Contact]
GO
ALTER TABLE [dbo].[ProgressNote]  WITH CHECK ADD  CONSTRAINT [FK_ProgressNote_Evaluation] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[ProgressNote] CHECK CONSTRAINT [FK_ProgressNote_Evaluation]
GO
ALTER TABLE [dbo].[ProgressNote_EvaluationGoal]  WITH CHECK ADD  CONSTRAINT [FK_ProgressNote_Goal_Evaluation_Goal] FOREIGN KEY([EvaluationGoalId])
REFERENCES [dbo].[EvaluationGoal] ([Id])
GO
ALTER TABLE [dbo].[ProgressNote_EvaluationGoal] CHECK CONSTRAINT [FK_ProgressNote_Goal_Evaluation_Goal]
GO
ALTER TABLE [dbo].[ProgressNote_EvaluationGoal]  WITH CHECK ADD  CONSTRAINT [FK_ProgressNote_Goal_ProgressNote] FOREIGN KEY([ProgressNoteId])
REFERENCES [dbo].[ProgressNote] ([Id])
GO
ALTER TABLE [dbo].[ProgressNote_EvaluationGoal] CHECK CONSTRAINT [FK_ProgressNote_Goal_ProgressNote]
GO
ALTER TABLE [dbo].[ProgressNote_Note]  WITH CHECK ADD  CONSTRAINT [FK_ProgressNote_Note_ProgressNote] FOREIGN KEY([ProgressNoteId])
REFERENCES [dbo].[ProgressNote] ([Id])
GO
ALTER TABLE [dbo].[ProgressNote_Note] CHECK CONSTRAINT [FK_ProgressNote_Note_ProgressNote]
GO
ALTER TABLE [dbo].[ProgressNote_Treatment]  WITH CHECK ADD  CONSTRAINT [FK_ProgressNote_Treatment_Evaluation_TreatmentModality] FOREIGN KEY([EvalTreatmentId])
REFERENCES [dbo].[Evaluation_TreatmentMethod] ([Id])
GO
ALTER TABLE [dbo].[ProgressNote_Treatment] CHECK CONSTRAINT [FK_ProgressNote_Treatment_Evaluation_TreatmentModality]
GO
ALTER TABLE [dbo].[ProgressNote_Treatment]  WITH CHECK ADD  CONSTRAINT [FK_ProgressNote_Treatment_ProgressNote] FOREIGN KEY([ProgressNoteId])
REFERENCES [dbo].[ProgressNote] ([Id])
GO
ALTER TABLE [dbo].[ProgressNote_Treatment] CHECK CONSTRAINT [FK_ProgressNote_Treatment_ProgressNote]
GO
USE [master]
GO
ALTER DATABASE [Rehab] SET  READ_WRITE 
GO
