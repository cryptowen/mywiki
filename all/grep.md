# grep 用法

## 匹配包含于某些字符串之间的内容

```bash
$ head user.ttuid_connect_worker.log.2017-03-23_01
INFO 2017-03-23 01:25:43,387 /data00/tiger/lib/frame/worker_bootstrap.py:69 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 data=start_time=1490203543386&method=handle_msg&
INFO 2017-03-23 01:25:43,387 /data00/tiger/lib/frame/worker_bootstrap.py:69 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 data=start_time=1490203543386&method=handle_msg&
INFO 2017-03-23 01:25:43,388 /data05/home/liangxiaofeng/repos/app/user/ttuid_connect_worker/utils/installaion_handler.py:118 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 data=handle result: RetCode.not_new msg: {"os": "iOS", "campaign": {}, "os_version": "8.1.2", "did": 8611693217, "ip": "36.149.155.208", "package": "com.ss.iphone.article.News", "app_id": 13, "iid": 8959487628, "udid": null, "mc": "02:00:00:00:00:00", "idfa": "C784FFB0-C3D7-41C1-8E61-6548B8B4AFCB", "app_track": null, "time": 1490179484, "model": "iPhone 6 Plus", "ua": "News/6.0.3 (iPhone; iOS 8.1.2; Scale/3.00)", "channel": "App Store", "from_id": 7730121491}
INFO 2017-03-23 01:25:43,388 /data05/home/liangxiaofeng/repos/app/user/ttuid_connect_worker/utils/installaion_handler.py:118 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 data=handle result: RetCode.not_new msg: {"os": "iOS", "campaign": {}, "os_version": "8.1.2", "did": 8611693217, "ip": "36.149.155.208", "package": "com.ss.iphone.article.News", "app_id": 13, "iid": 8959487628, "udid": null, "mc": "02:00:00:00:00:00", "idfa": "C784FFB0-C3D7-41C1-8E61-6548B8B4AFCB", "app_track": null, "time": 1490179484, "model": "iPhone 6 Plus", "ua": "News/6.0.3 (iPhone; iOS 8.1.2; Scale/3.00)", "channel": "App Store", "from_id": 7730121491}
TRACE 2017-03-23 01:25:43,389 /data00/tiger/lib/frame/worker_bootstrap.py:75 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 status=0 start_time=1490203543386 cluster=default cost=3 env=prod method=handle_msg data=Flushtrace
TRACE 2017-03-23 01:25:43,389 /data00/tiger/lib/frame/worker_bootstrap.py:75 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 status=0 start_time=1490203543386 cluster=default cost=3 env=prod method=handle_msg data=Flushtrace
INFO 2017-03-23 01:25:43,390 /data00/tiger/lib/frame/worker_bootstrap.py:69 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107810168 default process=184107 thread=140584789165824 data=start_time=1490203543390&method=handle_msg&
INFO 2017-03-23 01:25:43,390 /data00/tiger/lib/frame/worker_bootstrap.py:69 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107810168 default process=184107 thread=140584789165824 data=start_time=1490203543390&method=handle_msg&
INFO 2017-03-23 01:25:43,390 /data05/home/liangxiaofeng/repos/app/user/ttuid_connect_worker/utils/installaion_handler.py:118 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107810168 default process=184107 thread=140584789165824 data=handle result: RetCode.not_ios msg: {"os": "Android", "campaign": {}, "os_version": "4.4.2", "did": 35573310258, "ip": "116.194.221.143", "package": "com.ss.android.article.news", "app_id": 13, "iid": 8961543824, "udid": "359100045319733", "mc": "a4:08:a6:e9:b6:fd", "idfa": null, "app_track": null, "time": 1490184682, "model": "H30-T00", "ua": "Dalvik/1.6.0 (Linux; U; Android 4.2.2; G750-T01 Build/JDQ39) NewsArticle/5.9.1 okhttp/3.4.1", "channel": "baidu", "from_id": 0}
INFO 2017-03-23 01:25:43,390 /data05/home/liangxiaofeng/repos/app/user/ttuid_connect_worker/utils/installaion_handler.py:118 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107810168 default process=184107 thread=140584789165824 data=handle result: RetCode.not_ios msg: {"os": "Android", "campaign": {}, "os_version": "4.4.2", "did": 35573310258, "ip": "116.194.221.143", "package": "com.ss.android.article.news", "app_id": 13, "iid": 8961543824, "udid": "359100045319733", "mc": "a4:08:a6:e9:b6:fd", "idfa": null, "app_track": null, "time": 1490184682, "model": "H30-T00", "ua": "Dalvik/1.6.0 (Linux; U; Android 4.2.2; G750-T01 Build/JDQ39) NewsArticle/5.9.1 okhttp/3.4.1", "channel": "baidu", "from_id": 0}

$ head user.ttuid_connect_worker.log.2017-03-23_01 | grep -P '(?<=TRACE ).*?(?= /data00/)'
TRACE 2017-03-23 01:25:43,389 /data00/tiger/lib/frame/worker_bootstrap.py:75 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 status=0 start_time=1490203543386 cluster=default cost=3 env=prod method=handle_msg data=Flushtrace
TRACE 2017-03-23 01:25:43,389 /data00/tiger/lib/frame/worker_bootstrap.py:75 10.6.131.78 user.ttuid_connect_worker 2017032301254301000613107813307 default process=184107 thread=140584789165824 status=0 start_time=1490203543386 cluster=default cost=3 env=prod method=handle_msg data=Flushtrace

$ head user.ttuid_connect_worker.log.2017-03-23_01 | grep -o -P '(?<=TRACE ).*?(?= /data00/)'
2017-03-23 01:25:43,389
2017-03-23 01:25:43,389
```


## 显示行号和递归查找

![text](http://7o4zqy.com1.z0.glb.clouddn.com/9cb3e14f67dff1caaaa476ee02cc4519.png)

```
$ grep -nr 'user_info' .
./sqls/open.sql:1:DROP TABLE IF EXISTS `ss_open_user_info`;
./sqls/open.sql:6:CREATE TABLE `open_user_info` (
./profile/all_merge.py:45:            self.inc_counter("no_user_info")
Binary file ./models/site/open.pyc matches
./models/site/open.py:15:    __tablename__ = 'open_user_info'
./domain/message/dongtai_message_test.log.2017-02-14:1:2017-02-14 10:58:10,988, INFO [get_mc_client.init] cluster: memcache_web_user_info
./domain/message/dongtai_message_test.log.2017-02-14:2:2017-02-14 10:58:10,992, INFO [get_mc_client.init] cluster: memcache_web_user_info_hy
```
