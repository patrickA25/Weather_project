--- query used to make the data table
USE [weather_database]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[raw_data](
	[stations_name] [varchar](50) NOT NULL,
	[PRCP] [varchar](50) NULL,
	[SNOW] [varchar](50) NULL,
	[SNWD] [varchar](50) NULL,
	[TAVG] [varchar](50) NULL,
	[TMAX] [varchar](50) NULL,
	[TMIN] [varchar](50) NULL,
	[DATE] [varchar](15) NOT NULL
) ON [PRIMARY]
GO

-- need to find a for to go through all of the files and load them one at
-- at a time.
-- this will get all of the files in the directory.
EXEC xp_dirtree 'g:/Weather_data/3_read_to_load/', 2, 1

BULK INSERT [weather_database].[dbo].[raw_data]
    FROM 'G:/Weather_data/3_read_to_load/2020_upload_ready.csv'
    WITH
    (
	KEEPNULLS,
	firstrow = 2,
    FIELDTERMINATOR = '|',  --CSV field delimiter
    ROWTERMINATOR = '0x0a'   --Use to shift the control to next row
    )
go

