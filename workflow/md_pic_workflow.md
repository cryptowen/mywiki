# 使用七牛云存储和alfred的workflow简化markdown贴图流程

> 使用markdown最头疼的问题就是贴图问题。一方面我们习惯于从剪贴板直接用图片，但因为markdown是纯文本，不支持粘贴图片，需要将图片保存——获取图片地址——插入文章，操作过程十分繁琐。另一方面，如果图片使用绝对链接挂在当前地址下，编辑器的支持效果不好，访问慢，也不好管理。

> 本文介绍如何使用七牛云存储作为图床，借助Alfred的workflow将剪贴板图片保存到某个文件夹下，让该文件夹自动同步到图床，然后将图片地址自动插入文章。

1. 如果还没有[Alfred][4]的话请自行下载安装

	- [Alfred简介][5]
	- Alfred是收费软件，有条件的话建议大家支持正版，想要体验一下可以参考[这里][6]
	
2. [创建Alfred工作流][1]，链接里有详细的指导，文章中的如下两行要根据自己的情况进行修改

	```
    set filePath to "/Users/viecks/Datas/Blog/octopress/source/images/attaches/" --这里换成你自己放置图片的路径
	
	set markdownUrl to "![](http://attaches-mirror.qiniudn.com/images/attaches/" & fileName & ")" 
	```
	
	第一个`filePath`引号中的内容改成你想要放置同步图片的文件夹，第二个`markdownUrl`我们稍后会提到
	
3. 如果还没有七牛云存储的账号，点[这个链接][7]注册，这是一个推广链接，点击后会给我增加流量，如果你不愿意这么做，可以自行前往官网申请账号。七牛给每个用户提供10G的免费存储空间，每个月10G的下载流量、10万次PUT/DELETE请求、100万次GET请求。访问速度也很不错。

4. 参考[这里][2]新建一个空间，假定你的空间名为`test`，那么七牛会给所有放在当前空间中的文件生成链接`http://test.qiniudn.com/somefile.png`

5. 配置自动一个文件夹，让其中的图片能够被自动上传到七牛的空间。下载[QRSBox][8]，参考链接配置成自动同步之前我们放图片的文件夹；

6. 回到第2步中的脚本，将`markdownUrl`改成你的七牛空间地址，如果你的空间名为`test`，则改为`http://test.qiniudn.com/`

到这儿我们就大功告成了，试验一下：

1. 使用QQ截图或者[系统截图][Mac 截图解决方案]将图片截到剪贴板

2. 将光标点到需要插入图片的位置，按快捷键`CTL + CMD + V`（也可以自己在Alfred中自定义其它快捷键），会看到在文章中多出了一行类似下面的东西
	
	```
	![text](http://wenchao-img.qiniudn.com/b0e59e029fb55557b8712c35dce9c777.png)
	```
	![图片预览](http://wenchao-img.qiniudn.com/6da49c84f18372292a240a365b59fe15.png)

	在实时预览的编辑器中就可以看到效果了。

## 参考链接

- [简化静态博客发图的Alfred工作流][1]
- [七牛云存储新手引导][2]
- [七牛云存储自动同步][3]

[1]: http://www.jianshu.com/p/2dd051b0b87c
[2]: https://portal.qiniu.com/tutorial/index
[3]: http://developer.qiniu.com/docs/v6/tools/qrsbox.html
[4]: http://www.alfredapp.com/
[5]: http://www.cnblogs.com/chijianqiang/p/alfred.html
[6]: http://pan.baidu.com/wap/link?uk=1476602582&shareid=787543447&third=0
[7]: https://portal.qiniu.com/signup?code=3lda4a1zc6q8i
[8]: http://developer.qiniu.com/docs/v6/tools/qrsbox.html
[Mac 截图解决方案]: http://zh.wikihow.com/%E5%9C%A8Mac-OS-X%E4%B8%8A%E6%88%AA%E5%8F%96%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE