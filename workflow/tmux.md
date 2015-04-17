# tmux使用指南

## 资源列表
- [终端环境之tmux][1], 一个不错的中文tmux介绍
- [iTerm2和tmux结合使用][2]，iTerm2自带的tmux整合功能介绍，神器
- [tmux: 不用鼠标的高效率开发][3]，一个电子书+视频，讲了很多使用技巧。具体介绍可以看[这个视频][4]。


## 安装
- mac、ubuntu、centos：用homebrew，yum或apt-get安装
- [centos手动安装][5]

## 工作流
1. 登陆服务器(`ssh xxx`)，创建tmux session(`tmux`)，如要指定名字可以使用(`tmux -S name`).
2. 根据tmux的语法使用和新建窗口，用完后直接关闭该tab
3. 下次使用可以先ssh上去，然后执行`tmux a`，如需指定名字用`tmux a -t name`。如果使用的是iTerm2，可以使用集成模式，加上`-CC`参数，如`tmux -CC a`
4. 使用频繁的话可以在iTerm2中创建profile，示例如下所示：
    ![iTerm profile](http://wenchao-img.qiniudn.com/2917474f0ff4e1df8dfc4377858c1b5b.png)
    使用快捷键打开该profile，自动ssh到服务器，发送命令`tmux -CC a`打开tmux session。
    使用完后回到打开tmux的窗口，按esc退出，或使用快捷键`ctrl + cmd + shift + d`退出。
    ![quit iterm tmu mode](http://wenchao-img.qiniudn.com/33f4b4577190fc0df7c1efce3fd767c7.png)


[1]: http://foocoder.com/blog/zhong-duan-huan-jing-zhi-tmux.html/
[2]: https://code.google.com/p/iterm2/wiki/TmuxIntegration
[3]: https://pragprog.com/book/bhtmux/tmux
[4]: https://www.youtube.com/watch?v=JXwS7z6Dqic
[5]: http://spenserj.com/blog/2013/11/11/installing-tmux-in-centos/
