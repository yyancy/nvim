local set = vim.keymap.set
local opts = { silent = true }
local ropts = { remap = true, silent = true }
local vscode = require("vscode-neovim")

-- Options
-- https://github.com/vscode-neovim/vscode-neovim/issues/1498#issuecomment-2228057878
-- Solve wrong cursor position when set gj and gk keybind.
vim.opt.ve = "onemore"

-- keymaps
set("n", "<c-j>", "<c-w>j", ropts)
set("n", "<c-k>", "<c-w>k", ropts)
set("n", "<c-h>", "<c-w>h", ropts)
set("n", "<c-l>", "<c-w>l", ropts)

set("n", "j", "gj", ropts)
set("n", "k", "gk", ropts)


-- lsp
-- stylua: ignore start

set('n', '<leader>1', function()  vscode.call('workbench.action.openEditorAtIndex1') end, opts)
set('n', '<leader>2', function()  vscode.call('workbench.action.openEditorAtIndex2') end, opts)
set('n', '<leader>3', function()  vscode.call('workbench.action.openEditorAtIndex3') end, opts)
set('n', '<leader>4', function()  vscode.call('workbench.action.openEditorAtIndex4') end, opts)
set('n', '<leader>5', function()  vscode.call('workbench.action.openEditorAtIndex5') end, opts)
set('n', '<leader>6', function()  vscode.call('workbench.action.openEditorAtIndex6') end, opts)
set('n', '<leader>7', function()  vscode.call('workbench.action.openEditorAtIndex7') end, opts)
set('n', '<leader>8', function()  vscode.call('workbench.action.openEditorAtIndex8') end, opts)
set('n', '<leader>9', function()  vscode.call('workbench.action.openEditorAtIndex9') end, opts)

set("n", "<leader>i", function() vscode.call("workbench.action.openNextRecentlyUsedEditor") end, opts)
set("n", "<leader>o", function() vscode.call("workbench.action.openPreviousRecentlyUsedEditor") end, opts)

set("n", "<leader>h", function() vscode.call("workbench.action.previousEditor") end, opts)
set("n", "<leader>l", function() vscode.call("workbench.action.nextEditor") end, opts)

set("n", "[b", function() vscode.call("workbench.action.previousEditor") end, ropts)
set("n", "]b", function() vscode.call("workbench.action.nextEditor") end, ropts)


set('n', '<leader>gf', function() vscode.call('actions.find') end, opts)
set('n', '<leader>gr', function() vscode.call('editor.action.startFindReplaceAction') end, opts)
set('n', '<leader>gq', function() vscode.call('actions.find') end, opts)
set('n', '<leader>gw', function() vscode.call('editor.action.startFindReplaceAction') end, opts)

set('n','<leader>ff', '<cmd>Find<cr>')
set('n','<leader>,', '<cmd>Find<cr>')
set('n',';f', '<cmd>Find<cr>')
set('n','<leader>bb', function() vscode.call('workbench.action.showAllEditorsByMostRecentlyUsed') end, ropts)

set('n','<f12>',function () vscode.call('workbench.action.gotoSymbol') end ,opts)
set('n','<leader>E',function () vscode.call('workbench.action.toggleSidebarVisibility') end ,opts)


set('n', '<leader>qq', function() vscode.call('workbench.action.closeActiveEditor') end, opts)
set('n', '<leader>ww', function() vscode.call('workbench.action.files.saveFiles') end, opts)
set('n', '<leader>qa', function() vscode.call('workbench.action.closeOtherEditors') end, opts)


set("n", "<leader>fa", function() vscode.call("workbench.action.findInFiles") end, opts)
set("n", "gi", function() vscode.call("editor.action.goToImplementation") end, opts)
set("n", "gy", function() vscode.call("editor.action.goToTypeDefinition") end, opts)
set("n", "gr", function() vscode.call("editor.action.goToReferences") end, opts)

set("n", "go", function() vscode.call("workbench.action.gotoSymbol") end, opts)
set("n", "gO", function() vscode.call("workbench.action.showAllSymbols") end, opts)
set("n", "za", function() vscode.call("editor.toggleFold") end, opts)
set("n", "zc", function() vscode.call("editor.fold") end, opts)
set("n", "zo", function() vscode.call("editor.unfold") end, opts)

set("n", "<leader>rn", function() vscode.call("editor.action.rename") end, opts)

set('n', ']g', function() vscode.call('editor.action.marker.prev')  end, opts)
set('n', ']g', function() vscode.call('editor.action.marker.next')  end, opts)

set('n', '[n', function() vscode.call('workbench.action.editor.previousChange')  end, ropts)
set('n', ']n', function() vscode.call('workbench.action.editor.nextChange')  end, ropts)
set('n', '[c', function() vscode.call('merge-conflict.next')  end, ropts)
set('n', ']c', function() vscode.call('merge-conflict.previous')  end, ropts)


set('n', 'gx', function() vscode.call('editor.action.openLink')  end, opts)


set("n", "<leader>`", function()
  vscode.call("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
  vscode.call("list.select")
end, ropts)
set("n", "<leader><tab>", function()
  vscode.call("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
  vscode.call("list.select")
end, ropts)

set('n', '<leader>ro', function()
  vscode.call('editor.action.organizeImports')
  vscode.call('editor.action.formatDocument')
end, {noremap=false})
set('n', '<leader>cl', function() vscode.call('editor.action.formatDocument')  end, ropts)


set('n', '<leader>n', function() vscode.call('editor.action.marker.next')  end, opts)
set('n', '<leader>p', function() vscode.call('editor.action.marker.prev')  end, opts)
set('n', '<leader>N', function() vscode.call('editor.action.marker.nextInFiles')  end, opts)
set('n', '<leader>P', function() vscode.call('editor.action.marker.prevInFiles')  end, opts)

set('n', '<leader>gr', function() vscode.call('git.revertSelectedRanges')  end, opts)

set('n', '`.', function() vscode.call('workbench.action.navigateToLastEditLocation')  end, opts)
-- set('n', '<-n>', 'mciw*<Cmd>nohl<CR>', ropts)
vim.keymap.set({ "n", "x", "i" }, "<a-s-l>", function()
vscode.with_insert(function()
  vscode.action("editor.action.addSelectionToNextFindMatch")
end)
end)
-- quit
