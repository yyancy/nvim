" navigation between buffers
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

map <leader>1 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<cr>
map <leader>2 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<cr>
map <leader>3 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<cr>
map <leader>4 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<cr>
map <leader>5 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<cr>
map <leader>6 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<cr>
map <leader>7 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<cr>
map <leader>8 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<cr>
map <leader>9 <cmd>call VSCodeNotify('workbench.action.openEditorAtIndex9')<cr>
" noremap i  <cmd>call VSCodeCall('emacs-tab.reindentCurrentLine')<cr>i


nnoremap <leader>ff :Find<cr>
nnoremap <leader>ls <cmd>call VSCodeNotify('workbench.action.showAllSymbols')<cr>
map <f12> <cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>
map <leader>E <cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>


map <leader>q <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
map <leader>w <cmd>call VSCodeNotify('workbench.action.files.save')<cr>
map <leader><tab> <cmd>call VSCodeNotify('workbench.action.closeEditorsToTheRight')<cr>


nnoremap <leader>fa <cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
nnoremap gi <cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>
nnoremap gy <cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<cr>
nnoremap gr <cmd>call VSCodeNotify('editor.action.goToReferences')<cr>

nnoremap za <cmd>call VSCodeNotify('editor.toggleFold')<cr>
nnoremap zc <cmd>call VSCodeNotify('editor.fold')<cr>
nnoremap zo <cmd>call VSCodeNotify('editor.unfold')<cr>

nnoremap <leader>rn <cmd>call VSCodeNotify('editor.action.rename')<cr>
nnoremap [g <cmd>call VSCodeNotify('editor.action.marker.prev')<cr>
nnoremap ]g <cmd>call VSCodeNotify('editor.action.marker.next')<cr>
nnoremap [[g <cmd>call VSCodeNotify('workbench.action.editor.previousChange')<cr>
nnoremap ]]g <cmd>call VSCodeNotify('workbench.action.editor.nextChange')<cr>
nnoremap [c <cmd>call VSCodeNotify('merge-conflict.next')<cr>
nnoremap ]c <cmd>call VSCodeNotify('merge-conflict.previous')<cr>
