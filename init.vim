"                               _             _
"  _   _  __ _ _ __   ___ _   _( )___  __   _(_)_ __ ___
" | | | |/ _` | '_ \ / __| | | |// __| \ \ / / | '_ ` _ \
" | |_| | (_| | | | | (__| |_| | \__ \  \ V /| | | | | | |
"  \__, |\__,_|_| |_|\___|\__, | |___/   \_/ |_|_| |_| |_|
"  |___/                  |___/
"                   __ _                       _   _
"   ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __  ___
"  / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \/ __|
" | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | \__ \
"  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|___/
"                        |___/

" ===
" === common configuration
" ===

" let g:VM_leader="\\\\"
set nocompatible
syntax on                 " 支持语法高亮显示
set number                " show line number.
set hidden
set relativenumber
set cursorline " displays a line on the line where the cursor is
filetype plugin indent on " 启用根据文件类型自动缩进
set mouse=a
set wrap
set showcmd
set ignorecase
set smartcase
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,gb18030,latin1
set conceallevel=0

" modify cursor pattern.
let &t_ut=''
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set path=.,**
set wildmenu
set wildmode=longest:list,full

set hlsearch
exec "nohlsearch"
set incsearch

set autoindent            " 开始新行时处理缩进
set expandtab             " 将制表符Tab展开为空格，这对于Python尤其有用
set tabstop=2             " 要计算的空格数
set softtabstop=2
set shiftwidth=2          " 用于自动缩进的空格数
set tw=0
set backspace=2           " 在多数终端上修正退格键Backspace的行为
set foldlevel=99
set laststatus=2
" set autochdir



set ttimeoutlen=300
" set timeoutlen=500
" set notimeout
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set visualbell
" set lazyredraw "same as above

" restore cursor position which last was.
if !exists('g:vscode')
au BufReadPost * if line("'\"") > 2 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif
" set list
" set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set sidescroll=10


" if exists('g:vscode')
"   finish
" endif

" set backupdir

" set clipboard=unnamed,unnamedplus
set clipboard+=unnamedplus

set guioptions+=a
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set colorcolumn=100
set updatetime=4000
set virtualedit=block
set isfname+=&
set viewoptions=folds,cursor


silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
silent !mkdir -p $HOME/.config/nvim/tmp/session
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.

set undofile

set undodir=$HOME/.config/nvim/tmp/undo,.



" ===
" === autocmd
" ===

" autocmd BufNewFile *.txt set ft=confluencewiki
" autocmd BufEnter *.txt set ft=confluencewiki
autocmd CursorHold * normal! m'
" autocmd CursorHold * if line(".") != 1 | normal! m' | endif
augroup remember_folds
    autocmd!
    au BufWinLeave,BufLeave ?* silent! mkview
    au BufWinEnter           ?* silent! loadview
augroup END

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

if !exists('g:vscode')
augroup insert_remap
  autocmd FileType c,cpp,go,typescript,json nmap i i<C-f>
  autocmd FileType c,cpp,go,typescript,json nmap a a<C-f>
augroup END
endif

augroup highlight_yank
    autocmd!
" autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}
augroup END



set termguicolors
" ===
" === Terminal Behaviors
" ===
" autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'



" ===
" === mappings
" ===

let mapleader=" "

if !exists('g:vscode')
vmap <C-c> y
vmap <C-v> p
imap <C-v> <esc>pa
map <S-C-v> p
endif
" map <C-a> :echo('C-a')<CR>
" map <C-S-a> :echo('C-S-a')<CR>
" map <S-S> :echo('S-S')<CR>

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<leader>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<leader>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <leader>, A,<esc>
nnoremap <leader>; A;<esc>

xmap <c-d> "ayp

" nnoremap ; :
" nnoremap : ;

map <leader>T :edit $MYVIMRC<CR>
map <leader>Z :w<CR>:so $MYVIMRC<CR>
nnoremap n nzz
nnoremap N Nzz
onoremap b vb
onoremap F vF
onoremap T vT
nmap 0 _

imap <C-e> <end>
imap <C-a> <home>
inoremap <a-b> <C-o>b
imap <a-f> <C-o>w



nmap . .`[

imap <C-d> <del>
" 使用<Ctrl> + hjkl快速在窗口间跳转
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

noremap j gj
noremap k gk

map <leader>\| :set splitright<CR>:vsplit<CR>
map <leader>sj :set nosplitright<CR>:vsplit<CR>
map <leader>- :set nosplitbelow<CR>:split<CR>
map <leader>sk :set splitbelow<CR>:split<CR>

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tu :tabe<CR>
map tp :-tabnext<CR>
map tn :+tabnext<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

noremap <LEADER><CR> :nohlsearch<CR>

noremap <leader>q :q<cr>
noremap <leader><C-q> :q!<cr>
noremap <leader>w :w<cr>
noremap <leader>x :x<cr>
" Opening a terminal window
"noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res -5<CR>:term<CR>
" noremap ; :
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv
inoremap <C-T> <C-F>
noremap 0 _
noremap <leader>tx :r !figlet

if has('unix')
  let g:python3_host_prog="/usr/bin/python3"
endif

let g:vimsyn_embed = 'l'

" <++>
" <++>
" <++>
" <++>
""""""""""""""""""""""""""""""""""""""""
"  plugins and relative configuration  "
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" temporary plugins
" Plug 'https://github.com/tpope/vim-rsi.git'

" quickfix enforcement
" Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
" Plug 'https://github.com/stevearc/qf_helper.nvim.git'
" temporary
" Plug 'https://github.com/folke/trouble.nvim'
" Plug 'https://github.com/tami5/sqlite.lua.git'
" Plug 'https://github.com/tpope/vim-abolish'



Plug 'https://github.com/Mofiqul/dracula.nvim'
" Plug 'https://github.com/kkoomen/vim-doge'



Plug 'https://github.com/fatih/vim-go',Cond(!exists('g:vscode'), { 'do': ':GoInstallBinaries' })
" adorn editor
Plug 'https://github.com/mhartington/oceanic-next'
Plug 'https://github.com/marko-cerovac/material.nvim'

" jump and search
Plug 'https://github.com/christoomey/vim-tmux-navigator', Cond(!exists('g:vscode'))
Plug 'https://github.com/haya14busa/vim-asterisk'

Plug 'https://github.com/machakann/vim-sandwich'


" bookmarks
" Plug 'https://github.com/MattesGroeger/vim-bookmarks'

" LSP 
" Plug 'https://github.com/neoclide/coc.nvim',Cond(!exists('g:vscode'),{'branch': 'release'})
" snippets
Plug 'https://github.com/honza/vim-snippets'

" highlight
" Plug 'https://github.com/windwp/nvim-autopairs'

call plug#end()


if !has('unix')
" sqlite.lua
let g:sqlite_clib_path="D:/local/lib/sqlite/sqlite3.dll"
endif
" 

" ===
" === vim-go
" ===
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" ===
" === end vim-go
" ===


if !exists('g:vscode')
" ===
" === vim-tmux-navigator
" ===
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" ===
" === end vim-tmux-navigator
" ===
endif



" ===
" === dashboard.vim
" ===
" let g:dashboard_default_executive ='telescope'
nmap <Leader><Leader>ss :<C-u>SaveSession<CR>
nmap <Leader><Leader>sl :<C-u>RestoreSession<CR>
" nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" let g:dashboard_session_directory = $HOME.'/.config/nvim/tmp/session'
" ===
" === end dashboard.vim
" ===


if !exists('g:vscode')
" ===
" === indent-blankline
" ===
lua<<EOF

--require("indent_blankline").setup {
--  -- for example, context is off by default, use this to turn it on
--  show_current_context = true,
--  show_current_context_start = true,
--  buftype_exclude = { "terminal" },
--  filetype_exclude = { "dashboard" },
--  }
--
EOF
endif

" ===
" === end indent-blankline
" ===


" ===
" === end nvim_context_vt
" ===


" ===
" === nvim-autopairs
" ===
lua<<EOF

EOF
" ===
" === end nvim-autopairs
" ===

" ===
" === Trouble
" ===
lua<<EOF

  -- require("trouble").setup {
  -- }

EOF

" ===
" === end Trouble
" ===




" ===
" === vim-subversive
" ===

" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)
" nmap <leader>s <plug>(SubversiveSubstituteRange)
" xmap <leader>s <plug>(SubversiveSubstituteRange)
" nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
" nmap <leader>mm :CocList maps<CR>



" ===
" === wildfile.vim
" ===

" nmap <leader>S <Plug>(wildfire-quick-select)


" ===
" === vim-sandwich
" ===
" using surround keymapings
" runtime macros/sandwich/keymap/surround.vim
" if you have not copied default recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
" add spaces inside bracket
let g:sandwich#recipes += [
      \   {'buns': ['"', '"'], 'quoteescape': 1, 'expand_range': 0, 'nesting': 0, 'linewise': 0},
      \   {'buns': ["'", "'"], 'quoteescape': 1, 'expand_range': 0, 'nesting': 0, 'linewise': 0},
      \   {'buns': ["`", "`"], 'quoteescape': 1, 'expand_range': 0, 'nesting': 0, 'linewise': 0},
      \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
      \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
      \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
      \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
      \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
      \ ]
  " auto
  silent! omap <unique> ib <Plug>(textobj-sandwich-auto-i)
  silent! xmap <unique> ib <Plug>(textobj-sandwich-auto-i)
  silent! omap <unique> ab <Plug>(textobj-sandwich-auto-a)
  silent! xmap <unique> ab <Plug>(textobj-sandwich-auto-a)
  " query
  silent! omap <unique> is <Plug>(textobj-sandwich-query-i)
  silent! xmap <unique> is <Plug>(textobj-sandwich-query-i)
  silent! omap <unique> as <Plug>(textobj-sandwich-query-a)
  silent! xmap <unique> as <Plug>(textobj-sandwich-query-a)
" ===
" === end vim-sandwich
" ===

" if !exists('g:vscode')
if exists('g:dummy')
" ===
" === coc-git
" ===


" navigate chunks of current buffer
nmap [[g <Plug>(coc-git-prevchunk)
nmap ]]g <Plug>(coc-git-nextchunk)
call repeat#set("\<Plug>(coc-git-prevchunk)", v:count)
" call AddRepeatableMotion("[[g", "]]g", 1)
" debug call <SNR>116_Move(']]g')
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)


" ===
" === end coc-git
" ===

" ===
" === coc-explorer
" ===

nmap <leader>E :CocCommand explorer
      \ --toggle
      \ --sources=buffer+,file+
      \ --width=30
      \<CR>
"" if only one buffer is shown and it's name is not 'coc-explorer', then show coc-explorer
" autocmd BufEnter * if (winnr("$") == 1 && &filetype != 'coc-explorer') | exe ':CocCommand explorer --width=30 --no-focus' | endif
"" if only one buffer named 'coc-explorer' is shown, then exit
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" ===
" === coc
" ===

let g:coc_global_extensions = [
      \'coc-json',
      \'coc-git',
      \'coc-diagnostic',
      \'coc-yank',
      \'coc-yaml',
      \'coc-explorer',
      \'coc-vimlsp',
      \'coc-tabnine',
      \ 'coc-snippets',
      \]



" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" disable coc warnig
let g:coc_disable_startup_warning = 1
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"



" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! IsLineEmpty(line)
    return match(a:line, "^\\s*$") != -1
endfu

function! s:check_space() abort
  let col = col('.') 
  let head_str =  getline('.')[:col - 1]
  echo head_str
  startinsert
  if IsLineEmpty(head_str) !=0
    if  IsLineEmpty(getline(line(".")-1)) ==1
      " echo  "empty line above"
      normal kdd0a
    else
      " echo "non-empty line above"
      normal kJa
    endif
  else
    normal kJa
  endif
endfunction



command CheckSpace call s:check_space()
imap <c-u> <esc>:CheckSpace<CR>
" Use <A-,> to trigger completion.
inoremap <silent><expr> <A-,> coc#refresh()
inoremap <a-p> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>




" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nn <silent> L :call CocActionAsync('doHover')<cr>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

set termguicolors

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<C-f>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Fzf exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

nnoremap <silent> <space>W  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>



" loading the plugin
let g:webdevicons_enable = 1

" ===
" === coc-yank
" ===
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" ===
" === coc-vimlsp
" ===
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]



" ===
" === coc-snippets
" ===
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<a-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

map <leader>ss :CocList snippets<CR>
" ===
" === end coc-snippets
" ===
endif


" ===
" === UltiSnips
" ===

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"


" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                end UltiSnips                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




" let g:VM_mouse_mappings = 1
"
" nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
" nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)

" neadtree settings
"autocmd vimenter * NERDTree
"noremap <leader>n  :NERDTreeToggle<cr>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ===
" === vim-easy-align
" ===

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" nmap <leader>cc <Plug>(NERDCommenterToggle)
" " Create default mappings
" let g:NERDCreateDefaultMappings = 1
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" let g:NERDToggleCheckAllLines = 1
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }


" ===
" === material
" ===
lua<<EOF

require('material').setup({
  custom_highlights = {
    NvimTreeFolderIcon = { fg = 'LightBlue' },
    NvimTreeGitNew = { fg = 'cyan' },
    NvimTreeGitDirty = { fg = 'red' },
    NvimTreeGitStaged = { guifg = 'LightGreen' }
  }
})

EOF

" ===
" === end material
" ===
" crscheme murphy        " 修改配色
" color deus
" colorscheme OceanicNext
" let g:material_style = 'palenight'
" colorscheme material
" colorscheme dracula


" ===
" === asynctasks
" ===
let g:asyncrun_open = 6

" noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>

noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>

" ===
" === suda.vim
" ===
" let g:suda_smart_edit = 1


if !exists('g:vscode')
" ===
" === nvim-treesitter
" ===
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
endif


" ===
" === end ccls
" ===
if has('win32')
  autocmd InsertLeave * :silent :!D:\\local\\bin\\im-select.exe 1033
  autocmd InsertEnter * :silent :!D:\\local\\bin\\im-select.exe 2052
endif
if has('unix')
  autocmd InsertLeave * :silent :!fcitx-remote -s fcitx-keyboard-us
  autocmd InsertEnter * :silent :!fcitx-remote -s sogoupinyin
endif 


" ===
" === vim-asterisk
" ===
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" ===
" === end vim-asterisk
" ===



" ===
" === neoformat
" ===

" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_html_htmlbeautify = {
            \ 'exe': 'html-beautify',
            \ 'args': ['-'],
            \ 'stdin': 1 
            \ }
let g:neoformat_enabled_html = ['htmlbeautify']
let g:neoformat_javascript_jsbeautify = {
            \ 'exe': 'js-beautify',
            \ 'args': ['-'],
            \ 'stdin': 1 
            \ }
let g:neoformat_enabled_javascript = ['jsbeautify']
" ===
" === end neoformat
" ===


" e ++enc=<encoding> reopen current buffer with <encoding>

" ===
" === cusom functions and commands
" ===
" active profile to detect performance issues
function Profile(log_file)
  execute ":profile start " . a:log_file
  profile file *
  profile func *
endfunction
command  -nargs=1 ActiveProfile call Profile(<f-args>)

map qw ysiw{
" map <leader>d I& <esc>j0
map <leader>sw :set wrap!<cr>
inoremap <a-o> <Esc>/[)}"'\]>`]<CR>:nohl<CR>a
inoremap <a-i> <Esc>?[({"'\[<`]<CR>:nohl<CR>a

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader><leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader><leader>e :call ToggleList("Quickfix List", 'c')<CR>


lua<<EOF
require 'yancy.core'
EOF

if exists('g:vscode')
  source vscode.vim
end
xmap <c-d> "ayp
" ===
" === end cusom functions and commands
" ===
