## <center>[Colemak](https://colemak.com/) 用户使用的 [NeoVim](https://neovim.io) 配置文件</center>

<center><img src="https://raw.githubusercontent.com/theniceboy/nvim/master/demo.png"></center>

[English Version](./README.md)

请不要只复制这份配置文件夹而不认真看它！请至少阅读一下这份自述文件！

---

第一版翻译: [**EvanMeek**](https://github.com/EvanMeek)

第二版翻译 (当前版本): [**KiteAB**](https://github.com/KiteAB)

<!-- TOC GFM -->

* [安装此配置后你需要做的事](#安装此配置后你需要做的事)
* [安装此配置后你可能想做的事](#安装此配置后你可能想做的事)
	- [首先](#首先)
	- [Python 程序调试 (通过 `vimspector` 实现)](#python-程序调试-通过-vimspector-实现)
	- [配置 `Python` 路径](#配置-python-路径)
	- [标签表](#标签表)
	- [FZF](#fzf)
	- [其它...](#其它)
* [快捷键](#快捷键)
	- [1 基础编辑器特性](#1-基础编辑器特性)
		+ [1.1 最基本的键位](#11-最基本的键位)
		+ [1.2 改变了的光标移动方式](#12-改变了的光标移动方式)
		+ [1.3 改变了插入模式的键位](#13-改变了插入模式的键位)
		+ [1.4 改变了在普通模式下的操作键位](#14-改变了在普通模式下的操作键位)
		+ [1.5 其它在普通模式下有用的键位](#15-其它在普通模式下有用的键位)
		+ [1.6 增加了在可视模式下的命令](#16-增加了在可视模式下的命令)
	- [2 窗口管理](#2-窗口管理)
		+ [2.1 通过分裂屏幕创造窗口](#21-通过分裂屏幕创造窗口)
		+ [2.2 切换不同的窗口](#22-切换不同的窗口)
		+ [2.3 为不同的窗口调整大小](#23-为不同的窗口调整大小)
		+ [2.4 关闭窗口](#24-关闭窗口)
	- [3 标签页管理](#3-标签页管理)
	- [4 终端键盘快捷键](#4-终端键盘快捷键)
* [插件快捷键 (截图/动图已经准备好！)](#插件快捷键-截图动图已经准备好)
	- [自动补全](#自动补全)
		+ [COC (自动补全)](#coc-自动补全)
		+ [Ultisnips](#ultisnips)
	- [代码调试](#代码调试)
		+ [vimspector (代码调试插件)](#vimspector-代码调试插件)
	- [文件浏览](#文件浏览)
		+ [coc-explorer - 文件浏览器](#coc-explorer---文件浏览器)
		+ [rnvimr - 文件浏览器](#rnvimr---文件浏览器)
		+ [FZF - 模糊文件查找器](#fzf---模糊文件查找器)
		+ [xtabline - 精致的顶栏](#xtabline---精致的顶栏)
	- [文字编辑](#文字编辑)
		+ [vim-table-mode](#vim-table-mode)
		+ [Undotree](#undotree)
		+ [vim-multiple-cursors](#vim-multiple-cursors)
		+ [vim-surround](#vim-surround)
		+ [vim-subversive](#vim-subversive)
		+ [vim-easy-align](#vim-easy-align)
		+ [AutoFormat](#autoformat)
		+ [vim-markdown-toc (为 Markdown 文件生成目录)](#vim-markdown-toc-为-markdown-文件生成目录)
	- [缓冲区内导航](#缓冲区内导航)
		+ [vim-easy-motion](#vim-easy-motion)
		+ [Vista.vim](#vistavim)
		+ [vim-signiture - 书签](#vim-signiture---书签)
	- [查找与替换](#查找与替换)
		+ [Far.vim - 查找与替换](#farvim---查找与替换)
	- [Git 相关](#git-相关)
		+ [vim-gitgutter](#vim-gitgutter)
		+ [fzf-gitignore](#fzf-gitignore)
	- [其它](#其它-1)
		+ [vim-calendar](#vim-calendar)
		+ [Goyo - 不会分心地工作](#goyo---不会分心地工作)
		+ [suda.vim](#sudavim)
		+ [coc-translator](#coc-translator)
* [自定义代码片段补全](#自定义代码片段补全)
	- [Markdown](#markdown)
* [一些奇怪的东西](#一些奇怪的东西)
	- [按 `tx` 然后输入你想要的文字](#按-tx-然后输入你想要的文字)
	- [自定义垂直光标移动](#自定义垂直光标移动)

<!-- /TOC -->

## 安装此配置后你需要做的事
- [ ] 安装 `pynvim` (使用 `pip`)
- [ ] 安装 `nodejs`, 然后在终端输入 `npm install -g neovim`
- [ ] 安装 nerd-fonts (尽管它是可选的，但是安装之后看上去十分地酷)

## 安装此配置后你可能想做的事
### 首先
- [ ] 执行 `:checkhealth`

### Python 程序调试 (通过 `vimspector` 实现)
- [ ] 安装 `debugpy` (使用 `pip`)

### 配置 `Python` 路径
- [ ] 确保你安装了 Python
- [ ] 查看 `_machine_specific.vim` 文件

### 标签表
- [ ] 安装 `ctags` 以获得类/函数/变量的三重支持

### FZF
- [ ] 安装 `fzf`
- [ ] 安装 `ag` (`the_silver_searcher` 需要)

### 其它...
- [ ] 安装 `figlet` 以输入 ASCII 艺术字
- [ ] 安装 `xclip` 以获得系统剪切板访问支持 (仅 `Linux` 与 `xorg` 需要)

## 快捷键
### 1 基础编辑器特性
#### 1.1 最基本的键位
**`k`** : 切换至 **`插入`** : 一种模式 (在原版 Vim 中与 `i` 键相同)

**`Q`** : 退出当前 Vim 窗口 (在原版 Vim 中与命令 `:q` 相同)

**`S`** : 保存当前文件 (在原版 Vim 中与命令 `:w` 相同)

**_重要_**

  因为 `i` 键被改为了 `k` 键, 所有包含 `i` 键的命令都必须将 `i` 改为 `k` (比如 `ciw` 应被更正为 `ckw`)

#### 1.2 改变了的光标移动方式
| 快捷键     | 行为                           | 等于 (QWERTY 键盘布局中的哪些键) |
|------------|--------------------------------|----------------------------------|
| `u`        | 将光标向上移动一行             | `k`                              |
| `e`        | 将光标向下移动一行             | `j`                              |
| `n`        | 将光标向左移动一格             | `h`                              |
| `i`        | 将光标向右移动一格             | `l`                              |
| `U`        | 将光标向上移动五行             | `5k`                             |
| `E`        | 将光标向下移动五行             | `5j`                             |
| `N`        | 将光标移至当前行的第一个字符   | `0`                              |
| `I`        | 将光标移至当前行的最后一个字符 | `$`                              |
| `Ctrl` `u` | 将视角向上移动五行而不移动光标 | `Ctrl` `y`                       |
| `Ctrl` `e` | 将视角向下移动五行而不移动光标 | `Ctrl` `e`                       |
| `h`        | 将光标移至当前单词的末尾       | `e`                              |
| `W`        | 将光标移至五个单词后的末尾     | `5w`                             |
| `B`        | 将光标移至五个单词前的开头     | `5b`                             |

#### 1.3 改变了插入模式的键位
| 快捷键     | 行为                             |
|------------|----------------------------------|
| `Ctrl` `a` | 将光标移至当前行的末尾           |
| `Ctrl` `u` | 将光标所在的字母移至当前行的末尾 |

#### 1.4 改变了在普通模式下的操作键位
| 快捷键          | 行为                             |
|-----------------|----------------------------------|
| `l`             | **撤销**                         |
| `<`             | 反向缩进                         |
| `>`             | 缩进                             |
| `SPACE` `SPACE` | 删除下一个 `<++>` 并进入插入模式 |

#### 1.5 其它在普通模式下有用的键位
| 快捷键          | 行为                           |
|-----------------|--------------------------------|
| `r`             | **编译/运行当前文件**          |
| `SPACE` `s` `c` | 开关拼写检查                   |
| `SPACE` `d` `w` | 寻找近处的重复单词             |
| `SPACE` `t` `t` | 将四个空格转换为制表符         |
| `SPACE` `o`     | 折叠代码                       |
| `SPACE` `-`     | 上一个快速修复位置             |
| `SPACE` `+`     | 下一个快速修复位置             |
| `\` `p`         | 显示当前文件的路径             |
| `SPACE` `/`     | 在当前窗口下方新建一个终端窗口 |

#### 1.6 增加了在可视模式下的命令
| 快捷键 | 行为                         |
|--------|------------------------------|
| `Y`    | 复制选中文本至**系统剪切板** |


### 2 窗口管理
#### 2.1 通过分裂屏幕创造窗口
| 快捷键      | 行为                                   |
|-------------|----------------------------------------|
| `s` `u`     | 新建一个分屏并把它放置在当前窗口的上面 |
| `s` `e`     | 新建一个分屏并把它放置在当前窗口的下面 |
| `s` `n`     | 新建一个分屏并把它放置在当前窗口的左边 |
| `s` `i`     | 新建一个分屏并把它放置在当前窗口的右边 |
| `s` `v`     | 将两个分屏垂直放置                     |
| `s` `h`     | 将两个分屏水平放置                     |
| `s` `r` `v` | 将所有分屏垂直放置                     |
| `s` `r` `h` | 将所有分屏水平放置                     |

#### 2.2 切换不同的窗口
| 快捷键        | 行为           |
|---------------|----------------|
| `SPACE` + `w` | 移至下一个窗口 |
| `SPACE` + `n` | 移至左边的窗口 |
| `SPACE` + `i` | 移至右边的窗口 |
| `SPACE` + `u` | 移至上面的窗口 |
| `SPACE` + `e` | 移至下面的窗口 |

#### 2.3 为不同的窗口调整大小
用方向键更改当前窗口的大小

#### 2.4 关闭窗口
| 快捷键      | 行为                                                        |
|-------------|-------------------------------------------------------------|
| `Q`         | 关闭当前窗口                                                |
| `SPACE` `q` | 关闭当前窗口下面的窗口 (如果下面没有窗口，则当前窗口将关闭) |

### 3 标签页管理
| 快捷键      | 行为                     |
|-------------|--------------------------|
| `t` `u`     | 新建一个标签页           |
| `t` `n`     | 移至左侧标签页           |
| `t` `i`     | 移至右侧标签页           |
| `t` `m` `n` | 将当前标签页向左移动一格 |
| `t` `m` `i` | 将当前标签页向右移动一格 |

### 4 终端键盘快捷键
| 快捷键     | 行为             |
|------------|------------------|
| `Ctrl` `n` | 退出终端输入模式 |

## 插件快捷键 (截图/动图已经准备好！)
### 自动补全
#### [COC (自动补全)](https://github.com/neoclide/coc.nvim)
| 快捷键          | 行为               |
|-----------------|--------------------|
| `Space` `y`     | **打开剪切板历史** |
| `gd`            | 列出定义列表       |
| `gr`            | 列出参考列表       |
| `gi`            | 待办事项清单       |
| `gy`            | 转至类型定义       |
| `Space` `r` `n` | 重命名变量         |

<img alt="Gif" src="https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif" width="60%" />

#### [Ultisnips](https://github.com/SirVer/ultisnips)
| 快捷键     | 行为                     |
|------------|--------------------------|
| `Ctrl` `e` | 召唤一个代码片段         |
| `Ctrl` `n` | 在一个代码片段中前移光标 |
| `Ctrl` `e` | 在一个代码片段中后移光标 |

![GIF Demo](https://raw.github.com/SirVer/ultisnips/master/doc/demo.gif)

### 代码调试
#### [vimspector (代码调试插件)](https://github.com/puremourning/vimspector)
| 快捷键 | 函数                                       |
|--------|--------------------------------------------|
| `F5`   | 继续调试，如果不在一个调试中则开始进行调试 |
| `F3`   | 终止调试                                   |
| `F4`   | 用相同的配置重新开始调试                   |
| `F6`   | 暂停调试                                   |
| `F9`   | 在当前行上切换行的断点                     |
| `F8`   | 在光标下为表达式添加函数断点               |
| `F10`  | 完成步骤                                   |
| `F11`  | 下一步骤                                   |
| `F12`  | 退出当前函数范围                           |

<img alt="Gif" src="https://puremourning.github.io/vimspector-web/img/vimspector-overview.png" width="60%" />

### 文件浏览
#### [coc-explorer - 文件浏览器](https://github.com/weirongxu/coc-explorer)
| 快捷键 | 行为                  |
|--------|-----------------------|
| `tt`   | **打开文件浏览器**    |
| `?`    | 查看帮助 (在浏览器中) |

<img alt="Png" src="https://user-images.githubusercontent.com/1709861/64966850-1e9f5100-d8d2-11e9-9490-438c6d1cf378.png" width="60%" />

#### [rnvimr - 文件浏览器](https://github.com/kevinhwang91/rnvimr)
- [ ] 确定你已经安装了 ranger

按 `R` 键打开 ranger (文件选择器)

在 rnvimr (ranger) 中, 你可以:
| 快捷键     | 行为                 |
|------------|----------------------|
| `Ctrl` `t` | 在新标签页中打开文件 |
| `Ctrl` `x` | 上下分裂打开当前文件 |
| `Ctrl` `v` | 左右分裂打开所选文件 |

<img alt="Gif" src="https://user-images.githubusercontent.com/17562139/74416173-b0aa8600-4e7f-11ea-83b5-31c07c384af1.gif" width="60%" />

#### [FZF - 模糊文件查找器](https://github.com/junegunn/fzf.vim)
| 快捷键     | 行为             |
|------------|------------------|
| `Ctrl` `p` | **模糊查找文件** |
| `Ctrl` `u` | 向上移动一格     |
| `Ctrl` `e` | 向下移动一格     |
| `Ctrl` `w` | 模糊查找缓冲区   |
| `Ctrl` `f` | 模糊查找文件内容 |
| `Ctrl` `h` | 模糊查找历史文件 |
| `Ctrl` `t` | 模糊查找标签     |

<img alt="Gif" src="https://jesseleite.com/uploads/posts/2/tag-finder-opt.gif" width="60%" />

#### [xtabline - 精致的顶栏](https://github.com/mg979/vim-xtabline)
| 快捷键 | 行为               |
|--------|--------------------|
| `to`   | 开关循环标签页模式 |
| `\p`   | 显示当前路径       |

<img alt="Gif" src="https://i.imgur.com/yU6qbU5.gif" width="60%" />

### 文字编辑
#### [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
| 快捷键          | 行为         |
|-----------------|--------------|
| `SPACE` `t` `m` | 开关表格模式 |
| `SPACE` `t` `r` | 重组表格     |

See `:help table-mode.txt` for more.

#### [Undotree](https://github.com/mbbill/undotree)
| 快捷键        | 行为         |
|---------------|--------------|
| `Shift` + `L` | 打开撤回历史 |
| `u`           | 更新的记录   |
| `e`           | 更老的记录   |

<img alt="Png" src="https://camo.githubusercontent.com/56430626a5444ea2f0249d71f9288775277c7f5d/68747470733a2f2f73697465732e676f6f676c652e636f6d2f736974652f6d6262696c6c2f756e646f747265655f6e65772e706e67" width="60%" />

#### [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
| 快捷键     | 行为                        |
|------------|-----------------------------|
| `Ctrl`+`k` | **选择下一个键 (多重光标)** |
| `Alt`+`k`  | **选择所有键 (多重光标)**   |
| `Ctrl`+`p` | 选择上一个键                |
| `Ctrl`+`s` | 跳过键                      |
| `Esc`      | 退出多重光标                |

<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example1.gif" width="60%" />
<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example2.gif" width="60%" />
<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example3.gif" width="60%" />
<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example4.gif" width="60%" />

#### [vim-surround](https://github.com/tpope/vim-surround)
想要添加包裹符号 (`string` -> `"string"`):
```
string
```
按下: `yskw'`:
```
'string'
```
想要修改包裹符号
```
'string'
```
按下: `cs'"`:
```
"string"
```

<img alt="Gif" src="https://two-wrongs.com/image/surround_vim.gif" width="60%" />

#### [vim-subversive](https://github.com/svermeulen/vim-subversive)
新的操作员: `s`:

您可以执行 `s<操作>`来使用用默认的寄存器 (或提供的显式寄存器) 的内容替换运动提供的文本对象。例如，您可以执行 `skw` 将光标下的当前单词替换为当前yank，或执行 `skp` 替换段落，依此类推


#### [vim-easy-align](https://github.com/junegunn/vim-easy-align)
在普通或可视模式下按 `ga` + **符号** 可以根据 **符号**对齐文本

<img alt="Gif" src="https://raw.githubusercontent.com/junegunn/i/master/easy-align/equals.gif" width="60%" />

#### [AutoFormat](https://github.com/Chiel92/vim-autoformat)
按 `\` `f` 开启格式化模式

#### [vim-markdown-toc (为 Markdown 文件生成目录)](https://github.com/mzlogin/vim-markdown-toc)
在 `Markdown` 文件中, 按下 `:Gen` 打开菜单，你将会看到可选选项

<img alt="Gif" src="https://raw.githubusercontent.com/mzlogin/vim-markdown-toc/master/screenshots/english.gif" width="60%" />

### 缓冲区内导航
#### [vim-easy-motion](https://github.com/easymotion/vim-easymotion)
按 `'` 键和一个 `字母` 跳转至 `字母` (类似 Emacs 的 [AceJump](https://www.emacswiki.org/emacs/AceJump))

<img alt="Gif" src="https://f.cloud.github.com/assets/3797062/2039359/a8e938d6-899f-11e3-8789-60025ea83656.gif" width="60%" />

#### [Vista.vim](https://github.com/liuchengxu/vista.vim)
按 `T` 打开函数与变量列表

<img alt="Gif" src="https://user-images.githubusercontent.com/8850248/56469894-14d40780-6472-11e9-802f-729ac53bd4d5.gif" width="60%" />

#### [vim-signiture - 书签](https://github.com/kshenoy/vim-signature)
| 快捷键      | 行为                       |
|-------------|----------------------------|
| `m<letter>` | 在当前行添加或删除书签     |
| `m/`        | 列出所有书签               |
| `mSPACE`    | 在缓冲区中跳转到下一个书签 |
| `mt`        | 在当前行添加或删除书签     |
| `ma`        | 在当前行添加注释           |
| `ml`        | 显示所有的书签             |
| `mi`        | 下一个书签                 |
| `mn`        | 上一个书签                 |
| `mC`        | 清除一个书签               |
| `mX`        | 清除所有书签               |
| `mu`        | 将书签往上提一行           |
| `me`        | 将书签往下拉一行           |
| `SPC` `g`   | 将书签移至任意行           |

<img alt="Gif" src="https://camo.githubusercontent.com/bc2bf1746e30c72d7ff5b79331231e8c388d068a/68747470733a2f2f7261772e6769746875622e636f6d2f4d617474657347726f656765722f76696d2d626f6f6b6d61726b732f6d61737465722f707265766965772e676966" width="60%" />

### 查找与替换
#### [Far.vim - 查找与替换](https://github.com/brooth/far.vim)
按下 `SPACE` `f` `r` 在工作目录中搜索

<img alt="Gif" src="https://cloud.githubusercontent.com/assets/9823254/20861878/77dd1882-b9b4-11e6-9b48-8bc60f3d7ec0.gif" width="60%" />

### Git 相关
#### [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
| 快捷键          | 行为                        |
|-----------------|-----------------------------|
| `H`             | **在当前行显示 Git 代码块** |
| `SPACE` `g` `-` | 去往上一个 Git 代码块       |
| `SPACE` `g` `+` | 去往下一个 Git 代码块       |
| `SPACE` `g` `f` | 折叠所有除代码块以外的行    |

#### [fzf-gitignore](https://github.com/fszymanski/fzf-gitignore)
按 `Space` `g` `i` 来创建一个 `.gitignore` 文件

<img alt="Png" src="https://user-images.githubusercontent.com/25827968/42945393-96c662da-8b68-11e8-8279-5bcd2e956ca9.png" width="60%" />

<img alt="Png" src="https://raw.githubusercontent.com/airblade/vim-gitgutter/master/screenshot.png" width="60%" />

### 其它
#### [vim-calendar](https://github.com/itchyny/calendar.vim)
| 快捷键  | 行为     |
|---------|----------|
| `\` `\` | 显示时钟 |
| `\` `c` | 显示日历 |

<img alt="Png" src="https://raw.githubusercontent.com/wiki/itchyny/calendar.vim/image/image.png" width="60%" />

#### [Goyo - 不会分心地工作](https://github.com/junegunn/goyo.vim)
按下 `g` `y` 开关 Goyo

<img alt="Png" src="https://raw.github.com/junegunn/i/master/goyo.png" width="60%" />

#### [suda.vim](https://github.com/lambdalisue/suda.vim)
想要忘记以前痛苦的 `sudo vim ...`? 只需要在 Vim 中执行 `:sudowrite` 或者 `:sw`

#### [coc-translator](https://github.com/voldikss/coc-translator)
按下 `ts` 来 **翻译光标所在的单词**.

<img alt="Png" src="https://user-images.githubusercontent.com/20282795/72232547-b56be800-35fc-11ea-980a-3402fea13ec1.png" width="60%" />

## 自定义代码片段补全
### Markdown
| 快捷键 | 创建的文字       |
|--------|------------------|
| `,n`   | ---              |
| `,b`   | **粗体**文字     |
| `,s`   | ~~被划去~~的文字 |
| `,i`   | *斜体*文字       |
| `,d`   | `代码块`         |
| `,c`   | 大的 `代码块`    |
| `,m`   | - [ ] 清单       |
| `,p`   | 图片             |
| `,a`   | [链接]()         |
| `,1`   | # H1             |
| `,2`   | ## H2            |
| `,3`   | ### H3           |
| `,4`   | #### H4          |
| `,l`   | --------         |

`,f` 去往下一个 `<++>` (占位符)

`,w` 去往下一个 `<++>` (占位符) 并帮你按下 `Enter`

## 一些奇怪的东西
### 按 `tx` 然后输入你想要的文字
`tx Hello<Enter>`
```
 _   _      _ _
| | | | ___| | | ___
| |_| |/ _ \ | |/ _ \
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/
```

### 自定义垂直光标移动

此 NeoVim 配置包含了一套对 Colemak 用户量身定制的垂直光标移动, 它位于 `cursor.vim` 中, 并且可以替代 “数字 + 上 / 下” 的案件组合

为了将光标向上移至 `x` 行, 可以按下 `[` 键, 并将 Colemak 键盘布局的中间行 (“arstdhneio”) 视为从 1 到 0 的数字, 按所需的数字, 再按下空格键以跳转至 `x` 行之上

要向下移动光标, 按 `'` 键而不是 `[` 键, 其余部分相同

例:
| 快捷键                  | 行为                  |
| ----------------------- | --------------------- |
| `[` `a` `o` `o` `SPACE` | 将光标向上移动 100 行 |
| `'` `a` `r` `s` `SPACE` | 将光标向下移动123行   |
| `[` `d` `o` `SPACE`     | 将光标向上移动50行    |

**注意: 目前, 使用此移动方式, 你最多只能垂直移动 199 行!**
