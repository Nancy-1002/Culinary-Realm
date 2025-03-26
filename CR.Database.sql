USE [master]
GO
/****** Object:  Database [CR]    Script Date: 25-03-2025 12:58:06 ******/
CREATE DATABASE [CR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CR', FILENAME = N'/var/opt/mssql/data/CR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CR_log', FILENAME = N'/var/opt/mssql/data/CR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CR] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CR] SET ARITHABORT OFF 
GO
ALTER DATABASE [CR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CR] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CR] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CR] SET  MULTI_USER 
GO
ALTER DATABASE [CR] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [CR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CR', N'ON'
GO
ALTER DATABASE [CR] SET QUERY_STORE = ON
GO
ALTER DATABASE [CR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
ALTER DATABASE [CR] SET  READ_WRITE 
GO
