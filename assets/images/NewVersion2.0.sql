USE [master]
GO
/****** Object:  Database [FreeFitDB]    Script Date: 9/12/2022 2:52:46 PM ******/
CREATE DATABASE [FreeFitDB]
GO

USE [FreeFitDB]
GO

CREATE TABLE [dbo].[Activity](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Comment] [nvarchar](50) NULL,
	[ActiStatus] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Description] [nvarchar](255),
	[CustomerId] int NOT NULL,
	[PtId] int NOT NULL,
)
GO

CREATE TABLE [dbo].[Category](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Name] [nvarchar](50),
)
GO

CREATE TABLE [dbo].[Club](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Address] [nvarchar](50) NOT NULL,
	[Area] [nvarchar](255) NOT NULL,
	[ManagerName] [nvarchar](255) NOT NULL,
 )
GO

CREATE TABLE [dbo].[Course](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Target] [nvarchar](255) NOT NULL,
	[PackageId] int NOT NULL,
)
GO

CREATE TABLE [dbo].[Customer](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Name] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50),
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Target] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Weight] int NULL,
	[Height] int NULL,
	[DateOfBirth] int,
	[Status] [int] NOT NULL,
	[ClubId] int NOT NULL,
	[PackageId] int NOT NULL,
)
GO

CREATE TABLE [dbo].[Exercise](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[ImageId] int,
	[ExerciseModeId] int NOT NULL,
)
GO

CREATE TABLE [dbo].[ExerciseMode](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[ExerciseName]  [nvarchar](255) not null,
	[SessionId] int NOT NULL,
 )
GO

CREATE TABLE [dbo].[Feedback](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Description] [nvarchar](50) NULL,
	[CustomerId] int NOT NULL,
	[PtId] int NOT NULL,
	[SessionId] int not null,
)
GO

CREATE TABLE [dbo].[Image](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Photo] text not null,
	[SessionId] int,
	[FeedbackId] int,
)
GO

CREATE TABLE [dbo].[Measure](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[CustomerId] int NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[PtId] int NOT NULL,
)
GO
/****** Object:  Table [dbo].[MeasureDetail]    Script Date: 9/12/2022 2:52:47 PM ******/
CREATE TABLE [dbo].[MeasureDetail](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[MeasureId] int NOT NULL,
	[MetricId] int NOT NULL,
	[Value] [nvarchar](50) NOT NULL
) 
GO
CREATE TABLE [dbo].[Metric](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[CategoryId] int NOT NULL,
	[ReportId] int NOT NULL,
 )
GO
/****** Object:  Table [dbo].[Package]    Script Date: 9/12/2022 2:52:47 PM ******/
CREATE TABLE [dbo].[Package](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Type] [nvarchar](255) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[NumberSessions] [int] NULL,
 )
GO

CREATE TABLE [dbo].[PersonTrainer](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Name] nvarchar(50) not null,
	[Phone] nvarchar(50) not null,
	[Rate] int not null,
	[Address] [nvarchar](255) not null,
	[ClubId] int,
 )
GO

CREATE TABLE [dbo].[Session](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Date] [datetime] NOT NULL,
	[Time] [datetime] NOT NULL,
	[PTId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClubId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CheckInUser] [datetime] NULL,
	[CheckOutUser] [datetime] NULL,
	[CheckInPt] [datetime] NULL,
	[CheckOutPt] [datetime] NULL,
	[ClassRoom] [int] NULL,
 )
GO

CREATE TABLE [dbo].[Step](
	[Id] INT IDENTITY(1,1)  NOT NULL PRIMARY KEY  ,
	[Video] text not null,
	[Name] nvarchar(255) not null,
	[ExerciseId] int NOT NULL,
	[ImageId] int  not null ,
)
GO
ALTER TABLE [dbo].[Activity]   ADD  CONSTRAINT [FK_Activity_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO

ALTER TABLE [dbo].[Activity]   ADD  CONSTRAINT [FK_Activity_PersonTrainer] FOREIGN KEY([PtId])
REFERENCES [dbo].[PersonTrainer] ([Id])
GO

ALTER TABLE [dbo].[Course]   ADD CONSTRAINT [FK_Course_Package] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([Id])
GO
ALTER TABLE [dbo].[Customer]  ADD CONSTRAINT [FK_Customer_Club] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Club] ([Id])
GO

ALTER TABLE [dbo].[Customer]   ADD CONSTRAINT [FK_Customer_Package] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([Id])
GO

ALTER TABLE [dbo].[Exercise]   ADD  CONSTRAINT [FK_Exercise_ExerciseMode] FOREIGN KEY([ExerciseModeId])
REFERENCES [dbo].[ExerciseMode] ([Id])
GO
ALTER TABLE [dbo].[Exercise]   ADD  CONSTRAINT [FK_Exercise_Image] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([Id])
GO
ALTER TABLE [dbo].[ExerciseMode]   ADD  CONSTRAINT [FK_ExerciseMode_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[Feedback]  ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO

ALTER TABLE [dbo].[Feedback]   ADD  CONSTRAINT [FK_Feedback_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO

ALTER TABLE [dbo].[Feedback]   ADD  CONSTRAINT [FK_Feedback_PersonTrainer] FOREIGN KEY([PtId])
REFERENCES [dbo].[PersonTrainer] ([Id])
GO

ALTER TABLE [dbo].[Image]  ADD  CONSTRAINT [FK_Image_Feedback] FOREIGN KEY([FeedbackId])
REFERENCES [dbo].[Feedback] ([Id])
GO

ALTER TABLE [dbo].[Image]  ADD  CONSTRAINT [FK_Image_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO

ALTER TABLE [dbo].[Measure]   ADD  CONSTRAINT [FK_Measure_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO

ALTER TABLE [dbo].[Measure]  ADD  CONSTRAINT [FK_Measure_PersonTrainer] FOREIGN KEY([PtId])
REFERENCES [dbo].[PersonTrainer] ([Id])
GO

ALTER TABLE [dbo].[MeasureDetail]   ADD  CONSTRAINT [FK_MeasureDetail_Measure] FOREIGN KEY([MeasureId])
REFERENCES [dbo].[Measure] ([Id])
GO

ALTER TABLE [dbo].[MeasureDetail]  ADD  CONSTRAINT [FK_MeasureDetail_Metric] FOREIGN KEY([MetricId])
REFERENCES [dbo].[Metric] ([Id])
GO

ALTER TABLE [dbo].[Metric]   ADD  CONSTRAINT [FK_Metric_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO

ALTER TABLE [dbo].[Session]   ADD  CONSTRAINT [FK_Session_Club] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Club] ([Id])
GO

ALTER TABLE [dbo].[Session]   ADD  CONSTRAINT [FK_Session_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO

ALTER TABLE [dbo].[Session]  ADD  CONSTRAINT [FK_Session_PersonTrainer] FOREIGN KEY([PTId])
REFERENCES [dbo].[PersonTrainer] ([Id])
GO

ALTER TABLE [dbo].[Step]  ADD  CONSTRAINT [FK_Step_Exercise] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercise] ([Id])
GO

ALTER TABLE [dbo].[Step]  ADD  CONSTRAINT [FK_Step_Image] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([Id])
GO

ALTER TABLE [dbo].[PersonTrainer]  ADD  CONSTRAINT [FK_PersonTrainer_Club] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Club] ([Id])
GO



