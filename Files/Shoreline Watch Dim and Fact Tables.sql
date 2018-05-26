IF OBJECT_ID('[Shoreline Watch].dbo.Dim_Customers', 'U') IS NOT NULL
	DROP TABLE [Shoreline Watch].dbo.Dim_Customers;

CREATE TABLE [Shoreline Watch].dbo.Dim_Customers
(
	customer_key INT IDENTITY(1,1) PRIMARY KEY,
	customer_firstname VARCHAR(30) NOT NULL,
	customer_state VARCHAR(30)	   NOT NULL,
	customer_salary INT			   NOT NULL
);


IF OBJECT_ID('[Shoreline Watch].dbo.Dim_Watches', 'U') IS NOT NULL
	DROP TABLE [Shoreline Watch].dbo.Dim_Watches;

CREATE TABLE [Shoreline Watch].dbo.Dim_Watches
(
	watch_key	INT	IDENTITY(1,1) PRIMARY KEY,
	watch_name	VARCHAR(30)	NOT NULL,
	watch_brand	VARCHAR(20) NOT NULL,
	watch_type  VARCHAR(15) NOT NULL,
	watch_price	INT			NOT NULL
);

INSERT INTO [Shoreline Watch].dbo.Dim_Watches
	(watch_name, watch_brand, watch_type, watch_price)
VALUES
	('SKX007',	'Seiko', 'Diver',	'207'),
	('SARB033', 'Seiko', 'Dress',	'469'),
	('SKX009',	'Seiko', 'Diver',	'207'),
	('SARB017', 'Seiko', 'Field',	'489'),
	('SRPB51',	'Seiko', 'Diver',	'394'),
	('SARB065', 'Seiko', 'Dress',	'539'),
	('SNK809',	'Seiko', 'Field',	'97' ),
	('SRPB41',	'Seiko', 'Dress',	'338'),
	('SRPA21',	'Seiko', 'Diver',	'413'),
	('SNK807',	'Seiko', 'Field',	'97' ),
	('SBDC029',	'Seiko', 'Diver',	'999'),
	('SNZG15',	'Seiko', 'Field',	'129'),
	('SNE435',	'Seiko', 'Diver',	'297'),
	('SNZF17',	'Seiko', 'Diver',	'169'),
	('SARY055',	'Seiko', 'Dress',	'349'),
	('SNK795',	'Seiko', 'Dress',	'95' ),
	('SRP307',	'Seiko', 'Diver',	'239'),
	('SARX019',	'Seiko', 'Dress',	'729'),
	('SND255',	'Seiko', 'Chrono',	'165'),
	('SSB031',	'Seiko', 'Chrono',	'135'),
	('NH8363',	'Citizen', 'Dress',	'139'),
	('AW5000',	'Citizen', 'Field', '149'),
	('AW1360',	'Citizen', 'Field',	'149'),
	('BJ6501',	'Citizen', 'Field', '139'),
	('NH8388',	'Citizen', 'Diver',	'189'),
	('NH8370',	'Citizen', 'Dress', '149'),
	('NH8350',	'Citizen', 'Dress',	'129'),
	('BN0150',	'Citizen', 'Diver', '169'),
	('BN0151',	'Citizen', 'Diver', '179'),
	('NH8381',	'Citizen', 'Diver', '169'),
	('TW2R25600ZA', 'Timex', 'Field', '85'),
	('TW2R25700ZA', 'Timex', 'Field', '90'),
	('TW2R26600ZA', 'Timex', 'Dress', '80'),
	('TW2R46400VQ', 'Timex', 'Field', '69'),
	('TW2R46000VQ', 'Timex', 'Diver', '119'),
	('TW2R36000VQ', 'Timex', 'Field', '69'),
	('TW2R45900VQ', 'Timex', 'Diver', '99'),
	('TW2R43600VQ', 'Timex', 'Diver', '179'),
	('TW2R60200VQ', 'Timex', 'Chrono', '99'),
	('H70625533',	'Hamilton', 'Field', '400'),
	('H70655733',	'Hamilton', 'Field', '550'),
	('H68201963',	'Hamilton', 'Field', '350'),
	('H82305931',	'Hamilton', 'Diver', '600'),
	('H77706553',	'Hamilton', 'Chrono', '1700'),
	('1521-026-A', 'Squale', 'Diver', '899'),
	('1521-026-BLR', 'Squale', 'Diver', '899'),
	('1521-026', 'Squale', 'Diver', '899'),
	('1521-026PVD', 'Squale', 'Diver', '899'),
	('1545-ORIG', 'Squale', 'Diver', '579'),
	('Matic-Bko-Sat', 'Squale', 'Diver', '1190'),
	('Matic-Black-Pol', 'Squale', 'Diver', '1190'),
	('Matic-Blue-Pol', 'Squale', 'Diver', '1190'),
	('96B288', 'Bulova', 'Chrono', '450'),
	('97B169', 'Bulova', 'Chrono', '450'),
	('96C130', 'Bulova', 'Dress', '325'),
	('96C131', 'Bulova', 'Dress', '325'),
	('96A188', 'Bulova', 'Dress', '325'),
	('96B251', 'Bulova', 'Chrono', '650'),
	('96B272', 'Bulova', 'Chrono', '495'),
	('98B301', 'Bulova', 'Chrono', '575'),
	('212.30.41.20.01.003', 'Omega', 'Diver', '2999'),
	('23330412101001', 'Omega', 'Diver', '4499'),
	('AA02005D', 'Orient', 'Diver', '179'),
	('AC00009N', 'Orient', 'Dress', '159'),
	('AA02004B', 'Orient', 'Diver', '179'),
	('AC00005W', 'Orient', 'Dress', '137'),
	('AC00009W', 'Orient', 'Dress', '149'),
	('AA02002D', 'Orient', 'Diver', '175'),
	('AC00004B', 'Orient', 'Dress', '137'),
	('AC08004D', 'Orient', 'Dress', '139'),
	('AA02003B', 'Orient', 'Diver', '235'),
	('ER27007W', 'Orient', 'Dress', '99');


