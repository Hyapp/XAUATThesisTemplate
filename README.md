# 2025 西安建筑科技大学硕士毕业论文模板

这是按照2024年西安建筑科技大学LaTeX模板改的之前学姐学长的模板。
感谢UCAS的大佬提供的原始模板。
有问题可以给我反馈，我修改模板后更新模板即可。
## 使用方法

### 下载

#### 方式 1

直接下载：如果现在在 github 网站中，找右上面找绿色：Code, 点最下面 Download zip
如果现在在 gitee 网站中，找右上角橘红色：克隆/下载，点开后右上角 下载ZIP

下载的 ZIP 文件解压到某个文件夹中！
#### 方式 2
在安装了git的电脑上在 Shell/Powershell 切换到对应的文件夹中运行

```Shell
git clone https://github.com/Hyapp/XAUATThesisTemplate.git
```
### 编译
编译 main.tex 即可
使用XeLaTeX编译，若之前没有编译过，则需要编译两遍来生成引用(cite, reference)等；更改同理
#### 使用 References.tex 管理参考文献
XeLaTeX -> XeLaTeX
即用 XeLaTeX 连续编译两次，第一次不会生效引用
#### 使用 Bibliography.bib 文件管理参考文献
XeLaTeX -> BibLaTeX -> XeLaTeX -> XeLaTeX
### Windows

使用 TexLive 或 CTex 安装版均可以编译，CTex发行版第一次编译需要下载缺少的包体，请保持网络连接
### Mac/Linux

需要安装缺少的字体，可以搜教程从 Windows 中提取字体，或使用 Adobe 字体。

若使用 Adobe 字体则需要将main.tex文件的第一行改为

```latex
\documentclass[doublesided, adobefonts, ctexart]{Style/xauat}
```

<font color=red> Windows 中的字体和 Adobe系字体是有版权的！请自行安装！！！ </font>

## 改个人信息

在 Texs/Frontpages.tex 中更改对应的内容即可

## 一些建议

1. 将自己的命令加到 custom.sty 的末尾，比如自定义：定理、公式、编号等

2. 将固定的信息加入 xauat.cfg 中，每个用户不同的信息放入 tex 文件中，而不是写死

3. 将章节分成单独的文件并放入 Texs 文件夹中，在 main.tex 中去掉多余章节的 \\input 行，在编写时速度快，最后整理与生成目录与引用时，将所有 \\input 添加进去
## 已知存在的问题

1. 正文与上面的线距离太小；
2. 因为2025年的学校模板未出，封面结构延续了2024年，等今年学校公布模板后再更改
3. 不同 tex 文件中的定理、公式无法生成引用编号

## 更新与版本

更新只需要更改模板文件，基本无需更改自己写的tex文件！
(改tex也只是小改)

1. 2025-01-08, 20:00
	上传修改后的第一版。
2. 2025-01-18, 10:50
	1. 恢复了直接引用bib文件的能力，使用 gkt-7714-2015-numerical 中的方案，详见 main.tex 中对文献的引用方式。
	2. 修改命令 \\mycite 为 \\themcite 更加规范。
3. 2025-02-14, 12:00
	1. 更新了引用方式，可以在正文中将参考文献引用大写
	2. 修复了学术学位与数学位置相反
4. 2025-02-14, 19:00
	修复了定义、定理、引理等分别单独编号，现在为统一编号
5. 2025-02-15, 00:20
	去掉了不合适的 QED 符号
6. 2025-02-15, 01:30
	1. 修改了演示的tex文件与 pdf，添加一系列环境的使用方式
	2. 添加了使用 bib 文件时的编译方式
7. 2025-02-24, 19.40
	修复了 References.tex 中的参考文献，能与 bib 中的对上
8. 2025-03-06, 22:20
	1. 修复了中英文摘要页的学科类型和专业的对齐；
	2. 修复了奇偶页眉显示问题
9. 2025-03-07, 11:00
	1. 去掉了 main.tex 中没用的目录手动自定义页眉控制
	2. 修复了英文摘要页的页眉没有大写
