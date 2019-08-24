# My NeoVim Config

## After Installation, You Need To:

- [ ] Install `pynvim`
- [ ] Install `Node`

## After Installation, You Might Want To:

### On MacOS:

~~- [ ] Install MacVim and use Iterm2 if something is not working right~~

### Config `Python` path
- [ ] See `_machine_specific.vim`

### For Code AutoComplete (NCM2)

- [ ] Install `font-mathematica` for `ncm2-match-highlight`
- [ ] Run `sudo python3 [your vim folder]/plugged/install.py`
- [ ] For python: `sudo pip3 install pylint autopep8 yapf`

### For Taglist:

- [ ] Install `ctags` for function/class/variable list

## Keyboard Shortcuts for `NORMAL` (`COMMAND`) Mode

### 1 Basic Commands

#### 1.1 The Most Basics

**`k`** : to switch to **`INSERT`** : mode, equals to key `i`

**`Q`** : quit current vim window, equals to command `:q`

**`S`** : save the current file, equals to command `:w`

**_IMPORTANT_**

  Since the `i` key has been mapped to `k`, every command (combination) that involves `i` should use `k` instead (for example, `ciw` should be `ckw`).

#### 1.2 Cursor Movement

| Command    | What it does                                              | Equivalent (QWERTY) |
|------------|-----------------------------------------------------------|---------------------|
| `u`        | cursor up a terminal line                                 | `k`                |
| `e`        | cursor down a terminal line                               | `j`                |
| `n`        | cursor left                                               | `h`                 |
| `i`        | cursor right                                              | `l`                 |
| `U`        | cursor up 5 terminal lines                                | `5k`               |
| `E`        | cursor down 5 terminal lines                              | `5j`               |
| `N`        | cursor to the start of the line                           | `0`                 |
| `I`        | cursor to the end of the line                             | `$`                 |
| `Ctrl` `u` | move the view port up 5 lines without moving the cursor   | `Ctrl` `y`          |
| `Ctrl` `e` | move the view port down 5 lines without moving the cursor | `Ctrl` `e`          |
| `w`        | next word                                                 |                     |
| `h`        | move to the end of this word                              | `e`                 |
| `b`        | previous word                                             |                     |

#### 1.3 Some Other Commands That Your Moms Don't Tell You

| Command | What it does                          |
|---------|---------------------------------------|
| `<C-i>` | Go to the next cursor position        |
| `<C-o>` | Go to the previous cursor position    |
| `<C-a>` | Increase the number under cursor by 1 |
| `<C-x>` | Decrease the number under cursor by 1 |
| `z=`    | Show spell suggestions                |


### 2 Window Management

#### 2.1 Creating Window Through Split Screen

| Command | What it does                                                                |
|---------|-----------------------------------------------------------------------------|
| `su`    | Create a new horizontal split screen and place it above the current window  |
| `se`    | Create a new horizontal split screen and place it below the current window  |
| `sn`    | Create a new vertical split screen and place it left to the current window  |
| `si`    | Create a new vertical split screen and place it right to the current window |
| `sv`    | Set the two splits to be vertical                                           |
| `sh     | Set the two splits to be horizontal                                         |

#### 2.2 Moving the Cursor Between Different Windows

| Action                         | Shortcut   | Command  |
|--------------------------------|------------|----------|
| Move cursor to the next window | `<SPACE>w` | `<C-w>w` |

### 3 Opening/Locating a File

#### 3.1 NERDTree

| Action          | Shortcut | Command           |
|-----------------|----------|-------------------|
| Toggle NerdTree | `tt`     | `:NERDTreeToggle` |


#### 3.2 CtrlP (the fuzzy file finder)

| Action           | Shortcut   | Command      |
|------------------|------------|--------------|
| Active CtrlP     | `Ctrl` `p` | `:CtrlP<CR>` |
| Move up 1 item   | `Ctrl` `u` | ` `          |
| Move down 1 item | `Ctrl` `e` | ` `          |

### 4 AutoComplete (YCM)

| Action            | Shortcut | Command                                           |
|-------------------|----------|---------------------------------------------------|
| Go to definition  | `gd`     | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` |
| Get documentation | `g/`     | `:YcmCompleter GetDoc<CR>`                        |
| Get type          | `gt`     | `:YcmCompleter GetType<CR>`                       |
| Go to references  | `gr`     | `:YcmCompleter GoToReferences`                    |

### 5 Undotree

Press `Shift` + `L` to open Undotree

### 6 Bookmarks (vim-signiture)

| Action                          | Shortcut    | Command |
|---------------------------------|-------------|---------|
| Add/remove mark at current line | `m<letter>` |         |
| List all marks                  | `m/`        |         |
| Jump to the next mark in buffer | `m<SPACE>`  |         |

For more commands, see [here](https://github.com/MattesGroeger/vim-bookmarks#usage)

### 7 Markdown File Editing

#### 7.1 Edit Table with `vim-table-mode`

Toggle "Table Editing Mode" with `<SPACE>tm` (equals to command `:TableModeToggle<CR>`)

### Some Other Useful Stuff

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

