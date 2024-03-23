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

bind-key / copy-mode \; send-key ?
bind-key -t vi-edit C-u delete-line

## FAQ


`
local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = actions.select_default + actions.center,
      },
    },
  },
})``


vim.cmd("norm! zz")


require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
        ["<C-x>"] = require("telescope.actions").select_horizontal + require("telescope.actions").center,
        ["<C-v>"] = require("telescope.actions").select_vertical + require("telescope.actions").center,
        ["<C-t>"] = require("telescope.actions").select_tab + require("telescope.actions").center,
      },
      n = {
        ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
        ["<C-x>"] = require("telescope.actions").select_horizontal + require("telescope.actions").center,
        ["<C-v>"] = require("telescope.actions").select_vertical + require("telescope.actions").center,
        ["<C-t>"] = require("telescope.actions").select_tab + require("telescope.actions").center,
      }
    }
  }
}

```
