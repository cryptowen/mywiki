# 用Markdown和Landslide来写PPT

> 之前写了一篇[《Markdown：让书写更美好》][7]来介绍Markdown的丰富工具链。今天为了给公司分享Markdown，实验了一把用Markdown来写PPT。本文介绍如何使用[Landslide][1]来制作一个极客范儿的PPT。

## [效果演示][5]，[Markdown源码][4]

效果演示图：

![导航模式](http://wenchao-img.qiniudn.com/62179675c1d60f7e845f22ebc4190262.png)

![全屏模式](http://wenchao-img.qiniudn.com/179cb1d619e04bdc7013430d3d36c53d.png)

![目录](http://wenchao-img.qiniudn.com/f2163ce59af9149adc2e9e29eb8969eb.png)

## 使用步骤

[Landslide][1]是基于Google的[html5slides][2]的一个Slide生成工具，可以将markdown, ReST 或者  textile文件转化成HTML5的slide。该转化支持内联模式，即生成一个具有完整功能的HTML文件，将依赖的css等东西放入其中，很容易用来分享。

1. 安装：该工具是用python写成的，使用[pip][3]工具安装。
	
	```
	$ pip install landslide
	```
	也可以使用源码安装：
	
	```
	$ git clone https://github.com/adamzap/landslide.git
	$ cd landslide
	$ python setup.py build
	$ sudo python setup.py install
	```
	
1. 书写你的md文件，以下是官方提供的测试用例，可以生成[这个页面][6]，或者参考我的[源码][4]和这里的[演示效果][5]。

	```
	# Landslide
	
	---
	
	# Overview
	
	Generate HTML5 slideshows from markdown, ReST, or textile.
	
	![python](http://i.imgur.com/bc2xk.png)
	
	Landslide is primarily written in Python, but it's themes use:
	
	- HTML5
	- Javascript
	- CSS
	
	---
	
	# Code Sample
	
	Landslide supports code snippets
	
	    !python
	    def log(self, message, level='notice'):
	        if self.logger and not callable(self.logger):
	            raise ValueError(u"Invalid logger set, must be a callable")
	
	        if self.verbose and self.logger:
	            self.logger(message, level)
	```

1. 执行命令

	```
	$ landslide file.md -i -o > name_you_like.html
	```
	将markdown文本`file.md`转化成你的slide文件`name_you_like.html`。参数`-i`是为了将所有依赖文件（如css）整合到这一个文件中，让你能够简单的分享和移动该slide。`-o`参数是讲输出重定向到标准输出流，再用`> file`来指定保存的文件名，也可以不使用该参数生成默认文件名`presentation.html`。
	
1. 在浏览器中打开生成的HTML文件就可以看到你的PPT了，效果酷炫，还支持各种快捷键。以下列出了一些常用的：

	```
	h: 		展示帮助
	← →:	上/下一张幻灯片
	ESC:	展示目录
	n:		显示当前是第几张幻灯片
	b:		屏幕全黑
	e:		使当前幻灯片最大化
	3:		展示伪3D效果
	c:		取消显示前后幻灯片预览，只显示当前幻灯片
	```
	更多命令和功能请参考[官网][1]
	
## 参考链接
- [landslide的github地址][1]
- [google的html5slides项目][2]
- [安装和使用pip][3]
- [我写的markdown简介源码][4]
- [我写的markdown简介幻灯片成品][5]
- [landslide官方DEMO][6]
- [《Markdown：让书写更美好》][7]


[1]: https://github.com/adamzap/landslide
[2]: https://code.google.com/p/html5slides/
[3]: https://pip.pypa.io/en/latest/installing.html
[4]: http://wenchao-img.qiniudn.com/markdown_slide.md
[5]: http://wenchao-img.qiniudn.com/markdown.html
[6]: http://adamzap.com/misc/presentation.html
[7]: http://www.jianshu.com/p/17fdcf17bbb4