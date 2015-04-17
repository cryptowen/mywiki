# 用Markdown写一本自己的开源电子书

> 很多人心中都有一个作家梦。本书介绍如何借助[gitbook][gitbook]，用markdown写一本自己的开源电子书。

## gitbook简介

gitbook既是一个工具，安装该工具后可以在本地生成和预览电子书，也是一个网站，可以全程在网站上创建、书写、阅读自己的电子书。

参考资料

- 使用gitbook创建的电子书：[《The Swift Programming Language》中文版][3]、 [Docker —— 从入门到实践][4]，更多可以参见[gitbook explore][5]
- [gitbook使用文档][6]: 里面有详细的使用指南


![效果预览：封面](http://wenchao-img.qiniudn.com/44137-f50bc24e7e69f7cb.png)

![效果预览：内容](http://wenchao-img.qiniudn.com/44137-df39b8961767b774.png)


## 特性
Gitbook支持的特性如下，简要翻译几个：

- ***使用markdown进行写作***。简书的最大特色就是支持markdown，所以大多数的读者应该都比较熟悉了。如果你还不太了解，可以参考我之前的文章[《Markdown：让书写更美好》][1]；
- ***版本控制***。使用git做版本控制，你可以轻易找回你的任何一次历史记录；
- ***全平台支持***。生成的电子书可以在线阅读，支持响应式布局，在手机、平板、电脑上均有良好的阅读体验。同时支持生成ePub、Mobi和PDF电子书，可以在电脑、kindle、苹果设备、手机等所有终端直接查看；
- ***版权归自己所有***。平台只是进行技术支持，如果你要出版自己的书，可以不受平台限制。
- ***支持github***。[github][github]是最火爆的协作编程网站，几乎所有的程序员都知道的地方。如果你需要一点入门知识，可以参考[这里][2]；
- ***在线编辑器***。如果你不熟悉github，你可以使用网站提供的在线编辑器直接进行编辑。
- ***多人协作***。既可以使用github作为托管进行多人协作，也可以直接在gitbook网站上设置管理员和贡献者名单。可以很方便的多人合作完成同一本书。

![Gitbook支持的特性](http://wenchao-img.qiniudn.com/44137-a87b837936f99bc0.png)

## 简易入门参考

1. 注册账号，或用其它账号登陆（支持facebook，twitter，google和github账号登陆）

    ![登陆](http://wenchao-img.qiniudn.com/44137-e12bf5a4a950b722.png)

1. 创建新书

    ![创建新书](http://wenchao-img.qiniudn.com/44137-74c36b4a7cda19ac.png)

1. 进入电子书进行编辑

    ![编辑电子书](http://wenchao-img.qiniudn.com/44137-c756740a678302b4.png)

1. 在写作区进行写作，预览区可以实时看到效果。如需增加章节信息，编辑左边的目录区。

    ![gitbook在线编辑器示意图](http://wenchao-img.qiniudn.com/44137-5ed4fb5c672c0b08.png)

1. 新建章节和节

    ![新建章节](http://wenchao-img.qiniudn.com/44137-dc07f3c8fa0bcacd.png)
    
    ![新建节](http://wenchao-img.qiniudn.com/44137-a04d9173618843de.png)
    
    在目录区双击你要编辑的章节即可编辑对应章节。

1. 点击右上角有添加插件、新建分支、编辑书籍封面等功能。

    ![右上角菜单](http://wenchao-img.qiniudn.com/44137-24b0425673a24c9b.png)

1. 我们来看一下刚才生成的页面

    ![测试电子书页面](http://wenchao-img.qiniudn.com/44137-ab0fe3601169c7ae.png)

1. 你所有的改动会都会被保存，在离开写作区后，gitbook会自动构建，生成最新版的网站和PDF、Mobi、ePub电子书，返回你的个人主页即可查看。更详细的使用方法请参见[官方文档][6]。

## 参考网站

- [gitbook官网][gitbook]
- [github官网][github]
- [《The Swift Programming Language》中文版][3]
- [Docker —— 从入门到实践][4]
- [《Markdown：让书写更美好》][1]

[gitbook]: https://www.gitbook.com/
[github]: https://github.com/
[1]: http://www.jianshu.com/p/17fdcf17bbb4
[2]: http://jingyan.baidu.com/article/f7ff0bfc7181492e27bb1360.html
[3]: http://numbbbbb.gitbooks.io/-the-swift-programming-language-/
[4]: http://yeasy.gitbooks.io/docker_practice/
[5]: https://www.gitbook.com/explore
[6]: http://help.gitbook.io/index.html
