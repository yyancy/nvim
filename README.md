# nvim

My nvim configurations.

## Prerequisite

bind-key / copy-mode \; send-key ?
bind-key -t vi-edit C-u delete-line

+ go snippets expand
+ indentation textobject
+ <C-f> <C-b> keybinding in cmd mode


## Tips
### vim-visual-multi 
vm-single-mode, can use to generate seqence numbers

first enter cursor mode then `\\<CR>` enter single region mode, can use `<tab>` and `<S-Tab>` in insert mode to move.
- https://github.com/mg979/vim-visual-multi/issues/68 

### seq expression
:h vm-numbering, can use `\\n` or `\\N` to geneate seq numbers

### normal command
*vm-run-at-cursors*, use `\\z` to run normal commmand to achive more action. very useful!!
for example, can use \\z and input `crs` to change text style or `saiw'` to add surround characters.

### useful mappings
- \\A select all words
- \\gS reselect previous regions
- \\c add cursor add every start of lines
- \\C word case convert
- gw{motion} format lines with textwidth option. check:
  https://github.com/LazyVim/LazyVim/discussions/2978 
