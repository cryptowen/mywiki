# Python 开发实践

## 杂项
- pyenv: python 版本管理


## logging

参考资料：
- [The Hitchhiker’s Guide to Python](http://docs.python-guide.org/en/latest/writing/logging/)
- [官方文档](https://docs.python.org/2/howto/logging.html)

```
import sys
import logging
# create logger
logger_name = "default-log"
logger = logging.getLogger(logger_name)
logger.setLevel(logging.DEBUG)

ch = logging.StreamHandler(sys.stdout)
ch.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)-15s %(levelname)s - %(message)s')
ch.setFormatter(formatter)
logger.addHandler(ch)

# create file handler
log_path = __file__[:-3] + '.log'
fh = logging.FileHandler(log_path)
fh.setLevel(logging.DEBUG)
fmt = "%(asctime)-15s %(levelname)s - %(message)s"
datefmt = "%a %d %b %Y %H:%M:%S"
formatter = logging.Formatter(fmt, datefmt)
fh.setFormatter(formatter)
logger.addHandler(fh)
```
