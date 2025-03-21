USE [master]
GO
/****** Object:  Database [ff]    Script Date: 1/2/2019 11:41:03 AM ******/
CREATE DATABASE [ff]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ff', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ff.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ff_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ff_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ff] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ff].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ff] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ff] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ff] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ff] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ff] SET ARITHABORT OFF 
GO
ALTER DATABASE [ff] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ff] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ff] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ff] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ff] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ff] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ff] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ff] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ff] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ff] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ff] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ff] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ff] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ff] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ff] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ff] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ff] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ff] SET RECOVERY FULL 
GO
ALTER DATABASE [ff] SET  MULTI_USER 
GO
ALTER DATABASE [ff] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ff] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ff] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ff] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ff] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ff', N'ON'
GO
ALTER DATABASE [ff] SET QUERY_STORE = OFF
GO
USE [ff]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ff]
GO
/****** Object:  UserDefinedFunction [dbo].[goal]    Script Date: 1/2/2019 11:41:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[goal](@player_id numeric,@date_start date,@date_end date,@category char(1))  
RETURNS int   
AS   
  
BEGIN  
    declare @number_goal int;
select @number_goal=sum(p.number_goal)
from goal_warning_ p
where p.player_id=@player_id  and @date_end=p.date_end and @date_start=p.date_start and @category=p.category
   
    RETURN @number_goal;  
END;  


GO
/****** Object:  UserDefinedFunction [dbo].[goaldiff]    Script Date: 1/2/2019 11:41:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[goaldiff](@team_id numeric,@date_start date,@date_end date,@category char(1))  
RETURNS int   
AS   
  
BEGIN  
    DECLARE @sum_goalfor int,@sum_goalagnst int,@goaldiff int;
 select @sum_goalfor = SUM(p.goal_for),@sum_goalagnst=SUM(p.goal_agnst)
  from season p
  where p.team_id=@team_id and @date_end=p.date_end and @date_start=p.date_start and @category=p.category
  set @goaldiff=@sum_goalfor-@sum_goalagnst
  if (@goaldiff is null)
  set @goaldiff=0;
    RETURN @goaldiff;  
END;  

GO
/****** Object:  UserDefinedFunction [dbo].[point_]    Script Date: 1/2/2019 11:41:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[point_]
(
	-- Add the parameters for the function here
	@team_id numeric ,@match_id numeric
)
RETURNS  int
AS
BEGIN
declare @ntw int , @ntl int,@nta int,@result int
select @ntw= count(team_id_won) from detail_match
where team_id_won=@team_id and detail_match.match_id=@match_id;
select @ntl= count(team_id_lost) from detail_match
where team_id_lost=@team_id  and detail_match.match_id=@match_id;
select @nta= count(team_id_lost) from detail_match
where team_id_lost=@team_id and team_id_won=@team_id  and detail_match.match_id=@match_id ;
select @result=3*@ntw + @nta
return @result
End;
GO
/****** Object:  Table [dbo].[season]    Script Date: 1/2/2019 11:41:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[season](
	[date_start] [date] NULL,
	[date_end] [date] NULL,
	[category] [char](1) NULL,
	[season_id] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_season] PRIMARY KEY CLUSTERED 
(
	[season_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[tablepoint]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tablepoint] (@date_start date,@date_end date,@category char(1))  
RETURNS TABLE  
AS  
RETURN   
(  
    select p.team_id,dbo.point(p.team_id,p.date_start,p.date_end,p.category) as points
   from season as p
    where date_end=p.date_end and @date_start=p.date_start and @category=p.category
    
    --order BY  sum_goal
);  
GO
/****** Object:  Table [dbo].[player]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[player](
	[player_id] [numeric](18, 0) NOT NULL,
	[player_name] [varchar](40) NULL,
	[player_lastname] [varchar](40) NULL,
	[city_id] [numeric](18, 0) NULL,
	[BirthYear] [int] NULL,
	[email] [varchar](50) NULL,
	[date_start_football] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[player that have 2 goals]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[player that have 2 goals] AS
 
SELECT player_name,number_goal
 
FROM player inner join goal_warning_ on(goal_warning_.player_id=player.player_id)
 
WHERE number_goal =2
GO
/****** Object:  View [dbo].[player that have above 2 warnings]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[player that have above 2 warnings] AS
 
SELECT player_name,player_lastname,number_warning
 
FROM player inner join goal_warning_ on(goal_warning_.player_id=player.player_id)
 
WHERE number_warning >2
GO
/****** Object:  Table [dbo].[referee]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[referee](
	[referee_id] [numeric](18, 0) NOT NULL,
	[city_id] [numeric](18, 0) NULL,
	[referee_name] [varchar](40) NULL,
	[referee_lastname] [varchar](40) NULL,
	[referee_level] [int] NULL,
	[BirthYear] [int] NULL,
	[date_start_referee] [date] NULL,
	[reffree_or_asstreferee] [int] NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[referee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ranking referee_]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ranking referee_] AS
 
SELECT category,referee_name,referee_lastname
 
FROM referee inner join match_referee on(referee_id=referee_id)
 inner join season on(match_id=match_id)
 
GO
/****** Object:  UserDefinedFunction [dbo].[tablegoal]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tablegoal] (@date_start date,@date_end date,@category char(1))  
RETURNS TABLE  
AS  
RETURN   
(  
    select p.player_id,dbo.goal(p.player_id,p.date_start,p.date_end,p.category) as sum_goal
   from goal_warning_ as p
    where date_end=p.date_end and @date_start=p.date_start and @category=p.category
    
    --order BY  sum_goal
);  
GO
/****** Object:  Table [dbo].[city]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[country_id] [numeric](18, 0) NULL,
	[city_id] [numeric](18, 0) NOT NULL,
	[city_name] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coach]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coach](
	[coach_id] [numeric](18, 0) NOT NULL,
	[city_id] [numeric](18, 0) NULL,
	[coach_name] [varchar](40) NULL,
	[coach_lastname] [varchar](40) NULL,
	[coach_level] [int] NULL,
	[BirthYear] [int] NULL,
	[date_start_Coaching] [date] NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[coach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[country_id] [numeric](18, 0) NOT NULL,
	[country_name] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_goal]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_goal](
	[match_id] [numeric](18, 0) NULL,
	[goal_id] [int] NOT NULL,
	[player_id] [numeric](18, 0) NULL,
	[goal_time] [varchar](30) NULL,
	[goal_type] [char](1) NULL,
 CONSTRAINT [PK_goal] PRIMARY KEY CLUSTERED 
(
	[goal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_match]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_match](
	[team_id_won] [numeric](18, 0) NULL,
	[result] [numeric](18, 0) NULL,
	[team_id_lost] [numeric](18, 0) NULL,
	[point_judgment] [int] NULL,
	[match_id] [numeric](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_warning]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_warning](
	[match_id] [numeric](18, 0) NULL,
	[warning_id] [int] NOT NULL,
	[player_id] [numeric](18, 0) NULL,
	[warning_type] [varchar](30) NULL,
	[warning_time] [varchar](30) NULL,
 CONSTRAINT [PK_war] PRIMARY KEY CLUSTERED 
(
	[warning_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[match]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[match](
	[match_id] [numeric](18, 0) NOT NULL,
	[stage] [char](1) NULL,
	[team1_id] [numeric](18, 0) NULL,
	[team2_id] [numeric](18, 0) NULL,
	[stadium_id] [numeric](18, 0) NULL,
	[match_date] [date] NULL,
	[season_id] [numeric](18, 0) NULL,
	[id_referee] [numeric](18, 0) NULL,
	[id_assist_referee1] [numeric](18, 0) NULL,
	[id_assist_referee2] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personnel]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel](
	[personnel_id] [numeric](18, 0) NOT NULL,
	[personnel_name] [varchar](40) NULL,
	[personnel_lastname] [varchar](40) NULL,
	[city_id] [numeric](18, 0) NULL,
	[BirthYear] [int] NULL,
	[email] [varchar](50) NULL,
	[titel] [varchar](20) NULL,
	[date_start_working] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[personnel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stadium]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadium](
	[Stadium_id] [numeric](18, 0) NOT NULL,
	[city_id] [numeric](18, 0) NULL,
	[Stadium_name] [varchar](40) NULL,
	[capacity] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Stadium_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team](
	[team_id] [numeric](18, 0) NOT NULL,
	[city_id] [numeric](18, 0) NULL,
	[team_name] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team_coach]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_coach](
	[id_team] [numeric](18, 0) NOT NULL,
	[id_coach] [numeric](18, 0) NOT NULL,
	[id_season] [numeric](18, 0) NOT NULL,
	[amount_] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_team] ASC,
	[id_coach] ASC,
	[id_season] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team_player]    Script Date: 1/2/2019 11:41:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_player](
	[id_team] [numeric](18, 0) NOT NULL,
	[id_player] [numeric](18, 0) NOT NULL,
	[id_season] [numeric](18, 0) NOT NULL,
	[amount_] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_team] ASC,
	[id_player] ASC,
	[id_season] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
GO
ALTER TABLE [dbo].[coach]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[detail_goal]  WITH CHECK ADD FOREIGN KEY([match_id])
REFERENCES [dbo].[match] ([match_id])
GO
ALTER TABLE [dbo].[detail_goal]  WITH CHECK ADD  CONSTRAINT [FK_goal2] FOREIGN KEY([player_id])
REFERENCES [dbo].[player] ([player_id])
GO
ALTER TABLE [dbo].[detail_goal] CHECK CONSTRAINT [FK_goal2]
GO
ALTER TABLE [dbo].[detail_match]  WITH CHECK ADD FOREIGN KEY([match_id])
REFERENCES [dbo].[match] ([match_id])
GO
ALTER TABLE [dbo].[detail_match]  WITH CHECK ADD FOREIGN KEY([team_id_lost])
REFERENCES [dbo].[team] ([team_id])
GO
ALTER TABLE [dbo].[detail_match]  WITH CHECK ADD FOREIGN KEY([team_id_won])
REFERENCES [dbo].[team] ([team_id])
GO
ALTER TABLE [dbo].[detail_warning]  WITH CHECK ADD FOREIGN KEY([match_id])
REFERENCES [dbo].[match] ([match_id])
GO
ALTER TABLE [dbo].[detail_warning]  WITH CHECK ADD  CONSTRAINT [FK_war2] FOREIGN KEY([player_id])
REFERENCES [dbo].[player] ([player_id])
GO
ALTER TABLE [dbo].[detail_warning] CHECK CONSTRAINT [FK_war2]
GO
ALTER TABLE [dbo].[match]  WITH CHECK ADD FOREIGN KEY([id_assist_referee1])
REFERENCES [dbo].[referee] ([referee_id])
GO
ALTER TABLE [dbo].[match]  WITH CHECK ADD FOREIGN KEY([id_assist_referee2])
REFERENCES [dbo].[referee] ([referee_id])
GO
ALTER TABLE [dbo].[match]  WITH CHECK ADD FOREIGN KEY([id_referee])
REFERENCES [dbo].[referee] ([referee_id])
GO
ALTER TABLE [dbo].[match]  WITH CHECK ADD FOREIGN KEY([season_id])
REFERENCES [dbo].[season] ([season_id])
GO
ALTER TABLE [dbo].[match]  WITH CHECK ADD FOREIGN KEY([stadium_id])
REFERENCES [dbo].[Stadium] ([Stadium_id])
GO
ALTER TABLE [dbo].[match]  WITH CHECK ADD FOREIGN KEY([team1_id])
REFERENCES [dbo].[team] ([team_id])
GO
ALTER TABLE [dbo].[match]  WITH CHECK ADD FOREIGN KEY([team2_id])
REFERENCES [dbo].[team] ([team_id])
GO
ALTER TABLE [dbo].[personnel]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[player]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[referee]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[Stadium]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[team]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[team_coach]  WITH CHECK ADD FOREIGN KEY([id_coach])
REFERENCES [dbo].[coach] ([coach_id])
GO
ALTER TABLE [dbo].[team_coach]  WITH CHECK ADD FOREIGN KEY([id_season])
REFERENCES [dbo].[season] ([season_id])
GO
ALTER TABLE [dbo].[team_coach]  WITH CHECK ADD FOREIGN KEY([id_team])
REFERENCES [dbo].[team] ([team_id])
GO
ALTER TABLE [dbo].[team_player]  WITH CHECK ADD FOREIGN KEY([id_player])
REFERENCES [dbo].[player] ([player_id])
GO
ALTER TABLE [dbo].[team_player]  WITH CHECK ADD FOREIGN KEY([id_season])
REFERENCES [dbo].[season] ([season_id])
GO
ALTER TABLE [dbo].[team_player]  WITH CHECK ADD FOREIGN KEY([id_team])
REFERENCES [dbo].[team] ([team_id])
GO
USE [master]
GO
ALTER DATABASE [ff] SET  READ_WRITE 
GO
