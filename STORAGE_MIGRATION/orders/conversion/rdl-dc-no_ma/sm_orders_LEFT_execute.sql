-- EXECUTION script for sm_orders on LEFT cluster

-- 2023-04-26_19-55-57-- These are the command run on the LEFT cluster when `-e` is used.
-- Alter Database Location
ALTER DATABASE sm_orders SET LOCATION "ofs://OHOME90/finance/operations-ext/sm_orders.db";
-- Alter Database Managed Location
ALTER DATABASE sm_orders SET MANAGEDLOCATION "ofs://OHOME90/finance/operations-mngd/sm_orders.db";

--    Table: order_item_orc
USE sm_orders;
ALTER TABLE order_item_orc UNSET TBLPROPERTIES ("TRANSLATED_TO_EXTERNAL");
 ALTER TABLE order_item_orc RENAME TO order_item_orc_f97aacfcc6fe4ba897b4ef6bafe594d7;
CREATE EXTERNAL TABLE `order_item_orc`(
`order_id` string,
`order_item_id` string,
`product_id` string,
`quantity` bigint,
`cost` double)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
TBLPROPERTIES (
'hmsMirror_Metadata_Stage1'='2023-04-26 19:55:56',
'TRANSLATED_TO_EXTERNAL'='TRUE',
'bucketing_version'='2',
'external.table.purge'='false'
);
FROM order_item_orc_f97aacfcc6fe4ba897b4ef6bafe594d7 INSERT OVERWRITE TABLE order_item_orc SELECT *;

--    Table: order_item_small_orc
USE sm_orders;
 ALTER TABLE order_item_small_orc RENAME TO order_item_small_orc_6a347f8621c4467286f564c57a6e709c;
CREATE EXTERNAL TABLE `order_item_small_orc`(
`order_id` string,
`order_item_id` string,
`product_id` string,
`quantity` bigint,
`cost` double)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
TBLPROPERTIES (
'hmsMirror_Metadata_Stage1'='2023-04-26 19:55:56',
'bucketing_version'='2');
FROM order_item_small_orc_6a347f8621c4467286f564c57a6e709c INSERT OVERWRITE TABLE order_item_small_orc SELECT *;

--    Table: order_orc
USE sm_orders;
 ALTER TABLE order_orc RENAME TO order_orc_3c1ba6c1188f4260941e638b1089bf6b;
CREATE EXTERNAL TABLE `order_orc`(
`id` string,
`user_id` string,
`order_date` date,
`status` string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
TBLPROPERTIES (
'hmsMirror_Metadata_Stage1'='2023-04-26 19:55:56',
'bucketing_version'='2');
FROM order_orc_3c1ba6c1188f4260941e638b1089bf6b INSERT OVERWRITE TABLE order_orc SELECT *;

--    Table: order_small_orc
USE sm_orders;
 ALTER TABLE order_small_orc RENAME TO order_small_orc_c8e55d45a14e4b59911c7db7df32f52a;
CREATE EXTERNAL TABLE `order_small_orc`(
`id` string,
`user_id` string,
`order_date` date,
`status` string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
TBLPROPERTIES (
'hmsMirror_Metadata_Stage1'='2023-04-26 19:55:56',
'bucketing_version'='2');
FROM order_small_orc_c8e55d45a14e4b59911c7db7df32f52a INSERT OVERWRITE TABLE order_small_orc SELECT *;

--    Table: order_src
USE sm_orders;
 ALTER TABLE order_src RENAME TO order_src_c13a9d6402374c1e9b6c95a8dd5b01e1;
CREATE EXTERNAL TABLE `order_src`(
`id` string COMMENT 'from deserializer',
`user_id` string COMMENT 'from deserializer',
`order_date` date COMMENT 'from deserializer',
`status` string COMMENT 'from deserializer',
`order_items` array<struct<`order_item_id`:string, `product_id`:string, `quantity`:bigint, `cost`:double>> COMMENT 'from deserializer')
ROW FORMAT SERDE
'org.apache.hadoop.hive.serde2.JsonSerDe'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
TBLPROPERTIES (
'hmsMirror_Metadata_Stage1'='2023-04-26 19:55:56',
'bucketing_version'='2');
FROM order_src_c13a9d6402374c1e9b6c95a8dd5b01e1 INSERT OVERWRITE TABLE order_src SELECT *;
