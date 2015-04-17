# Git工作流
## 常用Git命令总结

下面总结了最常用的命令。推荐使用[oh-my-zsh](http://ohmyz.sh/)，里面内置了插件可以在shell中看到当前分支，并且对常用git命令做了[缩写](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet)，具体可参考我的另一篇文章《mac开发工具链》。

![text](http://wenchao-img.qiniudn.com/bfc09f66145859290f98cd3d96790075.png)

```
# 开发工作流
git status			# 查看当前工作区状态
git diff			# 查看当前工作区的改变
git diff file		# 查看具体某个文件的改变
git add file		# 增加新的文件
git commit -m 'some comment'	# 将缓存区的变动放入历史版本库
git commit -a -m 'sime comment'		# 如果只是改动旧文件可以将前两个命令合并为这一个命令

# 拉取远端最新代码，并合并到当前分支，直接写git pull的话默认远端库为origin，分支为当前分支，push同理
git pull origin master 
git push origin master

# 玩儿坏了某些文件的时候
git checkout file	# 将某个文件恢复到改变之前的状态
git reset --hard HEAD			# 将工作目录恢复到最后一次提交的情况
git reset --hard HEAD^			# HEAD^表示HEAD的前一次，即倒数第二次提交，同理可有HEAD^^等
git reset --hard e1d3cc608a20108232	# 太久远的可以直接用该commit的sha1来reset
git log				# 查看历史提交

# 分支管理
git checkout release	# 切换到某个分支
git checkout -b feature/xxx		# 从当前分支新建分支
git checkout master		# 切回master分支 
git pull . feature/xxx	# 将feature/xxx分支拉倒当前分支
git branch 				# 显示分支列表
git branch -d xxx		# 删除xxx分支（如果分支没被merge的话会报错，要强制删除可以将-d选项改成-D）
git push --delete origin xxx1 xxx2	# 删除远端分支，可以同时删多个

# 标签管理
git tag -l 				# 列出所有标签，支持通配符搜索
git tag -l 't2*'
git tag t2.00.01		# 打标签
git tag -d t2.98.98		# 删除本地标签
git push --delete origin t2.98.98	# 删除远程标签
git push --tag			# 标签推到远端

# 如果在某个分支上开发到一半需要切到另一分支去改bug时，可以使用下列命令
# 先执行`git stash`保存然后去干别的事情
# 回来后再执行`git stash pop`找回刚刚的状态
git stash
git stash pop
```

## 参考

- [《Pro Git》电子书中文版](http://git-scm.com/book/zh/v1)，非常好的一本开源中文电子书，权威著作，值得一看
- [《Git权威指南》](http://book.douban.com/subject/6526452/)，国人写的git电子书，个人看了几章，感觉不错，推荐
- 博客和文章
	- [Git学习笔记（三） Git暂存区](http://blog.csdn.net/agul_/article/details/7835786)
	- [《Git权威指南》读书笔记](http://hustlzp.com/post/2014/03/git-solo)


## Git基本概念理解
### 三个区概念

如下图所示，git可以分为三个区，左边为工作区，右边为版本库，版本库左边的index部分为暂存区，右边为历史版本库。图中标注了三个区的关系，下面再略加说明：

![test](http://img.my.csdn.net/uploads/201208/06/1344242125_1840.png)

- 工作区为我们进行修改操作的区，执行`git add file`后可以将一个文件加入暂存区，执行`git commit`后会将暂存区数据存入历史版本库。
- 执行`git status`后出现的文件有两种状态：
	
	```
	⇒  gst
	On branch master
	Your branch is up-to-date with 'origin/master'.
	Changes not staged for commit:
	  (use "git add <file>..." to update what will be committed)
	  (use "git checkout -- <file>..." to discard changes in working directory)
	
		modified:   index.md
		modified:   workflow/git.md
	
	Untracked files:
	  (use "git add <file>..." to include in what will be committed)
	
		test
	
	no changes added to commit (use "git add" and/or "git commit -a")
	```	
	- `Changes not staged for commit:` 表示暂存区的文件与历史版本库的HEAD不同，可以通过`commit`加入历史版本库，一旦文件被执行过`git add file`则会被自动跟踪修改状态；
	- `Untracked files`表示在工作区但未被跟踪变化的数据，即该文件未进入暂存区；可以通过`git add file`将该文件加入暂存区，以后自动跟踪，也可以在`.gitignore`中加入该文件，让git不再提示未追踪该文件

- 执行`git log`会将历史提交记录显示出来
- 执行`git reset HEAD`（默认用--soft参数）会用历史提交记录的最上面一个（即HEAD，HEAD也可以写成某一个具体的commit的sha1值）替换暂存区数据，即将已经add但未commit的数据全部清空，但是保留工作区的数据，使用效果如下：
	
	```
	⇒  gst
	On branch master
	Changes to be committed:
	  (use "git reset HEAD <file>..." to unstage)
	
		new file:   b
	
	Changes not staged for commit:
	  (use "git add <file>..." to update what will be committed)
	  (use "git checkout -- <file>..." to discard changes in working directory)
	
		modified:   a
	
	Untracked files:
	  (use "git add <file>..." to include in what will be committed)
	
		c
	
	⇒  git reset head
	Unstaged changes after reset:
	M	a
	⇒  gst
	On branch master
	Changes not staged for commit:
	  (use "git add <file>..." to update what will be committed)
	  (use "git checkout -- <file>..." to discard changes in working directory)
	
		modified:   a
	
	Untracked files:
	  (use "git add <file>..." to include in what will be committed)
	
		b
		c
	
	no changes added to commit (use "git add" and/or "git commit -a")
	```

- 执行`git reset HEAD --hard`会将工作区和暂存区数据全部清空，用HEAD信息来替换，我们接着上面的命令继续执行该命令看看效果：

	```
	⇒  git reset --hard head
	HEAD is now at 378e438 add
	⇒  gst
	On branch master
	Untracked files:
	  (use "git add <file>..." to include in what will be committed)
	
		b
		c
	
	nothing added to commit but untracked files present (use "git add" to track)
	```
	可以看出与上面不同的是对a的修改都被清空了。
- 使用`git checkout file`的效果是用HEAD中的该文件信息替换当前工作区的该文件。如我们改动了一个文件，还未提交，我们不想要这些修改了，可以使用该命令。效果如下：
	
	```
	⇒  gst
	On branch master
	nothing to commit, working directory clean
	⇒  cat a
	i am a
	⇒  echo 'hello, world' >> a
	⇒  gst
	On branch master
	Changes not staged for commit:
	  (use "git add <file>..." to update what will be committed)
	  (use "git checkout -- <file>..." to discard changes in working directory)
	
		modified:   a
	
	no changes added to commit (use "git add" and/or "git commit -a")
	⇒  cat a
	i am a
	hello, world
	⇒  git checkout a
	⇒  gst
	On branch master
	nothing to commit, working directory clean
	⇒  cat a
	i am a
	```

### git分支概念
待填坑

## 其他Git操作
### 撤销某次commit所做的修改，并新建commit
命令：`git revert sha1_of_commit`

使用示例：

1. 查看一下过去的提交

	![提交图](http://wenchao-img.qiniudn.com/e1d3cc608a201082324c9c5bb1d9bd93.png)

2. 执行命令`git revert e2ef9de79951616c5facfb7bcdd1b9fbf5f15e61`

	![命令执行效果](http://wenchao-img.qiniudn.com/f67b27c10cae934233e85b4412936ad0.png)

3. 查看效果，多了一个commit，那次做的修改被撤销
	
	![撤销效果图](http://wenchao-img.qiniudn.com/79ce2bb340441dde9b050f098f56a2c1.png)