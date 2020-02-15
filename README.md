## <center>The Ultimate NeoVim Config for [Colemak](https://colemak.com/) Users</center>

<center><img src="https://raw.githubusercontent.com/theniceboy/nvim/master/demo.png"></center>

Please **DO NOT** just copy this configuration folder without really looking at it! Please, at least, read this README file!

<!-- TOC GFM -->

* [After Installation, You Need To](#after-installation-you-need-to)
* [After Installation, You Might Want To](#after-installation-you-might-want-to)
	- [First of all](#first-of-all)
	- [For Python Debugger (via `vimspector`)](#for-python-debugger-via-vimspector)
	- [Config `Python` path](#config-python-path)
	- [For Taglist:](#for-taglist)
	- [For FZF](#for-fzf)
	- [And also...](#and-also)
* [Keyboard Shortcuts](#keyboard-shortcuts)
	- [1 Basic Editor Features](#1-basic-editor-features)
		+ [1.1 The Most Basics](#11-the-most-basics)
		+ [1.2 Remapped Cursor Movement](#12-remapped-cursor-movement)
		+ [1.3 Remapped Insert Mode Keys](#13-remapped-insert-mode-keys)
		+ [1.4 Remapped Text Manipulating Commands in Normal Mode](#14-remapped-text-manipulating-commands-in-normal-mode)
		+ [1.5 Other Useful Normal Mode Remappings](#15-other-useful-normal-mode-remappings)
		+ [1.6 Remapped Commands in Visual Mode](#16-remapped-commands-in-visual-mode)
	- [2 Window Management](#2-window-management)
		+ [2.1 Creating Window Through Split Screen](#21-creating-window-through-split-screen)
		+ [2.2 Moving the Cursor Between Different Windows](#22-moving-the-cursor-between-different-windows)
		+ [2.3 Resizing Different Windows](#23-resizing-different-windows)
		+ [2.4 Closing Windows](#24-closing-windows)
	- [3 Tab Management](#3-tab-management)
	- [4 Terminal Keyboard Shortcuts](#4-terminal-keyboard-shortcuts)
* [Plugins Keybindings (Screenshots/GIF provided!)](#plugins-keybindings-screenshotsgif-provided)
	- [AutoCompletion](#autocompletion)
		+ [COC (AutoCompletion)](#coc-autocompletion)
		+ [Ultisnips](#ultisnips)
	- [Debugger](#debugger)
		+ [vimspector (debugger-plugin)](#vimspector-debugger-plugin)
	- [File Navigation](#file-navigation)
		+ [coc-explorer (file browser)](#coc-explorer-file-browser)
		+ [rnvimr - file browser](#rnvimr---file-browser)
		+ [FZF - the fuzzy file finder](#fzf---the-fuzzy-file-finder)
		+ [xtabline (the fancy tab line)](#xtabline-the-fancy-tab-line)
	- [Text Editing Plugins](#text-editing-plugins)
		+ [vim-table-mode](#vim-table-mode)
		+ [Undotree](#undotree)
		+ [vim-multiple-cursors](#vim-multiple-cursors)
		+ [vim-surround](#vim-surround)
		+ [vim-subversive](#vim-subversive)
		+ [vim-easy-align](#vim-easy-align)
		+ [AutoFormat](#autoformat)
		+ [vim-markdown-toc (generate table of contents for markdown files)](#vim-markdown-toc-generate-table-of-contents-for-markdown-files)
	- [Navigation Within Buffer](#navigation-within-buffer)
		+ [vim-easy-motion](#vim-easy-motion)
		+ [Vista.vim](#vistavim)
		+ [vim-signiture - Bookmarks](#vim-signiture---bookmarks)
	- [Find and Replace](#find-and-replace)
		+ [Far.vim - find and replace](#farvim---find-and-replace)
	- [Git Related](#git-related)
		+ [vim-gitgutter](#vim-gitgutter)
		+ [fzf-gitignore](#fzf-gitignore)
	- [Others](#others)
		+ [vim-calendar](#vim-calendar)
		+ [Goyo - Work without distraction](#goyo---work-without-distraction)
		+ [suda.vim](#sudavim)
		+ [coc-translator](#coc-translator)
* [Custom Snippets](#custom-snippets)
	- [Markdown](#markdown)
* [Some Weird Stuff](#some-weird-stuff)
	- [Press `tx` and enter your text](#press-tx-and-enter-your-text)

<!-- /TOC -->

## After Installation, You Need To
- [ ] Install `pynvim` (pip)
- [ ] Install `nodejs`, and do `npm install -g neovim`
- [ ] Install nerd-fonts (actually it's optional but it looks real good)

## After Installation, You Might Want To
### First of all
- [ ] Do `:checkhealth`

### For Python Debugger (via `vimspector`)
- [ ] Install `debugpy` (`pip`)

### Config `Python` path
- [ ] Well, make sure you have python
- [ ] See `_machine_specific.vim`

### For Taglist:
- [ ] Install `ctags` for function/class/variable list

### For FZF
- [ ] Install `fzf`
- [ ] Install `ag` (`the_silver_searcher`)

### And also...
- [ ] Install `figlet` for inputing text ASCII art
- [ ] Install `xclip` for system clipboard access (`Linux` and `xorg` only)

## Keyboard Shortcuts
### 1 Basic Editor Features
#### 1.1 The Most Basics
**`k`** : switchs to **`INSERT`** : mode (same as key `i` in vanilla vim)

**`Q`** : quits current vim window (same as command `:q` in vanilla vim)

**`S`** : saves the current file (same as command `:w` in vanilla vim)

**_IMPORTANT_**

  Since the `i` key has been mapped to `k`, every command (combination) that involves `i` should use `k` instead (for example, `ciw` should be `ckw`).

#### 1.2 Remapped Cursor Movement
| Shortcut   | Action                                                    | Equivalent |
|------------|-----------------------------------------------------------|------------|
| `u`        | Cursor up a terminal line                                 | `k`        |
| `e`        | Cursor down a terminal line                               | `j`        |
| `n`        | Cursor left                                               | `h`        |
| `i`        | Cursor right                                              | `l`        |
| `U`        | Cursor up 5 terminal lines                                | `5k`       |
| `E`        | Cursor down 5 terminal lines                              | `5j`       |
| `N`        | Cursor to the start of the line                           | `0`        |
| `I`        | Cursor to the end of the line                             | `$`        |
| `Ctrl` `u` | Move the view port up 5 lines without moving the cursor   | `Ctrl` `y` |
| `Ctrl` `e` | Move the view port down 5 lines without moving the cursor | `Ctrl` `e` |
| `h`        | Move to the end of this word                              | `e`        |
| `W`        | Move cursor five words forward                            | `5w`       |
| `B`        | Move cursor five words forward                            | `5b`       |

#### 1.3 Remapped Insert Mode Keys
| Shortcut   | Action                                                               |
|------------|----------------------------------------------------------------------|
| `Ctrl` `a` | Move cursor to the end of the line                                   |
| `Ctrl` `u` | Move the character on the right of the cursor to the end of the line |

#### 1.4 Remapped Text Manipulating Commands in Normal Mode
| Shortcut        | Action                                |
|-----------------|---------------------------------------|
| `l`             | **undo**                              |
| `<`             | Un-indent                             |
| `>`             | Indent                                |
| `SPACE` `SPACE` | Goto the next placeholder (`<++>`)    |

#### 1.5 Other Useful Normal Mode Remappings
| Shortcut        | Action                                         |
|-----------------|------------------------------------------------|
| `r`             | **Compile/Run the current file**               |
| `SPACE` `s` `c` | Toggle spell suggestion a                      |
| `SPACE` `d` `w` | Find adjacent duplicated word                  |
| `SPACE` `t` `t` | Convert every 4 Spaces to a tab                |
| `SPACE` `o`     | Fold                                           |
| `SPACE` `-`     | Previous quick-fix position                    |
| `SPACE` `+`     | Next quick-fix position                        |
| `\` `p`         | Show the path of the current file              |
| `SPACE` `/`     | Create a new terminal below the current window |

#### 1.6 Remapped Commands in Visual Mode
| Shortcut        | Action                                 |
|-----------------|----------------------------------------|
| `Y`             | Copy selected text to system clipboard |


### 2 Window Management
#### 2.1 Creating Window Through Split Screen
| Shortcut    | Action                                                                      |
|-------------|-----------------------------------------------------------------------------|
| `s` `u`     | Create a new horizontal split screen and place it above the current window  |
| `s` `e`     | Create a new horizontal split screen and place it below the current window  |
| `s` `n`     | Create a new vertical split screen and place it left to the current window  |
| `s` `i`     | Create a new vertical split screen and place it right to the current window |
| `s` `v`     | Set the two splits to be vertical                                           |
| `s` `h`     | Set the two splits to be horizontal                                         |
| `s` `r` `v` | Rotate splits and arrange splits vertically                                 |
| `s` `r` `h` | Rotate splits and arrange splits horizontally                               |

#### 2.2 Moving the Cursor Between Different Windows
| Shortcut      | Action                         |
|---------------|--------------------------------|
| `SPACE` + `w` | Move cursor to the next window |
| `SPACE` + `n` | Move cursor one window left    |
| `SPACE` + `i` | Move cursor one window right   |
| `SPACE` + `u` | Move cursor one window up      |
| `SPACE` + `e` | Move cursor one window down    |

#### 2.3 Resizing Different Windows
Use the arrow keys to resize the current window.

#### 2.4 Closing Windows
| Shortcut    | Action                                                                                                     |
|-------------|------------------------------------------------------------------------------------------------------------|
| `Q`         | Close the current window                                                                                   |
| `SPACE` `q` | Close the window below the current window. (The current window will be closed if there is no window below) |

### 3 Tab Management
| Shortcut    | Action           |
|-------------|------------------|
| `t` `u`     | Create a new tab |
| `t` `n`     | Go one tab left  |
| `t` `i`     | Go One tab right |
| `t` `m` `n` | Move tab left    |
| `t` `m` `i` | Move tab right   |

### 4 Terminal Keyboard Shortcuts
| Shortcut    | Action                                                      |
|-------------|-------------------------------------------------------------|
| `Ctrl` `n`  | Escape from terminal input mode                             |

## Plugins Keybindings (Screenshots/GIF provided!)
### AutoCompletion
#### COC (AutoCompletion)
| Shortcut        | Action                    |
|-----------------|---------------------------|
| `Space` `y`     | **Get yank history list** |
| `gd`            | Go to definition          |
| `gr`            | List references           |
| `gi`            | List implementation       |
| `gy`            | Go to type definition     |
| `Space` `r` `n` | Rename a variable         |

<img alt="Gif" src="https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif" width="60%" />

#### Ultisnips
| Shortcut   | Action                                           |
|------------|--------------------------------------------------|
| `Ctrl` `e` | Expand a snippet                                 |
| `Ctrl` `n` | (in snippet) Previous Cursor position in snippet |
| `Ctrl` `e` | (in snippet) Next Cursor position in snippet     |

![GIF Demo](https://raw.github.com/SirVer/ultisnips/master/doc/demo.gif)

### Debugger
#### vimspector (debugger-plugin)
| Key   | Function                                                  |
|-------|-----------------------------------------------------------|
| `F5`  | When debugging, continue. Otherwise start debugging.      |
| `F3`  | Stop debugging.                                           |
| `F4`  | Restart debugging with the same configuration.            |
| `F6`  | Pause debugee.                                            |
| `F9`  | Toggle line breakpoint on the current line.               |
| `F8`  | Add a function breakpoint for the expression under cursor |
| `F10` | Step Over                                                 |
| `F11` | Step Into                                                 |
| `F12` | Step out of current function scope                        |

<img alt="Gif" src="https://puremourning.github.io/vimspector-web/img/vimspector-overview.png" width="60%" />

### File Navigation
#### coc-explorer (file browser)
| Shortcut | Action                  |
|----------|-------------------------|
| `tt`     | **Open file browser**   |
| `?`      | show help (in explorer) |

<img alt="Png" src="https://user-images.githubusercontent.com/1709861/64966850-1e9f5100-d8d2-11e9-9490-438c6d1cf378.png" width="60%" />

#### rnvimr - file browser
- [ ] Make sure you have ranger installed

Press `R` to open Ranger (file selector)

And Within rnvimr (ranger), you can:
| Shortcut   | Action                             |
|------------|------------------------------------|
| `Ctrl` `t` | Open the file in a new tab         |
| `Ctrl` `x` | Split up and down with the file    |
| `Ctrl` `v` | Split left and right with the file |

<img alt="Gif" src="https://user-images.githubusercontent.com/17562139/74416173-b0aa8600-4e7f-11ea-83b5-31c07c384af1.gif" width="60%" />

#### FZF - the fuzzy file finder
| Shortcut   | Action             |
|------------|--------------------|
| `Ctrl` `p` | **FZF Files**      |
| `Ctrl` `u` | Move up 1 item     |
| `Ctrl` `e` | Move down 1 item   |
| `Ctrl` `w` | FZF Buffers        |
| `Ctrl` `f` | FZF Files' Content |
| `Ctrl` `h` | FZF Recent Files   |
| `Ctrl` `t` | FZF Tags           |

<img alt="Gif" src="https://jesseleite.com/uploads/posts/2/tag-finder-opt.gif" width="60%" />

#### xtabline (the fancy tab line)
| Shortcut | What it creates   |
|----------|-------------------|
| `to`     | Cycle tab mode    |
| `\p`     | Show current path |

<img alt="Gif" src="https://i.imgur.com/yU6qbU5.gif" width="60%" />

### Text Editing Plugins
#### vim-table-mode
| Shortcut        | Action            |
|-----------------|-------------------|
| `SPACE` `t` `m` | Toggle table mode |
| `SPACE` `t` `r` | Realign table     |

See `:help table-mode.txt` for more.

#### Undotree
| Shortcut      | Action        |
|---------------|---------------|
| `Shift` + `L` | Open Undotree |
| `u`           | Newer Version |
| `e`           | Older Version |

<img alt="Png" src="https://camo.githubusercontent.com/56430626a5444ea2f0249d71f9288775277c7f5d/68747470733a2f2f73697465732e676f6f676c652e636f6d2f736974652f6d6262696c6c2f756e646f747265655f6e65772e706e67" width="60%" />

#### vim-multiple-cursors
| Shortcut   | Action                                 |
|------------|----------------------------------------|
| `Ctrl`+`k` | **Select next key (multiple cursors)** |
| `Alt`+`k`  | **Select all keys (multiple cursors)** |
| `Ctrl`+`p` | Select previous key                    |
| `Ctrl`+`s` | Skip key                               |
| `Esc`      | Quit mutiple cursors                   |

<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example1.gif" width="60%" />
<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example2.gif" width="60%" />
<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example3.gif" width="60%" />
<img alt="Gif" src="https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example4.gif" width="60%" />

#### vim-surround
To add surround (`string` -> `"string"`):
```
string
```
press: `yskw'`:
```
'string'
```

To change surround
```
'string'
```
press: `cs'"`:
```
"string"
```

<img alt="Gif" src="https://two-wrongs.com/image/surround_vim.gif" width="60%" />

#### vim-subversive
New operator: `s`:

You can execute `s<motion>` to substitute the text object provided by the motion with the contents of the default register (or an explicit register if provided). For example, you could execute `skw` to replace the current word under the cursor with the current yank, or `skp` to replace the paragraph, etc.



#### vim-easy-align
Press `ga` + **symbol** in normal or visual mode to align text based on **symbol**

<img alt="Gif" src="https://raw.githubusercontent.com/junegunn/i/master/easy-align/equals.gif" width="60%" />

#### AutoFormat
Press `\` `f` to format code

#### vim-markdown-toc (generate table of contents for markdown files)
In `markdown` files, type `:Gen` then tab, you'll see your options.

<img alt="Gif" src="https://raw.githubusercontent.com/mzlogin/vim-markdown-toc/master/screenshots/english.gif" width="60%" />

### Navigation Within Buffer
#### vim-easy-motion
Press `'` and a `character` jump to `character` (similar to Emacs' [AceJump](https://www.emacswiki.org/emacs/AceJump))

<img alt="Gif" src="https://f.cloud.github.com/assets/3797062/2039359/a8e938d6-899f-11e3-8789-60025ea83656.gif" width="60%" />

#### Vista.vim
Press `T` to toggle function and variable list

<img alt="Gif" src="https://user-images.githubusercontent.com/8850248/56469894-14d40780-6472-11e9-802f-729ac53bd4d5.gif" width="60%" />

#### vim-signiture - Bookmarks
| Shortcut    | Action                          |
|-------------|---------------------------------|
| `m<letter>` | Add/remove mark at current line |
| `m/`        | List all marks                  |
| `mSPACE`    | Jump to the next mark in buffer |
| `mt`        | Add/remove mark at current line |
| `ma`        | Add annotation at current line  |
| `ml`        | Show all bookmarks              |
| `mi`        | Next bookmark                   |
| `mn`        | Previous bookmark               |
| `mC`        | Clear bookmarks                 |
| `mX`        | Clear all bookmarks             |
| `mu`        | Move bookmark up a line         |
| `me`        | Move bookmark down a line       |
| `SPC` `g`   | Move bookmark to line...        |

<img alt="Gif" src="https://camo.githubusercontent.com/bc2bf1746e30c72d7ff5b79331231e8c388d068a/68747470733a2f2f7261772e6769746875622e636f6d2f4d617474657347726f656765722f76696d2d626f6f6b6d61726b732f6d61737465722f707265766965772e676966" width="60%" />

### Find and Replace
#### Far.vim - find and replace
Press `SPACE` `f` `r` to search in cwd.

<img alt="Gif" src="https://cloud.githubusercontent.com/assets/9823254/20861878/77dd1882-b9b4-11e6-9b48-8bc60f3d7ec0.gif" width="60%" />

### Git Related
#### vim-gitgutter
| Shortcut        | Action                            |
|-----------------|-----------------------------------|
| `H`             | **Show git hunk at current line** |
| `SPACE` `g` `-` | Go to previous git hunk           |
| `SPACE` `g` `+` | Go to next git hunk               |
| `SPACE` `g` `f` | Fold everything except hunks      |

#### fzf-gitignore
Press `Space` `g` `i` to create a `.gitignore` file

<img alt="Png" src="https://user-images.githubusercontent.com/25827968/42945393-96c662da-8b68-11e8-8279-5bcd2e956ca9.png" width="60%" />

<img alt="Png" src="https://raw.githubusercontent.com/airblade/vim-gitgutter/master/screenshot.png" width="60%" />

### Others
#### vim-calendar
| Shortcut | Action        |
|----------|---------------|
| `\` `\`  | Show clock    |
| `\` `c`  | Show calendar |

<img alt="Png" src="https://raw.githubusercontent.com/wiki/itchyny/calendar.vim/image/image.png" width="60%" />

#### Goyo - Work without distraction
Press `g` `y` to toggle Goyo

<img alt="Png" src="https://raw.github.com/junegunn/i/master/goyo.png" width="60%" />

#### suda.vim
Forgot to `sudo vim ...`? Just do `:sudowrite` or `:sw`

#### coc-translator
Press `ts` to **translate word under cursor**.

<img alt="Png" src="https://user-images.githubusercontent.com/20282795/72232547-b56be800-35fc-11ea-980a-3402fea13ec1.png" width="60%" />

## Custom Snippets
### Markdown
| Shortcut | What it creates     |
|----------|---------------------|
| `,n`     | ---                 |
| `,b`     | **Bold** text       |
| `,s`     | ~~sliced~~ text     |
| `,i`     | *italic* text       |
| `,d`     | `code block`        |
| `,c`     | big `block of code` |
| `,m`     | - [ ] check mark    |
| `,p`     | picture             |
| `,a`     | [link]()            |
| `,1`     | # H1                |
| `,2`     | ## H2               |
| `,3`     | ### H3              |
| `,4`     | #### H4             |
| `,l`     | --------            |

`,f` to go to the next `<++>` (placeholder)

`,w` to go to the next `<++>` (placeholder) and then press `Enter` for you

## Some Weird Stuff
### Press `tx` and enter your text
`tx Hello<Enter>`
```
 _   _      _ _
| | | | ___| | | ___
| |_| |/ _ \ | |/ _ \
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/
```

