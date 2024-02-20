USE [master]
GO
/****** Object:  Database [dbHospital]    Script Date: 20.02.2024 12:13:12 ******/
CREATE DATABASE [dbHospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbHospital', FILENAME = N'D:\servermssqla\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbHospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbHospital_log', FILENAME = N'D:\servermssqla\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbHospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbHospital] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbHospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbHospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbHospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbHospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbHospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbHospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbHospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbHospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbHospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbHospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbHospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbHospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbHospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbHospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbHospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbHospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbHospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbHospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbHospital] SET  MULTI_USER 
GO
ALTER DATABASE [dbHospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbHospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbHospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbHospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbHospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbHospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbHospital] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbHospital] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbHospital]
GO
/****** Object:  Table [dbo].[CodeHospitalization]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeHospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[PurposeHospitalization] [nvarchar](50) NOT NULL,
	[DepartmentHospitalization] [nvarchar](50) NOT NULL,
	[IDTypeHospitalization] [int] NOT NULL,
	[TermHospitalization] [nvarchar](50) NOT NULL,
	[AdditionalInformation] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_CodeHospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiseaseHistory]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiseaseHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameDisease] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[DateOfDisease] [date] NOT NULL,
 CONSTRAINT [PK_DiseaseHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[IDGender] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IDSpeciality] [int] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPatient] [int] NOT NULL,
	[IDCodeHospitalization] [int] NOT NULL,
	[DateOfHospitalization] [date] NOT NULL,
	[TimeOfHospitalization] [time](7) NOT NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranseCompany]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranseCompany](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InsuranseCompany] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuransePolicy]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuransePolicy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](25) NOT NULL,
	[DateOfExpiration] [date] NOT NULL,
 CONSTRAINT [PK_InsuransePolicy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCard]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](25) NOT NULL,
	[DateOfIssue] [date] NOT NULL,
	[DateOfLastApeal] [date] NOT NULL,
	[DateOfNextApeal] [date] NOT NULL,
	[IdentificationCode] [nvarchar](50) NULL,
	[PathQRCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_MedicalCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesPassport] [nvarchar](50) NOT NULL,
	[NumberPassport] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Passport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[IDPassport] [int] NOT NULL,
	[DateOfBirth] [date] NULL,
	[IDGender] [int] NULL,
	[Adress] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[IDMedicalCard] [int] NULL,
	[IDInsuransePolicy] [int] NOT NULL,
	[Diagnos] [nvarchar](50) NULL,
	[IDDiseaseHistory] [int] NULL,
	[IDInsuranseCompany] [int] NOT NULL,
	[WorkPlace] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultEvent]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ValueAnalyses] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[PrescribedMedications] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ResultEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TherapeuticDiagnosticMeasures]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapeuticDiagnosticMeasures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPatient] [int] NOT NULL,
	[IDDoctor] [int] NOT NULL,
	[IDTypeEvent] [int] NOT NULL,
	[NameEvent] [nvarchar](50) NOT NULL,
	[IDResultEvent] [int] NOT NULL,
	[Recomendation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TherapeuticDiagnosticMeasures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeEvent]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeHospitalization]    Script Date: 20.02.2024 12:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeHospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeHospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CodeHospitalization]  WITH CHECK ADD  CONSTRAINT [FK_CodeHospitalization_TypeHospitalization] FOREIGN KEY([IDTypeHospitalization])
REFERENCES [dbo].[TypeHospitalization] ([ID])
GO
ALTER TABLE [dbo].[CodeHospitalization] CHECK CONSTRAINT [FK_CodeHospitalization_TypeHospitalization]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Gender]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Speciality] FOREIGN KEY([IDSpeciality])
REFERENCES [dbo].[Speciality] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Speciality]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_CodeHospitalization] FOREIGN KEY([IDCodeHospitalization])
REFERENCES [dbo].[CodeHospitalization] ([ID])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_CodeHospitalization]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_DiseaseHistory] FOREIGN KEY([IDDiseaseHistory])
REFERENCES [dbo].[DiseaseHistory] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_DiseaseHistory]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Gender]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuranseCompany] FOREIGN KEY([IDInsuranseCompany])
REFERENCES [dbo].[InsuranseCompany] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuranseCompany]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuransePolicy] FOREIGN KEY([IDInsuransePolicy])
REFERENCES [dbo].[InsuransePolicy] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuransePolicy]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_MedicalCard] FOREIGN KEY([IDMedicalCard])
REFERENCES [dbo].[MedicalCard] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_MedicalCard]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Passport] FOREIGN KEY([IDPassport])
REFERENCES [dbo].[Passport] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Passport]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Doctor] FOREIGN KEY([IDDoctor])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Doctor]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Patient]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_ResultEvent] FOREIGN KEY([IDResultEvent])
REFERENCES [dbo].[ResultEvent] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_ResultEvent]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_TypeEvent] FOREIGN KEY([IDTypeEvent])
REFERENCES [dbo].[TypeEvent] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_TypeEvent]
GO
USE [master]
GO
ALTER DATABASE [dbHospital] SET  READ_WRITE 
GO
