# My NeoVim Config (A NeoVim Config for Colemak Users)

![demo](./demo.png)

Please **DO NOT** just copy this config without really looking at it! Please, at least, read this README file!

## After Installation, You Need To:

- [ ] Install `pynvim` (pip)
- [ ] Install `nodejs`
- [ ] Install nerd-font (actually it's optional but it looks real good)

## After Installation, You Might Want To:

#### First of all
- [ ] Do `:checkhealth`

#### Config `Python` path
- [ ] Well, make sure you have python
- [ ] See `_machine_specific.vim`

#### For Code AutoComplete (coc)

Python:
- [ ] Do `pip3 install flake8` (for linting)

#### For Taglist:

- [ ] Install `ctags` for function/class/variable list

#### For inputing text ASCII art
- [ ] Install `figlet`

## Keyboard Shortcuts for `NORMAL` (`COMMAND`) Mode

### 1 Basic Commands

#### 1.1 The Most Basics

**`k`** : to switch to **`INSERT`** : mode, equals to key `i`

**`Q`** : quit current vim window, equals to command `:q`

**`S`** : save the current file, equals to command `:w`

**_IMPORTANT_**

  Since the `i` key has been mapped to `k`, every command (combination) that involves `i` should use `k` instead (for example, `ciw` should be `ckw`).

#### 1.2 Remapped Cursor Movement

| Command    | What it does                                              | Equivalent (QWERTY) |
|------------|-----------------------------------------------------------|---------------------|
| `u`        | Cursor up a terminal line                                 | `k`                 |
| `e`        | Cursor down a terminal line                               | `j`                 |
| `n`        | Cursor left                                               | `h`                 |
| `i`        | Cursor right                                              | `l`                 |
| `U`        | Cursor up 5 terminal lines                                | `5k`                |
| `E`        | Cursor down 5 terminal lines                              | `5j`                |
| `N`        | Cursor to the start of the line                           | `0`                 |
| `I`        | Cursor to the end of the line                             | `$`                 |
| `Ctrl` `u` | Move the view port up 5 lines without moving the cursor   | `Ctrl` `y`          |
| `Ctrl` `e` | Move the view port down 5 lines without moving the cursor | `Ctrl` `e`          |
| `h`        | Move to the end of this word                              | `e`                 |

#### 1.3 Remapped Editor Commands
| Command | What it does |
|---------|--------------|
| `l`     | undo         |

#### 1.4 Some Other Commands to Know

| Command | What it does                          |
|---------|---------------------------------------|
| `<C-i>` | Go to the next cursor position        |
| `<C-o>` | Go to the previous cursor position    |
| `<C-a>` | Increase the number under cursor by 1 |
| `<C-x>` | Decrease the number under cursor by 1 |
| `z=`    | Show spell suggestions                |
| `H`     | Joins the current line with the next  |
| `<`     | Un-indent                             |
| `>`     | Indent                                |


### 2 Window Management

#### 2.1 Creating Window Through Split Screen

| Command | What it does                                                                |
|---------|-----------------------------------------------------------------------------|
| `su`    | Create a new horizontal split screen and place it above the current window  |
| `se`    | Create a new horizontal split screen and place it below the current window  |
| `sn`    | Create a new vertical split screen and place it left to the current window  |
| `si`    | Create a new vertical split screen and place it right to the current window |
| `sv`    | Set the two splits to be vertical                                           |
| `sh`    | Set the two splits to be horizontal                                         |
| `srv`   | Rotate splits and arrange splits vertically                                 |
| `srh`   | Rotate splits and arrange splits horizontally

#### 2.2 Moving the Cursor Between Different Windows

| Shortcut   | Action                         |
|------------|--------------------------------|
| `<SPACE>w` | Move cursor to the next window |
| `<SPACE>n` | Move cursor one window left    |
| `<SPACE>i` | Move cursor one window right   |
| `<SPACE>u` | Move cursor one window up      |
| `<SPACE>e` | Move cursor one window down    |

#### 2.3 Resizing Different Windows
Use the arrow keys to resize the current window.

## Plugins

#### COC (AutoCompletion)

| Shortcut    | Action                |
|-------------|-----------------------|
| `Space` `y` | Get yank history list |
| `gd`        | Go to definition      |
| `gr`        | List references       |
| `gi`        | List implementation   |
| `gy`        | Go to type definition |

#### NERDTree

| Shortcut          | Action          |
|-------------------|-----------------|
| `tt`              | Toggle NerdTree |
| `,` (in NERDTREE) | Toggle menu     |

#### Tagbar
Press `T` (`Shift` + `t`) to open Taglist (function and variable list).

Press `q` to leave Tagbar

#### FZF (the fuzzy file finder)

| Shortcut   | Action           | Command       |
|------------|------------------|---------------|
| `Ctrl` `p` | Active FZF       | `:FZF<Enter>` |
| `Ctrl` `u` | Move up 1 item   | ` `           |
| `Ctrl` `e` | Move down 1 item | ` `           |

#### Undotree

| Shortcut      | Action        |
|---------------|---------------|
| `Shift` + `L` | Open Undotree |
| `Shift` + `K` | History go up |
| `Shift` + `J` | History go down |

#### vim-startify (Startup screen)
Press `Space` `s` `t` to openup `startify`

#### thesaurus_query.vim
Press `Space` `t` `h` to find synonyms

#### vim-signiture (Bookmarks)

| Shortcut    | Action                          | Command |
|-------------|---------------------------------|---------|
| `m<letter>` | Add/remove mark at current line |         |
| `m/`        | List all marks                  |         |
| `m<SPACE>`  | Jump to the next mark in buffer |         |

For more commands, see [here](https://github.com/MattesGroeger/vim-bookmarks#usage)

#### vim-table-mode

Toggle "Table Editing Mode" with `<SPACE>tm` (equals to command `:TableModeToggle<CR>`)

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

#### vim-calc
Press `Space` + `a` to calculate the equation in the current line

## Custom Snippets
#### Markdown
| Shortcut | what it creates     |
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

`,f` to go to the next `` (placeholder)

`,w` to go to the next `<++>` (placeholder) and then press `Enter` for you


## Other Useful Stuff

#### Press `<SPACE>fd` to highlight adjacent duplicated words

#### Press `tx` and enter your text

`tx Hello<Enter>`
```
 _   _      _ _
| | | | ___| | | ___
| |_| |/ _ \ | |/ _ \
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/
```

