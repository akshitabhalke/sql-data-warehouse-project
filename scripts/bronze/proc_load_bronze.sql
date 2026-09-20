CREATE OR ALTER PROCEDURE bronze.load_bronze as
begin
DECLARE @start_time DATETIME, @end_time DATETIME;
declare @batch_start_time DATETIME ,@batch_end_time DATETIME;

begin try
PRINT '================================================';
PRINT'Loading Bronze Layer';
PRINT '================================================';

PRINT'Loading CRM Tables';
PRINT'--------------------------------------------------';
SET @batch_start_time=GETDATE();
SET @start_time = GETDATE();
PRINT'--------------------------------------------------';
PRINT'>> Truncating Table: bronze.crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;

PRINT'>> Inserting Data into : bronze.crm_cust_info';
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\LENOVO\OneDrive\Desktop\Sql\cust_info (1).csv'
WITH (
FIRSTROW=2,
 FIELDTERMINATOR = ',',
 TABLOCK

);
SET @end_time=GETDATE();
PRINT '>>load duration :'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'second';
print'-----------------'

SET @start_time = GETDATE();
PRINT'>> Truncating Table:bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;
PRINT'>> Inserting Data into : bronze.crm_prd_info';
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\LENOVO\OneDrive\Desktop\SqL\prd_info.csv'
WITH (
FIRSTROW=2,
 FIELDTERMINATOR = ',',
 TABLOCK

);
SET @end_time=GETDATE();
PRINT '>>load duration :'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'second';
print'-----------------'

SET @start_time = GETDATE();
PRINT'>> Truncating Table:bronze.crm_sales_details';
TRUNCATE TABLE bronze.crm_sales_details;
PRINT'>> Inserting Data into : bronze.crm_sales_details';
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\LENOVO\OneDrive\Desktop\SqL\sales_details.csv'
WITH (
FIRSTROW=2,
 FIELDTERMINATOR = ',',
 TABLOCK

);
SET @end_time=GETDATE();
PRINT '>>load duration :'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'second';
print'-----------------'

PRINT '================================================';
PRINT'Loading Bronze Layer';
PRINT '================================================';


PRINT'--------------------------------------------------';
PRINT'Loading ERP Tables';
PRINT'--------------------------------------------------';

SET @start_time = GETDATE();
PRINT'>> Truncating Table:bronze.erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;
PRINT'>> Inserting Data into : bronze.erp_cust_az12';
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\LENOVO\OneDrive\Desktop\SqL\CUST_AZ12.csv'
WITH (
FIRSTROW=2,
 FIELDTERMINATOR = ',',
 TABLOCK

);SET @end_time=GETDATE();
PRINT '>>load duration :'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'second';
print'-----------------'

SET @start_time = GETDATE();
PRINT'>> Truncating Table:bronze.erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;
PRINT'>> Inserting Data into : bronze.erp_loc_a101';
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\LENOVO\OneDrive\Desktop\SqL\LOC_A101.csv'
WITH (
FIRSTROW=2,
 FIELDTERMINATOR = ',',
 TABLOCK

);
SET @end_time=GETDATE();
PRINT '>>load duration :'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'second';
print'-----------------'

SET @start_time = GETDATE();
PRINT'>> Truncating Table:bronze.erp_px_cat_g1v2';
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
PRINT'>> Inserting Data into : bronze.erp_px_cat_g1v2';
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\LENOVO\OneDrive\Desktop\SqL\PX_CAT_G1V2.csv'
WITH (
FIRSTROW=2,
 FIELDTERMINATOR = ',',
 TABLOCK

);

SET @end_time=GETDATE();
PRINT '>>load duration :'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'second';
print'-----------------'
SET @batch_end_time=GETDATE();
PRINT '>>load duration :'+ CAST(DATEDIFF(second,@batch_start_time,@batch_end_time)AS NVARCHAR) + 'second';
print'-----------------'

end try
begin catch
PRINT '=================================================='
PRINT'ERROR OCCURED'
PRINT '=================================================='
end catch
end