10. 2025-03-07, 13:00
	1. 修复了页眉与第一行文字过短的问题，改为12pt
	2. 修复了 \{定理等 和证明\} 的上下间距问题
	3. 将控制页边距完全放入模板中，使得 main.tex 更干净
	4. 修改行间大公式与上下文的间距为弹性区间 0.5 字符 +- 0.1字符
11. 2025-03-11, 20:15
	修复中英文关键词大小为小四
12. 2025-03-11, 20:30
	修复了中英文基金行无需缩进
13. 2025-03-12, 11:30
	1. 修复了宋体伪加粗，并解决了一系列宋体加粗的问题
		1. 三级标题
		2. 定理等的头、证明头
		3. 中文摘要页的论文类型
注意：
	这次更新需要修改 Abstract.tex 中的 论文类型行的 \\textbf{... 论文类型：} 为 {\\heiti 论文类型：}！
	之前模板使用的方案是宋体的加粗为黑体，此次更新恢复了宋体加粗，可能导致其它应该黑体的位置出现了宋体加粗，请及时反馈！
14. 2025-03-12, 12:45 (已失效！)
	修复了图表字体大小为 5 号
注意：
	这次更新需要自行在表格、图的区域添加代码 \\captionsetup{font={zh-five}, justification=centering}
	屎山模板中有地方覆盖了这个设置，要模板中添加会失效，这里就只能先打补丁了。
15. 2025-03-12, 16:05
	用了新的方式可以在不改tex的情况下调整图表标题大小，(更新 14 已失效)
16. 2025-03-12, 17:05
	添加了声明页，(没检查里面的文字对不对)。
17. 2025-03-12, 21:00
	1. 添加了委员会页 (行字没有斜体，暂时没有斜体，为了支持盲审，个人信息还在考虑如何支持中)
	2. 支持了正文中的宋体斜体
18. 2025-03-12, 21:50
	1. 修复了委员会主页的斜体问题
	2. 将 Fontpage.tex 中的 title 挪到 main.tex 中，为后面生成盲审版本做准备
19. 2025-03-16, 09:30
	更新了委员会页
	此次更新完成了所有页面，后续只有小修补
20. 2025-03-16, 22:40
	去掉了目录中的声明与委员会
21. 2025-03-17, 10:00
	修复了声明页与委员会页的 bug
22. 2025-03-20, 11:50
	修复了参考文献、致谢、总结展望等章时，页眉没有章节的问题
	修复了目录中的章对应的页码错误加粗问题
23. 2025-03-25, 23:55
	修改证为证明
24. 2025-03-27, 00:30
	根据同学反馈，调整了页面布局，基本与学校要求一致
25. 2025-03-27, 00:40
	修改页眉上横线为 1.5pt 粗
26. 2025-04-12, 23:15
	修复盲审的所需更改的页眉问题，但仍然需要改两个地方
	1. FrontPage.tex
	2. Abstract.tex
27. 2025-04-12, 23:25
	添加了用于盲审的 hide.tex, 按原来 main 的方式编译它，即可得到所需的pdf.
	只是去除了封面等非必要部分！仍然需要修改各个 tex 中的内容!
28. 2025-06-09, 21:05
	1. 修改封面与 word 版基本一致
	2. 去掉了委员会页的: (涉密论文以下不填写)


现有引用参考文献方式见下表:

|  位置  | 方式  |     命令      |
| :--: | :-: | :---------: |
| 定理等后 | 上标  | \\themcite  |
|  正文  | 上标  | \\supercite |
|  正文  | 正常  |   \\cite    |

## 如何使用新版本
1. 下载新模板放入一个新的文件夹中
2. 将之前写的 Texs 文件夹中的所有 .tex 文件复制粘贴到新模板的文件夹下
3. 改写 main.tex 中 \\input 命令中的子文件名。一般为 Texs/\*.tex
4. Enjoy！
### 注意！

版本 2 开始，默认的参考文献管理使用 .bib 文件管理，它对应放在了 Biblio 文件夹中的 Bibliography.bib 文件

如果想恢复之前的使用 Texs/References.tex 文件手动编写，请参考 main.tex 中参考文献部分！

## 欢迎大家 Star，有能力的大佬们提 PR

有问题给私我反馈，拴Q。
