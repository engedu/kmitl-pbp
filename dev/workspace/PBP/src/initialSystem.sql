-- Step 1. Drop All Table
-- Step 2. Create All Table
-- Step 3. Initial Data

-- Step 1 Drop  
 DROP TABLE IF EXISTS  address;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuckWaUser]') AND type in (N'U'))
DROP TABLE [dbo].[BuckWaUser];
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuckWaUserGroup]') AND type in (N'U'))
DROP TABLE [dbo].[BuckWaUserGroup];
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuckWaGroup]') AND type in (N'U'))
DROP TABLE [dbo].[BuckWaGroup];
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuckWaGroupRole]') AND type in (N'U'))
DROP TABLE [dbo].[BuckWaGroupRole];
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuckWaRole]') AND type in (N'U'))
DROP TABLE [dbo].[BuckWaRole];
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuckWaMenu]') AND type in (N'U'))
DROP TABLE [dbo].[BuckWaMenu];
-- Step2. Create All Table  ( BuckWaUser ,BuckWaUserGroup,BuckWaGroup,BuckWaGroupRole,BuckWaRole,BuckWaStore)
 
CREATE TABLE [dbo].[BuckWaUser](
	[username] [varchar](100) COLLATE Thai_CI_AS NOT NULL,
	[password] [varchar](100) COLLATE Thai_CI_AS NOT NULL,
	[enable] [bit] NOT NULL,
	[customer_no] [nchar](50) COLLATE Thai_CI_AS NULL,
 CONSTRAINT [PK_WebSaleUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [Data Filegroup 1]
) ON [Data Filegroup 1];

 
CREATE TABLE [dbo].[BuckWaUserGroup](
	[usergroup_id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) COLLATE Thai_CI_AS NOT NULL,
	[group_id] [bigint] NOT NULL,
 CONSTRAINT [PK_BuckWaUserGroup] PRIMARY KEY CLUSTERED 
(
	[usergroup_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [Data Filegroup 1]
) ON [Data Filegroup 1];
 
----------------------------

CREATE TABLE [dbo].[BuckWaGroup](
	[group_name] [varchar](100) COLLATE Thai_CI_AS NOT NULL,
	[group_desc] [varchar](200) COLLATE Thai_CI_AS NULL,
	[enable] [bit] NULL,
	[group_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BuckWaGroup] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [Data Filegroup 1]
) ON [Data Filegroup 1];

---------------------------

CREATE TABLE [dbo].[BuckWaGroupRole](
	[grouprole_id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
 CONSTRAINT [PK_BuckWaGroupRole] PRIMARY KEY CLUSTERED 
(
	[grouprole_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [Data Filegroup 1]
) ON [Data Filegroup 1];

------------------------------

CREATE TABLE [dbo].[BuckWaRole](
	[role_name] [varchar](200) COLLATE Thai_CI_AS NOT NULL,
	[role_desc] [varchar](500) COLLATE Thai_CI_AS NULL,
	[enable] [bit] NOT NULL CONSTRAINT [DF_BuckWaRole_enable]  DEFAULT ((1)),
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BuckWaRole_1] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [Data Filegroup 1]
) ON [Data Filegroup 1];

CREATE TABLE [dbo].[BuckWaMenu](
	[menu_id] [int] NOT NULL,
	[name] [varchar](100) COLLATE Thai_CI_AS NULL,
	[action] [varchar](100) COLLATE Thai_CI_AS NULL,
	[enable] [nchar](10) COLLATE Thai_CI_AS NULL,
	[parent_id] [int] NULL,
	[islink] [char](10) COLLATE Thai_CI_AS NULL,
	[menu_level] [char](10) COLLATE Thai_CI_AS NOT NULL,
 CONSTRAINT [PK_BuckWaMenu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [Data Filegroup 1]
) ON [Data Filegroup 1];
 
--------------- Step 3 Insert Data
INSERT INTO [TPCC].[dbo].[BuckWaRole] ([role_name]     ,[role_desc]   ,[enable]) VALUES ('ROLE_ADMIN','Admin','true');
INSERT INTO [TPCC].[dbo].[BuckWaRole] ([role_name]     ,[role_desc]   ,[enable]) VALUES  ('ROLE_USER',' User ','true');
INSERT INTO [TPCC].[dbo].[BuckWaRole] ([role_name]     ,[role_desc]   ,[enable]) VALUES  ('ROLE_CUSTOMER_SUPER','Customer Admin','true');
INSERT INTO [TPCC].[dbo].[BuckWaRole] ([role_name]     ,[role_desc]   ,[enable]) VALUES ('ROLE_CUSTOMER_USER','Customer User','true');
 -------------------------------          
INSERT INTO [TPCC].[dbo].[BuckWaGroup]  ([group_name]  ,[group_desc],[enable])  VALUES  ('GROUP_ADMIN','Admin Group','true');
INSERT INTO [TPCC].[dbo].[BuckWaGroup]  ([group_name]  ,[group_desc],[enable]) VALUES  ('GROUP_USER','User Group','true');
INSERT INTO [TPCC].[dbo].[BuckWaGroup]  ([group_name]  ,[group_desc],[enable]) VALUES  ('GROUP_CUSTOMER_SUPER','Customer Admin Group','true');
INSERT INTO [TPCC].[dbo].[BuckWaGroup]  ([group_name]  ,[group_desc],[enable]) VALUES  ('GROUP_CUSTOMER_USER','Customer User Group','true');
 ----------------------------------    
INSERT INTO [TPCC].[dbo].[BuckWaUser]([username] ,[password] ,[enable] ,[customer_no]) VALUES('admin','password','true','');
INSERT INTO [TPCC].[dbo].[BuckWaUser]([username] ,[password] ,[enable] ,[customer_no])  VALUES('user','password','true','');     
 
 ---------------------------
INSERT INTO [TPCC].[dbo].[BuckWaGroupRole]      ([group_id]     ,[role_id])  VALUES (1,1);
INSERT INTO [TPCC].[dbo].[BuckWaGroupRole]      ([group_id]     ,[role_id]) VALUES (1,2);
INSERT INTO [TPCC].[dbo].[BuckWaGroupRole]      ([group_id]     ,[role_id])  VALUES (2,2);
INSERT INTO [TPCC].[dbo].[BuckWaGroupRole]      ([group_id]     ,[role_id]) VALUES (3,3);
INSERT INTO [TPCC].[dbo].[BuckWaGroupRole]      ([group_id]     ,[role_id])   VALUES (3,2);
INSERT INTO [TPCC].[dbo].[BuckWaGroupRole]      ([group_id]     ,[role_id])  VALUES (4,4);
INSERT INTO [TPCC].[dbo].[BuckWaGroupRole]      ([group_id]     ,[role_id])  VALUES (4,2);
     
 -------------------------
INSERT INTO [TPCC].[dbo].[BuckWaUserGroup] ([username],[group_id]) VALUES ('admin',1); 
INSERT INTO [TPCC].[dbo].[BuckWaUserGroup] ([username],[group_id]) VALUES ('user',3);    
INSERT INTO [TPCC].[dbo].[BuckWaUserGroup] ([username],[group_id]) VALUES ('user',4); 
INSERT INTO [TPCC].[dbo].[BuckWaUserGroup] ([username],[group_id]) VALUES ('user',4);  