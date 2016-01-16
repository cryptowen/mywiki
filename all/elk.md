# ELK技术栈

## 学习资料

- [An Introduction to the ELK stack](https://www.elastic.co/webinars/introduction-elk-stack)，官方入门视频
- [ELKstack 中文指南](http://kibana.logstash.es/)
- [Elasticsearch权威指南（中文版）](https://www.gitbook.com/book/looly/elasticsearch-the-definitive-guide-cn/details)，官方权威指南的中文翻译，尚未完成
- [docker-elk](https://github.com/deviantony/docker-elk)
- Logstash
    - [Logstash: 0-60 in 60](https://www.elastic.co/webinars/logstash-0-60-in-60)
    - [Logstash参考](https://www.elastic.co/guide/en/logstash/current/index.html)
    - [Logstash最佳实践【中文】](https://github.com/chenryn/logstash-best-practice-cn)
    - [logstashbook](http://www.logstashbook.com/)，[代码](https://github.com/jamtur01/logstashbook-code)
    - [logstash cookbook](https://github.com/logstash/cookbook)
    - [logstash根据事件统计值报警](http://logstash.es/2013/07/11/howto-filter-count-in-logstash/)

- [zabbix应用 极客学院](http://www.jikexueyuan.com/course/1560_1.html?ss=1)
- fluentd
    - [fluentd实现日志告警](http://docs.fluentd.org/articles/splunk-like-grep-and-alert-email)
    - [fluentd日志正则测试](http://fluentular.herokuapp.com/)
    - [我们的nginx日志使用的正则示例](https://regex101.com/r/lH6pT6/1)，[fluentd配置示例](http://fluentular.herokuapp.com/parse?regexp=%5E%28%3F%3Cremote_addr%3E%5B%5E+%5D*%29+-+%28%3F%3Cremote_user%3E%5B%5E+%5D*%29+%5C%5B%28%3F%3Ctime%3E%5B%5E%5C%5D%5D*%29%5C%5D%5Cs%2B%22%28%3F%3Crequest_type%3E%5B%5E+%5D*%29+%28%3F%3Crequest_url%3E%5B%5E+%5D*%29+%28%3F%3Crequest_http_protocol%3E%5B%5E+%5D*%29%22+%28%3F%3Crequest_body%3E%5B%5E+%5D*%29+%28%3F%3Cstatus%3E%5B%5E%22%5D*%29+%28%3F%3Cbody_bytes_sent%3E%5B%5E+%5D*%29+%22%28%3F%3Chttp_referer%3E%5B%5E%22%5D*%29%22+%22%28%3F%3Chttp_user_agent%3E%5B%5E%22%5D*%29%22+%22%28%3F%3Chttp_x_forwarded_for%3E%5B%5E%22%5D*%29%22+%28%3F%3Cupstream_addr%3E%5B%5E+%5D*%29+%28%3F%3Cupstream_response_time%3E%5B%5E+%5D*%29+%28%3F%3Crequest_time%3E%5B%5E+%5D*%29&input=60.25.5.103+-+-+%5B13%2FJan%2F2016%3A03%3A11%3A15+%2B0800%5D+%22GET+%2Fg72%2Fapi%2F%3Fmethod%3Dcommander.rob%26user_token%3Dg728937911%26luaver%3D1.0.19%26__ts%3D1452625878%26pt%3Dcn360%26appver%3D2.4%26device%3DK%252DTouch%2BS5%26pt_chl%3Dcn360%26os%3D16%26osver%3D16%26device_mark%3D18%3A3b%3Ad2%3A64%3Abe%3A85%26device_mem%3D883859456%26sid%3D30a5f2fdae98cb62984ec85ab0f3bda51452621101%26result%3D5df9091cedd9353a27e644de3657a1156e1cd2781348cc6d186c2400ed064f6b3597b6296547d1ccf660b9e4bc9a5d7720b9ec30e1728a8d6edea5b3ed99e6969b17db0899bd568c582d50e730a8037aaf145fa732a3e584e0a27463167b8a3364d227ba2668e4034b198461%26+HTTP%2F1.1%22+-+200+4409+%22-%22+%22-%22+%22-%22+10.254.93.195%3A4400+0.072+0.072&time_format=%25d%2F%25b%2F%25Y%3A%25H%3A%25M%3A%25S+%25z)
