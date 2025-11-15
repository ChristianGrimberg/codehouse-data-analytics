USE [Nike_Sabado];
GO

CREATE TABLE [dbo].[Ciudad] (
    [id_City] INT PRIMARY KEY IDENTITY(1,1),
    [City] NVARCHAR(50) NULL
);
GO

INSERT INTO [dbo].[Ciudad] ([City])
VALUES
    ('New York')
    ,('Houston')
    ,('San Francisco')
    ,('Los Angeles')
    ,('Chicago')
    ,('Dallas')
    ,('Philadelphia')
    ,('Las Vegas')
    ,('Denver')
    ,('Seattle')
    ,('Miami')
    ,('Minneapolis')
    ,('Billings')
    ,('Knoxville')
    ,('Omaha')
    ,('Birmingham')
    ,('Portland')
    ,('Anchorage')
    ,('Honolulu')
    ,('Orlando')
    ,('Albany')
    ,('Cheyenne')
    ,('Richmond')
    ,('Detroit')
    ,('St. Louis')
    ,('Salt Lake City')
    ,('New Orleans')
    ,('Boise')
    ,('Phoenix')
    ,('Albuquerque')
    ,('Atlanta')
    ,('Charleston')
    ,('Charlotte')
    ,('Columbus')
    ,('Louisville')
    ,('Jackson')
    ,('Little Rock')
    ,('Oklahoma City')
    ,('Wichita')
    ,('Sioux Falls')
    ,('Fargo')
    ,('Des Moines')
    ,('Milwaukee')
    ,('Indianapolis')
    ,('Baltimore')
    ,('Wilmington')
    ,('Newark')
    ,('Hartford')
    ,('Providence')
    ,('Boston')
    ,('Burlington')
    ,('Manchester');
GO