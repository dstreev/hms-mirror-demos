# HMS-Mirror for: sm_orders

v.1.5.4.6-SNAPSHOT
---
## Run Log

| Date | Elapsed Time |
|:---|:---|
| 2023-04-24 10:03:35 | 1.85 secs |

## Config:
```
---
acceptance:
  silentOverride: null
  backedUpHDFS: null
  backedUpMetastore: null
  trashConfigured: null
  potentialDataLoss: null
clusters:
  LEFT:
    environment: "LEFT"
    legacyHive: false
    hcfsNamespace: "hdfs://HOME90"
    hiveServer2:
      uri: "jdbc:hive2://s03.streever.local:8443/;ssl=true;transportMode=http;httpPath=gateway/cdp-proxy-api/hive;sslTrustStore=/home/dstreev/bin/certs/gateway-client-trust.jks;trustStorePassword=changeit"
      disconnected: false
      connectionProperties:
        validationQuery: "SELECT 1"
        maxIdle: "2"
        user: "*****"
        maxTotal: "4"
        validationQueryTimeout: "5"
        testOnCreate: "true"
        maxWaitMillis: "5000"
        password: "*****"
        initialSize: "4"
      jarFile: "/home/dstreev/.hms-mirror/aux_libs/ext/hive-jdbc-cdp-standalone.jar"
    partitionDiscovery:
      auto: true
      initMSCK: true
  RIGHT:
    environment: "RIGHT"
    legacyHive: true
    hcfsNamespace: null
    hiveServer2: null
    partitionDiscovery:
      auto: true
      initMSCK: true
commandLineOptions: "[-d, DUMP, -db, sm_orders, -o, /home/dstreev/hm-demo/orig_dump]"
copyAvroSchemaUrls: false
dataStrategy: "DUMP"
databaseOnly: false
skipLinkCheck: false
databases:
- "sm_orders"
legacyTranslations:
  rowSerde:
    '''org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe''': "'org.apache.hadoop.hive.serde2.MultiDelimitSerDe'"
    '''org.apache.hadoop.hive.contrib.serde2.RegexSerDe''': "'org.apache.hadoop.hive.serde2.RegexSerDe'"
dbPrefix: null
dbRename: null
dumpSource: "LEFT"
execute: false
flip: false
hybrid:
  exportImportPartitionLimit: 100
  sqlPartitionLimit: 500
  sqlSizeLimit: 1073741824
migrateACID:
  "on": true
  only: false
  artificialBucketThreshold: 2
  partitionLimit: 500
  downgrade: false
  inplace: false
migrateVIEW:
  "on": true
migratedNonNative: true
optimization:
  sortDynamicPartitionInserts: false
  skip: false
  overrides:
    left: {}
    right: {}
  buildShadowStatistics: false
readOnly: false
noPurge: false
replace: false
resetRight: false
resetToDefaultLocation: false
skipFeatures: false
skipLegacyTranslation: false
sqlOutput: true
sync: false
tblRegEx: null
tblExcludeRegEx: null
transfer:
  concurrency: 4
  transferPrefix: "hms_mirror_transfer_"
  shadowPrefix: "hms_mirror_shadow_"
  exportBaseDirPrefix: "/apps/hive/warehouse/export_"
  remoteWorkingDirectory: "hms_mirror_working"
  intermediateStorage: null
  commonStorage: null
  storageMigration:
    strategy: "SQL"
    distcp: false
    dataFlow: "PULL"
  warehouse:
    managedDirectory: null
    externalDirectory: null
transferOwnership: false

```

### Config Warnings:
- 54:To get the `distcp` workplans add `-dc|--distcp` to commandline.

## Database SQL Statement(s)

### LEFT

```
-- Create Database
CREATE DATABASE IF NOT EXISTS sm_orders
LOCATION "hdfs://HOME90/warehouse/tablespace/external/hive/sm_orders.db"

```

## DB Issues

none

## Table Status (9)

*NOTE* SQL in this report may be altered by the renderer.  Do NOT COPY/PASTE from this report.  Use the LEFT|RIGHT_execution.sql files for accurate scripts