IF OBJECT_ID('[Shoreline Watch].dbo.Dim_Dates', 'U') IS NOT NULL
	DROP TABLE [Shoreline Watch].dbo.Dim_Dates;

DECLARE @StartDate DATE = '20080101', @NumberOfYears INT = 30;

-- prevent set or regional settings from interfering with 
-- interpretation of dates / literals

SET DATEFIRST 7;
SET DATEFORMAT mdy;
SET LANGUAGE US_ENGLISH;

DECLARE @CutoffDate DATE = DATEADD(YEAR, @NumberOfYears, @StartDate);

-- this is just a holding table for intermediate calculations:

CREATE TABLE [Shoreline Watch].dbo.Dim_Dates
(
  [date_key]   INT IDENTITY(1,1) PRIMARY KEY,
  [date]       DATE, 
  [day]        AS DATEPART(DAY,      [date]),
  [month]      AS DATEPART(MONTH,    [date]),
  FirstOfMonth AS CONVERT(DATE, DATEADD(MONTH, DATEDIFF(MONTH, 0, [date]), 0)),
  [MonthName]  AS DATENAME(MONTH,    [date]),
  [week]       AS DATEPART(WEEK,     [date]),
  [ISOweek]    AS DATEPART(ISO_WEEK, [date]),
  [DayOfWeek]  AS DATEPART(WEEKDAY,  [date]),
  [quarter]    AS DATEPART(QUARTER,  [date]),
  [year]       AS DATEPART(YEAR,     [date]),
  FirstOfYear  AS CONVERT(DATE, DATEADD(YEAR,  DATEDIFF(YEAR,  0, [date]), 0)),
  Style112     AS CONVERT(CHAR(8),   [date], 112),
  Style101     AS CONVERT(CHAR(10),  [date], 101)
);

-- use the catalog views to generate as many rows as we need

INSERT [Shoreline Watch].dbo.Dim_Dates([date]) 
SELECT d
FROM
(
  SELECT d = DATEADD(DAY, rn - 1, @StartDate)
  FROM 
  (
    SELECT TOP (DATEDIFF(DAY, @StartDate, @CutoffDate)) 
      rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
    FROM sys.all_objects AS s1
    CROSS JOIN sys.all_objects AS s2
    -- on my system this would support > 5 million days
    ORDER BY s1.[object_id]
  ) AS x
) AS y;


IF OBJECT_ID('[Shoreline Watch].dbo.Fact_Orders', 'U') IS NOT NULL
	DROP TABLE [Shoreline Watch.dbo.Fact_Orders];

CREATE TABLE [Shoreline Watch.dbo.Dim_Fact_Orders]
(
	watch_key		INT NOT NULL,
	customer_key	INT NOT NULL,
	date_key		INT NOT NULL,
	qty				INT NOT NULL
);

-- Stop Here. Use SQL Server 2017 Import and Export Data and import:
--	Dim_Customers
--	Fact_Orders

-- Just in case
ALTER TABLE [Shoreline Watch].dbo.Fact_Orders
ALTER COLUMN watch_key INT;

ALTER TABLE [Shoreline Watch].dbo.Fact_Orders
ALTER COLUMN customer_key INT;

ALTER TABLE [Shoreline Watch].dbo.Fact_Orders
ALTER COLUMN date_key INT;


-- Add Foreign Keys to Fact_Orders Table
ALTER TABLE [Shoreline Watch].dbo.Fact_Orders
ADD FOREIGN KEY (watch_key) REFERENCES Dim_Watches(watch_key);

ALTER TABLE [Shoreline Watch].dbo.Fact_Orders
ADD FOREIGN KEY (customer_key) REFERENCES Dim_Customers(customer_key);

ALTER TABLE [Shoreline Watch].dbo.Fact_Orders
ADD FOREIGN KEY (date_key) REFERENCES Dim_Dates(date_key);

