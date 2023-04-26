-- EXECUTION script for sm_orders on LEFT cluster

-- 2023-04-24_10-03-35-- These are the command run on the LEFT cluster when `-e` is used.
-- Create Database
CREATE DATABASE IF NOT EXISTS sm_orders
LOCATION "hdfs://HOME90/warehouse/tablespace/external/hive/sm_orders.db"
;

--    Table: mngd_order_item_orc
USE sm_orders;
CREATE TABLE `mngd_order_item_orc`(
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
'bucketing_version'='2',
'transactional'='true',
'transactional_properties'='insert_only',
'transient_lastDdlTime'='1682344820');

--    Table: mngd_order_item_small_orc
USE sm_orders;
CREATE TABLE `mngd_order_item_small_orc`(
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
'bucketing_version'='2',
'transactional'='true',
'transactional_properties'='insert_only',
'transient_lastDdlTime'='1682344827');

--    Table: mngd_order_orc
USE sm_orders;
CREATE TABLE `mngd_order_orc`(
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
'bucketing_version'='2',
'transactional'='true',
'transactional_properties'='insert_only',
'transient_lastDdlTime'='1682344830');

--    Table: mngd_order_small_orc
USE sm_orders;
CREATE TABLE `mngd_order_small_orc`(
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
'bucketing_version'='2',
'transactional'='true',
'transactional_properties'='insert_only',
'transient_lastDdlTime'='1682344834');

--    Table: order_item_orc
USE sm_orders;
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
LOCATION
'hdfs://HOME90/warehouse/tablespace/external/hive/sm_orders.db/order_item_orc'
TBLPROPERTIES (
'TRANSLATED_TO_EXTERNAL'='TRUE',
'bucketing_version'='2',
'external.table.purge'='false',
'last_modified_by'='dstreev',
'last_modified_time'='1682343559',
'transient_lastDdlTime'='1682344796');

--    Table: order_item_small_orc
USE sm_orders;
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
LOCATION
'hdfs://HOME90/warehouse/tablespace/external/hive/sm_orders.db/order_item_small_orc'
TBLPROPERTIES (
'bucketing_version'='2',
'transient_lastDdlTime'='1682344797');

--    Table: order_orc
USE sm_orders;
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
LOCATION
'hdfs://HOME90/warehouse/tablespace/external/hive/sm_orders.db/order_orc'
TBLPROPERTIES (
'bucketing_version'='2',
'transient_lastDdlTime'='1682344797');

--    Table: order_small_orc
USE sm_orders;
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
LOCATION
'hdfs://HOME90/warehouse/tablespace/external/hive/sm_orders.db/order_small_orc'
TBLPROPERTIES (
'bucketing_version'='2',
'transient_lastDdlTime'='1682344797');

--    Table: order_src
USE sm_orders;
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
LOCATION
'hdfs://HOME90/user/dstreev/datasets/orders_small'
TBLPROPERTIES (
'bucketing_version'='2',
'transient_lastDdlTime'='1682344798');
