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
* `\`.` go to the last change
* `\`\`` go to the last jump

### jump backward and forward in the changelist.
using `g;` and `g,` jump backward and forward
