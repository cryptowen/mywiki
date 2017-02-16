# Mac 开发工具链

## 终端环境

![iTerm](http://wenchao-img.qiniudn.com/b0daa0d854faddf99732b057a77ecb02.png)

### iTerm
Mac自带终端的替代品，功能上有一定的强化。


个人常用的功能有：

- 全局快捷键。我自己将全局快捷键设置成了`CMD + .`，快速调出终端
- 标签更改颜色，区分开发的Tag和其他临时Tag
- 自定义Profile，可以通过快捷键快速打开一个新终端，并指定该终端开启前执行命令。如我设定了一个新Profile，打开时执行ssh命令，可以一键打开一个新的终端连接到dev环境。
- 娱乐功能：找不到光标时按`CMD + /`可以快速找到光标
	
	![iTerm找光标](http://wenchao-img.qiniudn.com/08834b2bffe95e5ea9d5f004466bea54.png)

参考链接：

- [官网](http://iterm2.com/)
- [新手应该知道的功能](http://www.yangzhiping.com/tech/iterm2.html)

### oh-my-zsh

Mac的自带shell是bash，zsh是另一款功能强大的shell，而**oh-my-zsh**是一个配置好了的zsh。相比于bash更强大。

安装方法：`curl -L http://install.ohmyz.sh | sh`

个人常用的强大之处：

- 自带插件支持显示当前分支及其编辑状态，如下图中会显示当前目录路径、所在分支、闪电表示分支有改动（此处用的主题是`pygmalion`，可以在`.zshrc`中配置）
- 各种自带alias，大部分常用命令尤其是git命令都可以少敲很多次键盘。详见[此处](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet)；

	![text](http://wenchao-img.qiniudn.com/bc2394209ed99a6303df48692b2d01d1.png)

- 强大的自动补全：Tab键可以补全几乎所有的命令，敲错的可以自动纠错，需要指定文件的操作按Tab可以直接列出当前文件等等。


参考链接：

- [官网](http://ohmyz.sh/), [github地址](https://github.com/robbyrussell/oh-my-zsh)


### SOLARIZED配色方案
[Solarized](http://ethanschoonover.com/solarized) 是目前最完整的 Terminal/Editor/IDE 配色项目，几乎覆盖所有主流操作系统（Mac OS X, Linux, Windows）、编辑器和 IDE（Vim, Emacs, Xcode, TextMate, NetBeans, Visual Studio 等），终端（iTerm2, Terminal.app, Putty 等）。

该方案有`Light`和`Dark`两种，本文中所有截图的配色都是其`Dark`方案。
具体设置方法可以参考本文：[在 Mac OS X 终端里使用 Solarized 配色方案](http://www.vpsee.com/2013/09/use-the-solarized-color-theme-on-mac-os-x-terminal/)。

![text](http://wenchao-img.qiniudn.com/177b85c453da42e04bc3a3f59a2db63d.png)

### `HomeBrew`工具
[HomeBrew](http://brew.sh/index_zh-cn.html)是Mac OS X是一个强大的安装工具，几乎所有的软件，尤其是开发软件都可以用它来一键下载。

安装方法：执行命令`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

使用方法：如安装`redis`可以用`brew install redis`，其他如`MySQL`、`Nginx`等都可以这么安装。

### spf13-vim
[spf13-vim](https://github.com/spf13/spf13-vim)是一个通用的Vim配置，集成了各种常用Vim配置，非常强大。想要体验Vim的强大又不愿意自己折腾各种配置的可以试试这个。

可以一键安装，命令：`curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh`

效果图：
![spf13-vim](https://camo.githubusercontent.com/129d88b395fceb289f88ea9b67de6928e6c46025/68747470733a2f2f692e696d6775722e636f6d2f6b5a576a312e706e67)

## 其它工具
### Alfred
一个类似Mac自带的Spotlight的东西，可以搜索电脑上的几乎任何东西，还有强大的工作流(Workflow)，可以自定义各种快捷键，几乎所有你在电脑上的操作都可以通过这个工具自动化。

![text](http://wenchao-img.qiniudn.com/1028f70caaeba06d21c41e3d82d2bf78.png)

个人常用到的功能：

- 配合`Dash`快速查文档
	
	![text](http://wenchao-img.qiniudn.com/373c326773f098bf4e7dd1c258d16018.png)

- 快速启动软件

	![text](http://wenchao-img.qiniudn.com/2879d28a54830d09b706e5ae612b23bf.png)
	
- 使用Workflow自动化操作。例如我在写Markdown文档时，因为插入图片非常的麻烦，需要**将图片放到某个文件夹——复制到该文件夹下的链接——将该图片地址以`![text](http://wenchao-img.qiniudn.com/373c326773f098bf4e7dd1c258d16018.png)`格式输入文档**一系列操作，在使用Workflow后该流程被简化为两个操作：**复制图片——快捷键`CMD+OPT+V`插入图片**。可以参考以下链接:
	- [借助 Alfred 2 的 Workflows 功能可以做哪些好玩的事情？](http://www.zhihu.com/question/20656680)
	- [自动保存图片和插入地址的Alfred Workflow](http://www.jianshu.com/p/2dd051b0b87c)

![text](http://wenchao-img.qiniudn.com/04b3081e0c0e141fe1850a0670081213.png)

这个是付费软件，破解版可以戳[这里](http://pan.baidu.com/s/1qW6vcVM)。


### Dash
Dash是一个离线文档工具，查文档时再也不用google了，配合Alfred使用可以快速查文档。
这个同样是付费软件，破解版请戳[这里](http://pan.baidu.com/s/1dDkwNnj)。

![text](http://wenchao-img.qiniudn.com/687bacfaca0e7bc8ed44436f8f49a7f7.png)

### Moom
Moon是一个窗口管理工具。当年用Win的时候按`Win + ←`自动靠左半边对齐的感觉非常爽，Mac的窗口管理很麻烦，这个工具补上了这一点。

这是本人的配置，自定义了三个全局快捷键：全屏、左半边对齐和右半边对齐。从此左手文档，右手Excel，写代码无压力。

![text](http://wenchao-img.qiniudn.com/7f801cfd2774c0564ef4bc53358102a0.png)

![text](http://wenchao-img.qiniudn.com/17d8b6b7400581a419a094b611d18d04.png)

这个同样是付费软件，破解版请戳[这里](http://pan.baidu.com/s/1dD5v77j)

### Chrome插件：JSON-handle

> 对JSON格式的内容进行浏览和编辑，以树形图样式展现JSON文档，并可实时编辑。

在浏览器里调试接口时用起来比较方便，可以清晰的看到返回值的结构，找数据比较方便。

下载地址：<https://chrome.google.com/webstore/detail/json-handle/iahnhfdhidomcpggpaimmmahffihkfnj?hl=zh-CN>

安装后打开下面网址可以看到JSON-handle启动的效果：
<http://viewvc.svn.mozilla.org/vc/libs/product-details/json/firefox_versions.json?view=co&revision=103936&content-type=text%2Fplain>

![JSON-handle使用效果预览](http://wenchao-img.qiniudn.com/e7a398b6e9551062798de42d4952c310.png)


