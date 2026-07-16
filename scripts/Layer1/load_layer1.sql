/*
===============================================================================
This stored procedure loads data into the layer1 schema from external csv files
===============================================================================
*/

CREATE OR ALTER PROCEDURE layer1.load_layer1 AS
BEGIN
   DECLARE @start_time DATETIME, @end_time DATETIME, @start_time_batch DATETIME, @end_time_batch DATETIME;
   BEGIN TRY
   SET @start_time_batch = GETDATE()
    PRINT '====================';
    PRINT 'LOADING BRONZE LAYER';
    PRINT '====================';


    PRINT '====================';
    PRINT 'Loading CRM';
    PRINT '====================';
    SET @start_time = GETDATE();
    TRUNCATE TABLE layer1.crm_cust_info;
    BULK INSERT layer1.crm_cust_info
    FROM 'C:\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK);
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' +  CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

    SET @start_time = GETDATE();
    TRUNCATE TABLE layer1.crm_prd_info;
    BULK INSERT layer1.crm_prd_info
    FROM 'C:\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK);
     SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' +  CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

    SET @start_time = GETDATE();
    TRUNCATE TABLE layer1.crm_sales_details;
    BULK INSERT layer1.crm_sales_details
    FROM 'C:\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK);
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' +  CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';


    PRINT '====================';
    PRINT 'Loading ERP';
    PRINT '====================';
    SET @start_time = GETDATE();
    TRUNCATE TABLE layer1.erp_CUST_AZ12;
    BULK INSERT layer1.erp_CUST_AZ12
    FROM 'C:\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK);
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' +  CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

    SET @start_time = GETDATE();
    TRUNCATE TABLE layer1.erp_LOC_A101;
    BULK INSERT layer1.erp_LOC_A101
    FROM 'C:\datasets\source_erp\LOC_A101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK);
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' +  CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

    SET @start_time = GETDATE();
    TRUNCATE TABLE layer1.erp_PX_CAT_G1V2;
    BULK INSERT layer1.erp_PX_CAT_G1V2
    FROM 'C:\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK);
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' +  CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    SET @end_time_batch = GETDATE()
    PRINT '=================================================='
    PRINT '>> Batch Load Duration: ' +  CAST(DATEDIFF(second, @start_time_batch, @end_time_batch) AS NVARCHAR) + ' seconds';

    END TRY
    BEGIN CATCH
    PRINT 'ERROR';
    END CATCH
END;
