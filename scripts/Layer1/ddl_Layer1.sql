/*
Description: Initializes the layer1 schema by dropping and recreating 
             staging tables for both CRM and ERP data sources.

*/

IF OBJECT_ID('layer1.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE layer1.crm_cust_info;
CREATE Table layer1.crm_cust_info	(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);

IF OBJECT_ID('layer1.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE layer1.crm_prd_info;
CREATE Table layer1.crm_prd_info (
prd_id INT,
prd_key	NVARCHAR(50),
prd_nm	NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);

IF OBJECT_ID('layer1.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE layer1.crm_sales_details;
CREATE Table layer1.crm_sales_details(
sls_ord_num	VARCHAR(50),
sls_prd_key	VARCHAR(50),
sls_cust_id	VARCHAR(50),
sls_order_dt VARCHAR(50),	
sls_ship_dt	VARCHAR(50),
sls_due_dt	VARCHAR(50),
sls_sales INT,
sls_quantity	INT,
sls_price INT

);

IF OBJECT_ID('layer1.erp_CUST_AZ12', 'U') IS NOT NULL
	DROP TABLE layer1.erp_CUST_AZ12;
Create table layer1.erp_CUST_AZ12
(
CID	VARCHAR(50),
BDATE DATE,	
GEN VARCHAR(50)
);
IF OBJECT_ID('layer1.erp_LOC_A101', 'U') IS NOT NULL
	DROP TABLE layer1.erp_LOC_A101;
Create table layer1.erp_LOC_A101
(
CID VARCHAR(50),	
CNTRY VARCHAR(50)

);	
IF OBJECT_ID('layer1.erp_PX_CAT_G1V2', 'U') IS NOT NULL
	DROP TABLE layer1.erp_PX_CAT_G1V2;
Create table layer1.erp_PX_CAT_G1V2
(
ID VARCHAR(50),
CAT	VARCHAR(50),
SUBCAT	VARCHAR(50),
MAINTENANCE VARCHAR(50)


);	
