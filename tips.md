## useful stuff

### replace any character to new line

using <C-v><C-M> or `\r` to insert `^M` character. It means new line.
It is absolutely strange.
`:s/CHAR/<C-v><C-M>/`

### replace or delete highlight characters

there are two ways.

first, if you use `/` to search content, you could use `v//e` to select content visually or use `c//e` to change content or use `d//e` to delete content. Note that `//` meaning to repeat last search which is like `n`.

second, you can use `gn` object motion to change or delete highlight content. for example, `cgn` change the highlight match and `dgn` delete it. this is highly recommend.

### common marks

- `\`.` go to the last change
- `\`\`` go to the last jump

### jump backward and forward in the changelist.

using `g;` and `g,` jump backward and forward
using `gi` go to the latest insert position in insert mode

### toggle the exclusivity of a motion

precede it with a `v` character. eg: `dvw` will delete string `Hello world` to `orld`

### go back to the start of a visual selection

In visual mode, using `o` command to achieve it. Enjoy it :)

### Enjoy the POWER of global command ^\_^

用问号是因为搜索点是从`global`匹配的地方开始的, 用`;` 分割而不是`,` 分割, `;`分割会把搜索点放在搜索后的地方, 而`,` 搜索点不变
copy all fields with comments to the end of file.

1. `:g/private/ ?\v/\*\*? , . copy $`
2. `:g/private/ ?/\*\*? , . copy $`

copy all comments of all fields to the end of file.
**appreciate the details in these commands**

1. `:g/private/ ?/\*\*? , ?\*/? copy $`
2. `:g/private/ ?/\*\*? ; /\*\// copy $`

费了老大力气弄出来的命令, 拷贝字段注释以及字段.
`:g/private/yank a|?/\*\*? , ?\*/? t$ | $pu a`

