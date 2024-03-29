"
" glyph margin for add breakpoint
"
"
" navigation between buffers
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" nmap j gj
" nmap k gk

" nmap o o<cmd>call VSCodeNotifyRange('emacs-tab.reindentCurrentLine', line('.'), line('.'), 1)<cr>
" nmap o o<cmd>call VSCodeNotifyRange('emacs-tab.reindentCurrentLine', line('.')-1, line('.')-1, 1)<cr>
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
nmap <leader>i <cmd>call VSCodeNotify('workbench.action.openNextRecentlyUsedEditor')<cr>
nmap <leader>o <cmd>call VSCodeNotify('workbench.action.openPreviousRecentlyUsedEditor')<cr>
nmap <leader>h <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
nmap <leader>l <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>

nmap <leader>gf <cmd>call VSCodeNotify('actions.find')<cr>
nmap <leader>gr <cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<cr>


nnoremap <leader>ff :Find<cr>
" nnoremap <leader>ls <cmd>call VSCodeNotify('workbench.action.showAllSymbols')<cr>
map <f12> <cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>
map <leader>E <cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>


map <leader>qq <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
map <leader>w <cmd>call VSCodeNotify('workbench.action.files.saveFiles')<cr>
map <leader>qa <cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<cr>


nnoremap <leader>fa <cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
nnoremap gi <cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>
nnoremap gy <cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<cr>
nnoremap gr <cmd>call VSCodeNotify('editor.action.goToReferences')<cr>

map go <cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>
map gO <cmd>call VSCodeNotify('workbench.action.showAllSymbols')<cr>
nnoremap za <cmd>call VSCodeNotify('editor.toggleFold')<cr>
nnoremap zc <cmd>call VSCodeNotify('editor.fold')<cr>
nnoremap zo <cmd>call VSCodeNotify('editor.unfold')<cr>

nnoremap <leader>rn <cmd>call VSCodeNotify('editor.action.rename')<cr>
nnoremap [g <cmd>call VSCodeNotify('editor.action.marker.prev')<cr>
nnoremap ]g <cmd>call VSCodeNotify('editor.action.marker.next')<cr>
nnoremap [n <cmd>call VSCodeNotify('workbench.action.editor.previousChange')<cr>
nnoremap ]n <cmd>call VSCodeNotify('workbench.action.editor.nextChange')<cr>
nnoremap [c <cmd>call VSCodeNotify('merge-conflict.next')<cr>
nnoremap ]c <cmd>call VSCodeNotify('merge-conflict.previous')<cr>
nnoremap gx <cmd>call VSCodeNotify('editor.action.openLink')<cr>

nmap <leader>ro <cmd>call VSCodeNotify('editor.action.organizeImports')<cr><cmd> call VSCodeNotify('editor.action.formatDocument')<cr>
nmap <leader>cl <cmd>call VSCodeNotify('editor.action.formatDocument')<cr>
nnoremap <leader>n <cmd>call VSCodeNotify('editor.action.marker.next')<cr>
nnoremap <leader>p <cmd>call VSCodeNotify('editor.action.marker.prev')<cr>
nnoremap <leader>N <cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<cr>
nnoremap <leader>P <cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<cr>
