use sm_orders;

describe database sm_orders;
show tables;

SHOW CREATE TABLE mngd_order_small_orc;
SELECT * FROM mngd_order_small_orc LIMIT 10;
SHOW CREATE TABLE mngd_order_orc;
SELECT * FROM mngd_order_orc LIMIT 10;
SHOW CREATE TABLE mngd_order_item_small_orc;
SELECT * FROM mngd_order_item_small_orc LIMIT 10;
SHOW CREATE TABLE mngd_order_item_orc;
SELECT * FROM mngd_order_item_orc LIMIT 10;
SHOW CREATE TABLE order_src;
SELECT * FROM order_src LIMIT 1;
SHOW CREATE TABLE order_small_orc;
SELECT * FROM order_small_orc LIMIT 10;
SHOW CREATE TABLE order_orc;
SELECT * FROM order_orc LIMIT 10;
SHOW CREATE TABLE order_item_small_orc;
SELECT * FROM order_item_small_orc LIMIT 10;
SHOW CREATE TABLE order_item_orc;
SELECT * FROM order_item_orc LIMIT 10;
