# Linux

## centos crontab 时区问题

`tzselect` 可以交互式调整系统时区。
但是调整完后 crontab 依然是按照默认时区执行的任务。

解决方案：`crontab -e` 打开配置，在最上面加上一行 `TZ='Asia/Shanghai'`

测试方法：
- 查看 crontab 日志： `tail -F /var/log/cron`
- 在 crontab 中加上 `* * * * * echo $TZ `date` >> /tmp/tzout.gmt`，
然后 tail 该日志查看结果

## 自定义系统service
我们可以通过自己编写脚本来实现系统的service命令控制启动。
此处以ping百度的命令作为示例。

1. 将下列脚本保存为`/etc/init.d/ping_service`
2. 赋予该脚本执行权限

    ```sh
    sudo chmod +x /etc/init.d/ping_service
    ```
3. 命令列表
    ```sh
    # 启动、停止、重启、卸载服务
    sudo service ping_service {start|stop|restart|uninstall}
    # 查看日志
    tail /var/log/ping_service.log
    # 查看pid
    cat /var/run/ping_service.pid
    ```

修改脚本
1. 将下列脚本保存到`/etc/init.d/`目录下
1. 修改以下位置
    ```sh
    # 将 ping\ baidu.com 修改为你需要执行的命令
    SCRIPT=ping\ baidu.com
    # 将 hadoop 修改为执行命令的用户
    RUNAS=hadoop
    ```
1. 将脚本中的`ping_service`改为你的service名称，该脚本最好也用该名称。

参考脚本如下：

```sh
#!/bin/sh
### BEGIN INIT INFO
# Provides:          ping_service
# Required-Start:    $local_fs $network $named $time $syslog
# Required-Stop:     $local_fs $network $named $time $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Description:       test
### END INIT INFO

SCRIPT=ping\ baidu.com
RUNAS=hadoop

PIDFILE=/var/run/ping_service.pid
LOGFILE=/var/log/ping_service.log

start() {
  if [ -f "$PIDFILE" ] && kill -0 $(cat "$PIDFILE"); then
    echo 'Service already running' >&2
    return 1
  fi
  echo 'Starting service…' >&2
  local CMD="$SCRIPT &>> \"$LOGFILE\" & echo \$!"
  su -c "$CMD" $RUNAS > "$PIDFILE"
  echo 'Service started' >&2
}

stop() {
  if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
    echo 'Service not running' >&2
    return 1
  fi
  echo 'Stopping service…' >&2
  kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
  echo 'Service stopped' >&2
}

uninstall() {
  echo -n "Are you really sure you want to uninstall this service? That cannot be undone. [yes|No] "
  local SURE
  read SURE
  if [ "$SURE" = "yes" ]; then
    stop
    rm -f "$PIDFILE"
    echo "Notice: log file is not be removed: '$LOGFILE'" >&2
    update-rc.d -f p remove
    rm -fv "$0"
  fi
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  uninstall)
    uninstall
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|uninstall}"
esac
```

### 参考资料
- [Sample service script](https://gist.github.com/naholyr/4275302)
- [How to LSBize an Init Script](https://wiki.debian.org/LSBInitScripts)
