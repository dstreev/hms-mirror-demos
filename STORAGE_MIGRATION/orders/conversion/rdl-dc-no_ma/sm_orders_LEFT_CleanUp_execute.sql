-- EXECUTION CLEANUP script for sm_orders on LEFT cluster

-- 2023-04-26_19-55-57

USE sm_orders;

--    Cleanup script: order_item_orc
DROP TABLE IF EXISTS order_item_orc_f97aacfcc6fe4ba897b4ef6bafe594d7;

--    Cleanup script: order_item_small_orc
DROP TABLE IF EXISTS order_item_small_orc_6a347f8621c4467286f564c57a6e709c;

--    Cleanup script: order_orc
DROP TABLE IF EXISTS order_orc_3c1ba6c1188f4260941e638b1089bf6b;

--    Cleanup script: order_small_orc
DROP TABLE IF EXISTS order_small_orc_c8e55d45a14e4b59911c7db7df32f52a;

--    Cleanup script: order_src
DROP TABLE IF EXISTS order_src_c13a9d6402374c1e9b6c95a8dd5b01e1;
