# nvim

My nvim configurations.

## Prerequisite
### Installing node and configure mirrors
```bash
# References https://developer.aliyun.com/article/868238?spm=a2c6h.13148508.0.0.66e84f0ehbA8XI
npm config set registry https://registry.npmmirror.com
```


### Installing python neovim
``` bash
pip3 install pynvim --upgrade
```

## TODO
* currently, the completion list is not good. look for improving it.
* add MRU sort for telescope.nvim with telescope-frecency.nvim

## FAQ

### debug coc
1. setting "diagnostic-languageserver.trace.server": "verbose" in coc-settings.json
2. open file
3. run :CocCommand workspace.showOutput and select option diagnostic-languageserver

### completion tools
* tabnine

## FAQ

### non-greedy search
`.\{-}` or `\v.{-}`

### dot matching include space and newline char
`\_.`