<table>
<tr>
<th style="test-align:left">Table</th>
<th style="test-align:left">Strategy</th>
<th style="test-align:left">Source<br/>Managed</th>
<th style="test-align:left">Source<br/>ACID</th>
<th style="test-align:left">Phase<br/>State</th>
<th style="test-align:right">Duration</th>
<th style="test-align:right">Partition<br/>Count</th>
<th style="test-align:left">Steps</th>
<th style="test-align:left">SQL</th>
</tr>
<tr>
<td>mngd_order_item_orc</td>
<td>DUMP</td>
<td>X</td>
<td>
X</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>.29</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.00</td><td>TRANSACTIONAL</td><td>true</td></tr>
<tr>
<td>1.04</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE TABLE `mngd_order_item_orc`(
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
'transient_lastDdlTime'='1682344820')</td>
</tr>
</table></td>
</tr>
<tr>
<td>mngd_order_item_small_orc</td>
<td>DUMP</td>
<td>X</td>
<td>
X</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>.60</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.00</td><td>TRANSACTIONAL</td><td>true</td></tr>
<tr>
<td>.74</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE TABLE `mngd_order_item_small_orc`(
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
'transient_lastDdlTime'='1682344827')</td>
</tr>
</table></td>
</tr>
<tr>
<td>mngd_order_orc</td>
<td>DUMP</td>
<td>X</td>
<td>
X</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>.93</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.00</td><td>TRANSACTIONAL</td><td>true</td></tr>
<tr>
<td>.40</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE TABLE `mngd_order_orc`(
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
'transient_lastDdlTime'='1682344830')</td>
</tr>
</table></td>
</tr>
<tr>
<td>mngd_order_small_orc</td>
<td>DUMP</td>
<td>X</td>
<td>
X</td>
<td>SUCCESS</td>
<td>.01</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>.94</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.00</td><td>TRANSACTIONAL</td><td>true</td></tr>
<tr>
<td>.40</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE TABLE `mngd_order_small_orc`(
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
'transient_lastDdlTime'='1682344834')</td>
</tr>
</table></td>
</tr>
<tr>
<td>order_item_orc</td>
<td>DUMP</td>
<td></td>
<td>
</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>.60</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.74</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE EXTERNAL TABLE `order_item_orc`(
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
'transient_lastDdlTime'='1682344796')</td>
</tr>
</table></td>
</tr>
<tr>
<td>order_item_small_orc</td>
<td>DUMP</td>
<td></td>
<td>
</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>1.31</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.03</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE EXTERNAL TABLE `order_item_small_orc`(
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
'transient_lastDdlTime'='1682344797')</td>
</tr>
</table></td>
</tr>
<tr>
<td>order_orc</td>
<td>DUMP</td>
<td></td>
<td>
</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>.92</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.42</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE EXTERNAL TABLE `order_orc`(
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
'transient_lastDdlTime'='1682344797')</td>
</tr>
</table></td>
</tr>
<tr>
<td>order_small_orc</td>
<td>DUMP</td>
<td></td>
<td>
</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>1.32</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.02</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE EXTERNAL TABLE `order_small_orc`(
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
'transient_lastDdlTime'='1682344797')</td>
</tr>
</table></td>
</tr>
<tr>
<td>order_src</td>
<td>DUMP</td>
<td></td>
<td>
</td>
<td>SUCCESS</td>
<td>.00</td>
<td> </td>
<td>
<table>
<tr>
<td>.00</td><td>init</td><td></td></tr>
<tr>
<td>1.32</td><td>LEFT</td><td>Fetched Schema</td></tr>
<tr>
<td>.03</td><td>TRANSFER</td><td>DUMP</td></tr>
</table>
</td>
<td>
<table><tr>
<th colspan="2">LEFT</th>
</tr>
<tr>
<td>Selecting DB</td>
<td>USE sm_orders</td>
</tr>
<tr>
<td>Creating Table</td>
<td>CREATE EXTERNAL TABLE `order_src`(
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
'transient_lastDdlTime'='1682344798')</td>
</tr>
</table></td>
</tr>
</table>
