# Markdown：让书写更美好

![文章思维导图](http://wenchao-img.qiniudn.com/a53403c34c199fdd759571c2997ed910.png)

## Markdown简介

> Markdown 是一种轻量级标记语言，创始人为约翰·格鲁伯（John Gruber）。它允许人们“使用易读易写的纯文本格式编写文档，然后转换成有效的XHTML(或者HTML)文档”。[1]这种语言吸收了很多在电子邮件中已有的纯文本标记的特性。	
> ——维基百科

优点：

- 简单，容易上手
- 纯文本实现，程序员最爱，容易扩展，方便和其他工具联动
- 平台支持广：以Github为首的各种平台、各种博客都支持，基本上现在面向程序员的输入框都可以用Markdown来写了
- 丰富的工具链
	- 编辑器：各种支持所见即所得的编辑器
	- 和各种其他格式互相转化的工具。PDF、Mobi、Epub、HTML等等，几乎你能想到的所有格式它都能转
	
## Markdown语法

- [最好入门的简明语法](http://ibruce.info/2013/11/26/markdown/)
- [简明版 Markdown 语法说明(简体中文版)](http://wowubuntu.com/markdown/basic.html)
- [完整版 Markdown 语法说明(简体中文版)](http://wowubuntu.com/markdown/index.html)
- [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/)

## Markdown工具链
### Markdown 编辑器

* Windows 平台
	* [MarkdownPad](http://markdownpad.com/)
	* [MarkPad](http://code52.org/DownmarkerWPF/)
* Linux 平台
	* [ReText](http://sourceforge.net/p/retext/home/ReText/)
* Mac 平台
	* ***[Mou](http://mouapp.com/)***，应该是Mac下目前最好的markdown编辑器，推荐使用。
* 在线编辑器
	* [Markable.in](http://markable.in/)
	* [Dillinger.io](http://dillinger.io/)
- 浏览器插件
	- [MaDe](https://chrome.google.com/webstore/detail/oknndfeeopgpibecfjljjfanledpbkog) (Chrome)
	- ***[马克飞象](http://maxiang.info/)***，用来写印象笔记的客户端，支持TOC、LaTex 公式、流程图、时序图等扩展语法，支持直接从剪贴板粘贴图片。缺点是只支持用来写印象笔记，并且只能试用10天，收费79每年。如果平时有用印象笔记记录的习惯，推荐使用。
- 高级应用
	- [Sublime Text 2](http://www.sublimetext.com/2) + [MarkdownEditing](http://ttscoff.github.io/MarkdownEditing/) / [教程](http://lucifr.com/2012/07/12/markdownediting-for-sublime-text-2/)

Mou
![Mou截图](http://wenchao-img.qiniudn.com/b44ec598c54b736b5ea621112f993a21.png)

马克飞象
![马克飞象截图](http://wenchao-img.qiniudn.com/513b1b89566dd2a15935bee064221974.png)

### 格式转化

- [Pondoc](http://johnmacfarlane.net/pandoc/)，号称格式转化的瑞士军刀，可以转化成几乎任何格式
- 制作自己的博客
	- [jekyll](http://jekyllcn.com/)，Github原生支持的一个静态博客，ruby写的，可以直接用Github pages托管，相当于拥有了一个挂在github上的免费个人博客；
	- [Octopress](http://octopress.org/)，基于jekyll，做了一些改进；
	- [Hexo](http://hexo.io/index.html)，一个台湾人写的markdown静态博客框架，使用NodeJS实现，速度快，轻量级，主题也比较小清新。
- 制作文档
	- [readthedocs](https://readthedocs.org/)，使用最广的文档服务，如[Scrapy 文档](https://scrapy-chs.readthedocs.org/zh_CN/0.24/index.html)，支持Restructed和Markdown语言，其Markdown支持通过mkdocs来实现；
	![Scrapy 文档](http://wenchao-img.qiniudn.com/d2f8561a4053477b739c07572d634361.png)
	- [mkdocs](http://www.mkdocs.org/)
- 制作电子书
	- [gitbook](https://www.gitbook.com)，利用Markdown写电子书的工具，并提供免费托管。开源电子书[Docker —— 从入门到实践](http://yeasy.gitbooks.io/docker_practice/)即是托管在上面的。我的笔记网站也是通过该工具生成的。
	![Docker —— 从入门到实践电子书](http://wenchao-img.qiniudn.com/6d8b05152f4095b25b2dfc6d99d85692.png)
- 制作slides
	- [reveal.js](https://github.com/hakimel/reveal.js), [Demo](http://lab.hakim.se/reveal-js/#/)
	- [landslide](https://github.com/adamzap/landslide), [Demo](http://adamzap.com/misc/presentation.html#slide1)
	
	
## 参考链接
- [自动保存图片和插入地址的Alfred Workflow](http://www.jianshu.com/p/2dd051b0b87c)
- [七牛云存储自动同步](http://developer.qiniu.com/docs/v6/tools/qrsbox.html)
- [Mac 截图解决方案](http://zh.wikihow.com/%E5%9C%A8Mac-OS-X%E4%B8%8A%E6%88%AA%E5%8F%96%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE)
- [MarkDown 语法](http://help.gitbook.io/book/markdown.html)
- [Markdown转ppt工具reveal.js](https://github.com/hakimel/reveal.js), [Demo](http://lab.hakim.se/reveal-js/#/)
- [Markdown+Pandoc→HTML幻灯片速成](http://www.soimort.org/posts/165/)
- [Markdown介绍slide](http://aleung.github.io/presentation/markdown/slides.html)
- [landslide](https://github.com/adamzap/landslide)
- [gitbook 使用入门](http://dockerpool.com/static/books/gitbook_cn/index.html)