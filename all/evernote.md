# 使用印象笔记 python sdk 从模板创建每日日记

翻看印象笔记，发现已经坚持记了 1000+ 的日记，格式都是流水账格式。
最近觉得『晨间日记』和『格志日记』的模板方法蛮好的，可以比较容易的引导自己思考和回顾一天，
但是直接使用格志日记 APP 又觉得丧失了自由度，不如在印象笔记里面写起来随性好控制。

印象笔记本身有一些[模板](https://list.yinxiang.com/)，但是使用起来并不方便，
每天写日记还得复制一遍模板到对应的笔记本。于是想每天自动根据指定的模板生成日记，
并将标题置为当天的日期。

看了下 [IFTTT](https://ifttt.com/discover)，发现里面的印象笔记模块只能做创建、
更新等简单操作，无法满足上述需求。
于是研究了下印象笔记的 API，可以用 Python SDK 比较方便的写脚本解决这个问题（需要有基本的python知识）。
扩展开来，也可以参考这个做一些类似的对于印象笔记的自动化操作。

## 使用流程
### 创建笔记模板

在印象笔记里新建一条笔记，作为你自己的日记模板。具体内容可以参考晨间日记和格志日记的方法（文末有参考链接）。
记住你创建的笔记标题，一会儿脚本里要用到。

![晨间日志的奇迹](http://7o4zqy.com1.z0.glb.clouddn.com/67e99eec19c51b17732897dbb1677ad8.png)

[《晨间日记的奇迹》](https://book.douban.com/subject/3744041/)

![格志日记](http://7o4zqy.com1.z0.glb.clouddn.com/617597f70de0416013fa8456bae52def.png)
![格志日记界面](http://7o4zqy.com1.z0.glb.clouddn.com/357112b5d1c9daa3e2cdc2b7058d4155.png)

[格志日记](http://griddiaryapp.com/zh/)

### 获取 developer token

如果你还没有获取过 developer token，访问 <https://app.yinxiang.com/api/DeveloperToken.action>。
生成并记录你的 Token。

![create a developer token](http://7o4zqy.com1.z0.glb.clouddn.com/c9f0be37c38441eb8f300b4458772af2.png)

![developer token](http://7o4zqy.com1.z0.glb.clouddn.com/5214103a53c1713ae21dc27433fb9b09.png)

### 安装 evernote sdk，测试脚本

安装 evernote sdk

```
pip install evernote
```

将下列代码复制到 python 文件中，修改对应的配置，并在本地运行测试。

```
# -*- coding: utf-8 -*-
"""
搜索并复制指定的印象笔记模板，到指定的文件夹。
"""
import logging
import datetime
import evernote.edam.userstore.constants as UserStoreConstants
import evernote.edam.type.ttypes as Types
from evernote.api.client import EvernoteClient
from evernote.edam.notestore import NoteStore

logging.basicConfig(level=logging.INFO)

"""
配置区域，请自行修改
- auth_token: 访问 https://app.yinxiang.com/api/DeveloperToken.action 生成
- diary_template_name：日记模板名称，请保证有且仅有一个标题为这个的笔记
- diary_notebook_name：复制生成的笔记要放入哪个笔记本，填写笔记本名称
"""
auth_token = "your token here"
diary_template_name = '日记模板'
diary_notebook_name = 'diary'

# 日记标题。个人习惯用形如 『20170325（周六）』这样的标题，可以根据自己的需求修改。
weekday_chinese_map = {
    0: '周一',
    1: '周二',
    2: '周三',
    3: '周四',
    4: '周五',
    5: '周六',
    6: '周日',
}
now = datetime.datetime.now()
diary_title = '%s（%s）' % (now.strftime('%Y%m%d'),
                          weekday_chinese_map[now.weekday()])
logging.info('diary_title: %s', diary_title)

client = EvernoteClient(token=auth_token, service_host='app.yinxiang.com')

user_store = client.get_user_store()

note_store = client.get_note_store()

# 定位日记所在笔记本 guid
notebooks = note_store.listNotebooks()
logging.debug('Found %s notebooks', len(notebooks))
for notebook in notebooks:
    logging.debug('guid: [%s], notebook [%s]', notebook.guid, notebook.name)
    if notebook.name == diary_notebook_name:
        logging.info('found diary notebook! guid: [%s], notebook [%s]',
                     notebook.guid, notebook.name)
        diary_notebook_guid = notebook.guid
        break
else:
    logging.critical('diary [%s] not found', diary_notebook_name)
    exit(1)

# 定位日记模板 guid
noteFilter = NoteStore.NoteFilter(words=diary_template_name)
spec = NoteStore.NotesMetadataResultSpec()

nmdList = note_store.findNotesMetadata(noteFilter, 0, 250, spec)
logging.debug('nmdList: %s', nmdList)
for n in nmdList.notes:
    note = note_store.getNote(n.guid, True, True, False, False)
    logging.debug('guid: [%s], title: [%s]', note.guid, note.title)
    if note.title == diary_template_name:
        logging.info('found diary template note! guid: [%s], title: [%s]',
                     note.guid, note.title)
        diary_template_guid = note.guid
        break
else:
    logging.critical('diary_template [%s] not found', diary_template_name)
    exit(1)

# 复制模板，生成笔记，修改标题
res_note = note_store.copyNote(diary_template_guid, diary_notebook_guid)
res_note.title = diary_title
res_note = note_store.updateNote(res_note)
logging.info('create diary for %s done!', now)
```

### 部署到服务器定时执行

本地测试脚本没问题的话，可以部署到服务器上，使用 crontab 每天定时执行。

参考配置(每天 00:01 执行，创建日记)：

```
1 0 * * * bash -c 'cd ~/scripts && python create_dairy_from_template.py >> ~/scripts/create_dairy.log 2>&1'
```

## 参考链接

- 晨间日记
    - [用印象笔记Evernote写图文并茂的晨间日记](http://www.lishen.me/archives/333)
    - [晨间笔记模板](https://list.yinxiang.com/moban/b21af494-2e61-4f3f-835c-911769c453db.php)
- 印象笔记 python sdk
    - [印象笔记 Python SDK 快速入门指南][3]
    - [evernote-sdk-python3 github 地址][2]
    - [印象笔记 Python SDK 踩坑记][1]
    - [API 文档参考](http://dev.evernote.com/doc/reference/NoteStore.html)
    - [获取一个笔记本下的所有笔记](http://sf.geekitude.com/content/getting-all-notes-notebook-evernote-api-and-python)
- 其它
    - [crontab 配置说明](http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/crontab.html)

[1]: http://www.liuhaihua.cn/archives/482381.html
[2]: https://github.com/evernote/evernote-sdk-python3
[3]: https://dev.yinxiang.com/doc/start/python.php
