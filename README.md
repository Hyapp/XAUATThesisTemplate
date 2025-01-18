# 2025 西安建筑科技大学硕士毕业论文模板

这是按照2024年西安建筑科技大学LaTeX模板改的之前学姐学长的模板。

感谢UCAS的大佬提供的原始模板。


## 使用方法

### 下载
直接下载：右上面找绿色Code, 点最下面 Download zip

或在安装了git的电脑上在 Shell 切换到对应的文件夹中运行

```Shell
git clone https://github.com/Hyapp/XAUATThesisTemplate.git
```
### 编译

编译 main.tex 即可

使用XeLaTeX编译，若之前没有编译过，则需要编译两遍来生成引用(cite, reference)等；更改同理

### Windows
使用 TexLive 或 CTex 安装版均可以编译，CTex发行版第一次编译需要下载缺少的包体，请保持网络连接

### Mac/Linux
需要安装缺少的字体，可以搜教程从 Windows 中提取字体，或使用 Adobe 字体。

若使用 Adobe 字体则需要将main.tex文件的第一行改为

```latex
\documentclass[doublesided, adobefonts, ctexart]{Style/xauat}
```

<font color=red> Windows 中的字体； 和 adobe系字体是有版权的！请自行安装！！！ </font>

## 改个人信息
在 Texs/Frontpages.tex 中更改对应的内容即可

## 一些建议

建议将自己的命令加到 custom.sty 的末尾，比如自定义：定理、公式、编号等

建议将固定的信息加入 xauat.cfg 中，每个用户不同的信息放入 tex 文件中，而不是写死

建议将章节分成单独的文件，在 main.tex 中去掉多余章节的 input 行，在编写时速度快，最后整理与生成目录与引用时，将所有 input 添加进去

## 已知存在的问题

正文与上面的线距离太小；

因为2025年的学校模板未出，封面结构延续了2024年，等今年学校公布模板后再更改，

到时只需要更改模板文件，无需更改自己写的tex文件！

...

## 更新与版本
1. 2015-1-8， 20:00
上传修改后的第一版。

2. 2025-1-18, 10:50
恢复了直接引用bib文件的能力，使用 gkt-7714-2015-numerical 中的方案，详见 main.tex 中对文献的引用方式。
修改命令 \mycite 为 \themcite 更加规范。

## 欢迎大家 Star，有能力的大佬们提 PR 