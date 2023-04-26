-- EXECUTION CLEANUP script for sm_orders on LEFT cluster

-- 2023-04-26_19-57-50

USE sm_orders;

--    Cleanup script: order_item_orc
DROP TABLE IF EXISTS order_item_orc_bc2337c7e08e4c869f599c2b7fa79127;

--    Cleanup script: order_item_small_orc
DROP TABLE IF EXISTS order_item_small_orc_6c23b16234cb4fab97831fcbb9f7a24f;

--    Cleanup script: order_orc
DROP TABLE IF EXISTS order_orc_32fb873f2f7347e0bffc99ad65037e03;

--    Cleanup script: order_small_orc
DROP TABLE IF EXISTS order_small_orc_92017acc309d42b9a1b76266b0c0c7c2;

--    Cleanup script: order_src
DROP TABLE IF EXISTS order_src_7d7e33290c2d4e2a913cb027bfe7601b;
