# My NeoVim Config (A NeoVim Config for Colemak Users)

#### [中文版README](./README_cn.md) by [@EvanMeek](https://github.com/EvanMeek)

![demo](./demo.png)

Please **DO NOT** just copy this config without really looking at it! Please, at least, read this README file!

## Index
- [Things to Know After Installation](#after-installation%2C-you-need-to%3A)
- [Keyboard Shortcuts](#keyboard-shortcuts)
	- [1. Basic Keyboard Shortcuts](#1-basic-editor-features)
		- [1.1 The Most Basics](#1.1-the-most-basics)
		- [1.2 Remapped Cursor Movement](#1.2-remapped-cursor-movement)
		- [1.3 Remapped Insert Mode Keys](#1.3-remapped-insert-mode-keys)
		- [1.4 Remapped Text Manipulating Commands in Normal Mode](#1.4-remapped-text-manipulating-commands-in-normal-mode)
		- [1.5 Other Useful Normal Mode Remapping](#1.5-other-useful-normal-mode-remapping)
	- [2. Window Management](#2-window-management)
		- [2.1 Creating Window Through Split Screen](#2.1-creating-window-through-split-screen)
		- [2.2 Moving the Cursor Between Different Windows](#2.2-moving-the-cursor-between-different-windows)
		- [2.3 Resizing Different Windows](#2.3-resizing-different-windows)
		- [2.4 Closing Windows](#2.4-closing-windows)
	- [3. Tab Management](#3-tab-management)
	- [4. Terminal Keyboard Shortcuts](#4-terminal-keyboard-shortcuts)
- [Plugin Shortcuts](#plugins)
	- AutoComplete / Snippets
		- [COC](#for-code-autocomplete---coc)
		- [Ultisnips](#ultisnips)
	- File Browsing/Management
		- [NERDTree](#nerdtree)
		- [Ranger.vim](#ranger.vim---file-browser)
		- [FZF](#fzf---the-fuzzy-file-finder)
	- Git
		- [GV](#gv---commit-browser)
		- [GitGutter](#gitgutter)
		- [fzf-gitignore](#fzf-gitignore)
	- Find / Replace
		- [far.vim](#far.vim---find-and-replace)
	- Text Editing
		- [vim-table-mode](#vim-table-mode)
		- [vim-multiple-cursors](#vim-multiple-cursors)
		- [vim-surround](#vim-surround)
	- Editor Enhancement
		- [Vista.vim](#vista.vim) (Taglist)
		- [Undotree](#undotree)
		- [vim-startify](#vim-startify---startup-screen) (Startup Screen)
		- [vim-signiture](#vim-signiture---bookmarks) (Bookmarks)
		- [vim-calc](#vim-calc)
		- [AutoFormat](#autoformat)
		- [Goyo](#goyo---work-without-distraction) (Remove distractions)
	- Vim Apps
		- [vim-calendar](#vim-calendar)
- [Custom Markdown Snippets](#custom-snippets)
- [Other Weird Stuff](#other-weird-stuff)


## After Installation, You Need To:

- [ ] Install `pynvim` (pip)
- [ ] Install `nodejs`, and do `npm install -g neovim`
- [ ] Install nerd-fonts (actually it's optional but it looks real good)

## After Installation, You Might Want To:
#### First of all
- [ ] Do `:checkhealth`

#### Config `Python` path
- [ ] Well, make sure you have python
- [ ] See `_machine_specific.vim`

#### For Code AutoComplete - coc
Python:
- [ ] Do `pip3 install flake8` (for linting)

#### For Taglist:
- [ ] Install `ctags` for function/class/variable list

#### For Denite:
- [ ] Install `ripgrep`
- [ ] Install `fd`

#### And also...
- [ ] Install `figlet` for inputing text ASCII art
- [ ] Install `xclip` for system clipboard access (`Linux` and `xorg` only)

## Keyboard Shortcuts
### 1 Basic Editor Features
#### 1.1 The Most Basics
**`k`** : to switch to **`INSERT`** : mode, equals to key `i`

**`Q`** : quit current vim window, equals to command `:q`

**`S`** : save the current file, equals to command `:w`

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
| `Ctrl` `a`      | Increase the number under cursor by 1 |
| `Ctrl` `x`      | Decrease the number under cursor by 1 |
| `SPACE` `SPACE` | Goto the next placeholder (`<++>`)    |

#### 1.5 Other Useful Normal Mode Remapping
| Shortcut        | Action                                 |
|-----------------|----------------------------------------|
| `r`             | **Compile/Run the current file**       |
| `Y`             | Copy selected text to system clipboard |
| `z` `=`         | Show spell suggestions                 |
| `SPACE` `s` `c` | Toggle spell suggestion a              |
| `SPACE` `d` `w` | Find adjacent duplicated word          |
| `SPACE` `t` `t` | Convert every 4 Spaces to a tab        |
| `SPACE` `o`     | Fold                                   |
| `SPACE` `-`     | Previous quick-fix position            |
| `SPACE` `+`     | Next quick-fix position                |
| `\` `p`         | Show the path of the current file      |

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
| `SPACE` `/` | Create a new split with a terminal below the current window |
| `Ctrl` `n`  | Escape from terminal input mode                             |

## Plugins
#### COC (AutoCompletion)
| Shortcut        | Action                    |
|-----------------|---------------------------|
| `Space` `y`     | **Get yank history list** |
| `gd`            | Go to definition          |
| `gr`            | List references           |
| `gi`            | List implementation       |
| `gy`            | Go to type definition     |
| `Space` `r` `n` | Rename a variable         |

#### Ultisnips
| Shortcut   | Action                                           |
|------------|--------------------------------------------------|
| `Ctrl` `e` | Expand a snippet                                 |
| `Ctrl` `n` | (in snippet) Previous Cursor position in snippet |
| `Ctrl` `e` | (in snippet) Next Cursor position in snippet     |

#### NERDTree
| Shortcut          | Action              |
|-------------------|---------------------|
| `tt`              | **Toggle NerdTree** |
| `I`               | Open in new split   |
| `O`               | Open in new tab     |
| `l`               | Change root         |
| `z` `h`           | Toggle hidden       |
| `,` (in NERDTREE) | Toggle menu         |

#### GitGutter
| Shortcut        | Action                            |
|-----------------|-----------------------------------|
| `H`             | **Show git hunk at current line** |
| `SPACE` `g` `-` | Go to previous git hunk           |
| `SPACE` `g` `+` | Go to next git hunk               |
| `SPACE` `g` `f` | Fold everything except hunks      |

#### vim-table-mode
| Shortcut        | Action            |
|-----------------|-------------------|
| `SPACE` `t` `m` | Toggle table mode |
| `SPACE` `t` `r` | Realign table     |

See `:help table-mode.txt` for more.

#### Vista.vim
| Shortcut   | Action                              |
|------------|-------------------------------------|
| `T`        | toggle function and variable list   |
| `Ctrl` `t` | open function/class/variable finder |

#### FZF - the fuzzy file finder
| Shortcut   | Action           |
|------------|------------------|
| `Ctrl` `p` | **Active FZF**   |
| `Ctrl` `u` | Move up 1 item   |
| `Ctrl` `e` | Move down 1 item |

#### Undotree
| Shortcut      | Action        |
|---------------|---------------|
| `Shift` + `L` | Open Undotree |
| `Shift` + `K` | History go up |
| `Shift` + `J` | History go down |

#### Ranger.vim - file browser
- [ ] Make sure you have ranger installed
Press `R` to open Ranger (file selector)

#### vim-startify - Startup screen
Press `Space` `s` `t` to openup `startify`

#### vim-signiture - Bookmarks
| Shortcut    | Action                          | Command |
|-------------|---------------------------------|---------|
| `m<letter>` | Add/remove mark at current line |         |
| `m/`        | List all marks                  |         |
| `mSPACE`    | Jump to the next mark in buffer |         |

For more commands, see [here](https://github.com/MattesGroeger/vim-bookmarks#usage)

#### vim-multiple-cursors
| Shortcut   | Action                              |
|------------|-------------------------------------|
| `Ctrl`+`k` | Select next word (multiple cursors) |
| `Ctrl`+`p` | Select previous word                |
| `Ctrl`+`x` | Skip word                           |
| `Esc`      | Quit mutiple cursors                |

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

#### far.vim - find and replace
| Shortcut        | Action                   |
|-----------------|--------------------------|
| `SPACE` `f` `a` | Find in the current file |
| `SPACE` `f` `r` | Find and replace         |

#### fzf-gitignore
Press `Space` `g` `i` to create a `.gitignore` file

#### GV - commit browser
| Shortcut | Action              |
|----------|---------------------|
| `g` `v`  | Open commit browser |
| `q`      | Quit GV window      |

#### vim-calc
Press `Space` + `a` to calculate the equation in the current line

#### vim-calendar
| Shortcut | Action        |
|----------|---------------|
| `\` `\`  | Show clock    |
| `\` `c`  | Show calendar |

#### AutoFormat
Press `\` `f` to format code

#### Goyo - Work without distraction
Press `g` `y` to toggle Goyo

## Custom Snippets
#### Markdown
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

## Other Weird Stuff
#### Press `tx` and enter your text
`tx Hello<Enter>`
```
 _   _      _ _
| | | | ___| | | ___
| |_| |/ _ \ | |/ _ \
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/
```

