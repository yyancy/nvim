# nvim

My000 nvim configurations.

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
