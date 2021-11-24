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



" set ttimeoutlen=0
" set notimeout
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set visualbell
" set lazyredraw "same as above

" restore cursor position which last was.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif

" set list
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set sidescroll=10

" set backupdir

set clipboard=unnamed,unnamedplus
"set clipboard^=unnamed
"set clipboard^=autoselect

"set clipboard=unnamed,autoselect
set guioptions+=a
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set colorcolumn=100
set updatetime=2000
set virtualedit=block



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

autocmd BufNewFile *.txt set ft=confluencewiki
autocmd BufEnter *.txt set ft=confluencewiki




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
vmap <C-c> y
vmap <C-v> p
imap <C-v> <esc>p`]a
map <S-C-v> p
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<leader>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<leader>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <leader>, A,<esc>
nnoremap <leader>; A;<esc>

map <leader>T :edit $MYVIMRC<CR>
map <leader>Z :w<CR>:so $MYVIMRC<CR>
nmap 0 _
map <F12> :Vista finder<CR>

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

map <up> :res +5<CR>
map <down> :res -5<CR>
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
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv
inoremap <C-T> <C-F>
noremap 0 _
noremap <leader>tx :r !figlet



""""""""""""""""""""""""""""""""""""""""
"  plugins and relative configuration  "
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

"状态栏的例子
Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://gitee.com/winwood/vim-deus'
Plug 'https://github.com/pechorin/any-jump.vim'
Plug 'https://github.com/skywind3000/asynctasks.vim'
Plug 'https://github.com/skywind3000/asyncrun.vim'
Plug 'https://github.com/christoomey/vim-tmux-navigator'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'https://github.com/abecodes/tabout.nvim'
Plug 'https://github.com/windwp/nvim-ts-autotag'
" Plug 'https://github.com/ggandor/lightspeed.nvim'
Plug 'https://github.com/andymass/vim-matchup'
Plug 'https://github.com/pseewald/vim-anyfold'
Plug 'https://github.com/airblade/vim-rooter'
" Plug 'https://github.com/rhysd/clever-f.vim'
" search
Plug 'https://github.com/Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" bookmarks
Plug 'https://github.com/MattesGroeger/vim-bookmarks'
Plug 'https://github.com/phaazon/hop.nvim'
" Plug 'https://github.com/instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'https://github.com/qpkorr/vim-bufkill'

Plug 'https://github.com/tversteeg/registers.nvim' , { 'branch': 'main' }
Plug 'https://github.com/akinsho/bufferline.nvim'

Plug 'https://github.com/wellle/context.vim'
" Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim'
"Plug 'https://gitee.com/zimingzpp/nerdtree'
Plug 'https://gitee.com/yyancyer/coc.nvim', {'branch': 'release'}
Plug 'https://gitee.com/yyancyer/ultisnips'
Plug 'https://gitee.com/zgpio/vim-snippets'
Plug 'https://gitee.com/yyancyer/vim-visual-multi'
" Plug 'https://gitee.com/yyancyer/vim-floaterm'
" Plug 'https://gitee.com/yyancyer/auto-pairs'
Plug 'https://gitee.com/yyancyer/vim-terminal-help'
" Plug 'https://gitee.com/yyancyer/nerdcommenter'
Plug 'https://gitee.com/yyancyer/vim-autoformat'
Plug 'https://gitee.com/yyancyer/SimpylFold'
Plug 'https://github.com/junegunn/vim-easy-align'
"Plug 'mg979/vim-xtabline'
Plug 'https://github.com/gcmt/wildfire.vim'
Plug 'https://github.com/wellle/targets.vim'
" Plug 'https://github.com/puremourning/vimspector'
Plug 'https://github.com/haya14busa/vim-asterisk'
" Plug 'https://github.com/mfussenegger/nvim-dap'
" Plug 'https://github.com/mfussenegger/nvim-dap-python'
" highlight
Plug 'https://github.com/RRethy/vim-illuminate'
Plug 'https://github.com/Pocco81/AbbrevMan.nvim'
Plug 'https://github.com/windwp/nvim-autopairs'
" formating
Plug 'https://github.com/sbdchd/neoformat'

Plug 'https://github.com/mhartington/oceanic-next'
Plug 'https://github.com/gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/numToStr/Comment.nvim'
Plug 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring'
" html
Plug 'https://github.com/shime/vim-livedown'
Plug 'https://github.com/turbio/bracey.vim'
" markdown
Plug 'https://github.com/iamcco/markdown-preview.nvim',{ 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'https://github.com/dhruvasagar/vim-table-mode'
Plug 'https://github.com/ceigh/AutoSave.nvim' , {'branch': 'execution_message-fn'}
Plug 'https://gitee.com/yyancyer/vim-devicons'
" Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/machakann/vim-sandwich'
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/liuchengxu/vista.vim'
Plug 'https://github.com/svermeulen/vim-subversive'
Plug 'https://github.com/lambdalisue/suda.vim'
Plug 'https://github.com/haringsrob/nvim_context_vt'
Plug 'https://github.com/rmagatti/auto-session'
Plug 'https://github.com/akinsho/toggleterm.nvim'

Plug 'https://github.com/AndrewRadev/splitjoin.vim'
Plug 'https://github.com/chaoren/vim-wordmotion' 
Plug 'https://github.com/winston0410/cmd-parser.nvim'
Plug 'https://github.com/winston0410/range-highlight.nvim'

Plug 'https://github.com/tpope/vim-repeat'
" Plug 'https://github.com/glepnir/dashboard-nvim'

call plug#end()


" ===
" === auto-session
" ===
lua<<EOF
require('auto-session').setup {
      log_level = 'info',
      auto_session_root_dir = vim.fn.stdpath('config').."/tmp/session/",
      auto_session_suppress_dirs = {'~/', '~/Projects'}
    }

EOF

" ===
" === end auto-session
" ===

" ===
" === dashboard
" ===
" let g:dashboard_default_executive ='fzf'
" " let dashboard_session_directory='$HOME/.config/nvim/tmp/session'
" nmap <Leader>ss :<C-u>SessionSave<CR>
" nmap <Leader>sl :<C-u>SessionLoad<CR>
" nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
" nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
" nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
" nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
" ===
" === end dashboard
" ===

" ===
" === indent-blankline
" ===
lua<<EOF

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

EOF

" ===
" === end indent-blankline
" ===

" ===
" === toggleterm
" ===
lua<<EOF
require("toggleterm").setup{
   open_mapping = [[<c-\>]],
  close_on_exit =  false
}
EOF

" ===
" === end toggleterm
" ===

" ===
" === nvim_context_vt
" ===
lua<<EOF
require('nvim_context_vt').setup {}
EOF

" ===
" === end nvim_context_vt
" ===

" ===
" === autosave
" ===
lua<<EOF
require("autosave").setup{
  enabled = true,
  execution_message = function()
    return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")
  end,
  clean_command_line_interval = 500,
  debounce_delay = 500
}
EOF

" ===
" === end autosave
" ===

" ===
" === vim-matchup
" ===
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" ===
" === end vim-matchup
" ===

" ===
" === nvim-autopairs
" ===
lua<<EOF
require('nvim-autopairs').setup{}
EOF

" ===
" === end nvim-autopairs
" ===

" ===
" === tabout
" ===
lua<<EOF
require('tabout').setup {
  tabkey = '<C-o>', -- key to trigger tabout, set to an empty string to disable
  backwards_tabkey = '<A-o>', -- key to trigger backwards tabout, set to an empty string to disable
  act_as_tab = true, -- shift content if tab out is not possible
  act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
enable_backwards = true, -- well ...
completion = true, -- if the tabkey is used in a completion pum
tabouts = {
  {open = "'", close = "'"},
  {open = '"', close = '"'},
  {open = '`', close = '`'},
  {open = '(', close = ')'},
  {open = '[', close = ']'},
  {open = '{', close = '}'}
  },
ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
exclude = {} -- tabout will ignore these filetypes
}
EOF

" ===
" === end tabout
" ===


" ===
" === vim-subversive
" ===

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
" ===
" === fzf.vim
" ===

noremap <leader><C-n> :Files<cr>
nmap <C-E> :Buffers<cr>
" imap <leader><tab> <plug>(fzf-maps-i)
" ===
" === wildfile.vim
" ===

nmap <leader>S <Plug>(wildfire-quick-select)


" ===
" === vim-sandwich
" ===
" using surround keymapings
runtime macros/sandwich/keymap/surround.vim
" if you have not copied default recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" add spaces inside bracket
let g:sandwich#recipes += [
      \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
      \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
      \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
      \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
      \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
      \ ]
" ===
" === end vim-sandwich
" ===

" ===
" === coc-git
" ===

" navigate chunks of current buffer
nmap [[g <Plug>(coc-git-prevchunk)<Plug>(coc-git-prevchunk)<Plug>(coc-git-prevchunk)
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
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <A-,> to trigger completion.
inoremap <silent><expr> <A-,> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nn <silent> L :call CocActionAsync('doHover')<cr>
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

" set termguicolors

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
nmap <leader>qf  <Plug>(coc-fix-current)

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
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
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

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"


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
" === UltiSnips
" ===

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                end UltiSnips                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




let g:VM_mouse_mappings = 1

nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)

" neadtree settings
"autocmd vimenter * NERDTree
"noremap <leader>n  :NERDTreeToggle<cr>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ===
" === vim-easy-align
" ===

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" nmap <leader>cc <Plug>(NERDCommenterToggle)
" " Create default mappings
" let g:NERDCreateDefaultMappings = 1
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" let g:NERDToggleCheckAllLines = 1
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }



" ===
" === airline
" ===


let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='luna'
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])


" crscheme murphy        " 修改配色
" color deus
colorscheme OceanicNext




" ===
" === auto-pairs
" ===
" let g:AutoPairsFlyMode = 1





" ===
" === autoformat
" ===

noremap <F3> :Autoformat<CR>

" ===
" === vista
" ===

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()



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
let g:suda_smart_edit = 1

" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"python","c","html","javascript","css","json" },     -- one of "all", "language", or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
disable = {  "rust" },  -- list of language that will be disabled
},
  matchup = {
  enable = true
  },
context_commentstring = {
enable = true,
    enable_autocmd = false
    }
  }
require 'nvim-treesitter.install'.compilers = { "clang" }
EOF

" ===
" === vim-illuminate
" ===
" augroup illuminate_augroup
" autocmd!
" autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
" augroup END



" ===
" === vim-easymotion
" ===
" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-wl)
map  <Leader><Leader>f <Plug>(easymotion-sl)
" JK motions: Line motions
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" ===
" === ccls
" ===
" bases
" nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" " bases of up to 3 levels
" nn <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" " derived
" nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" " derived of up to 3 levels
" nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" " caller
" nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" " callee
" nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" " $ccls/member
" " member variables / variables in a namespace
" nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" " member functions / functions in a namespace
" nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" " nested classes / types in a namespace
" nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

" nmap <silent> xt <Plug>(coc-type-definition)<cr>
" nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
" nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

" nn xx x

" ===
" === end ccls
" ===



" ===
" === LeaderF
" ===
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0,'Buffer':1 ,'File':1}
let g:Lf_PopupPreviewPosition = 'bottom'

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fu :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" ===
" === end LeaderF
" ===


" ===
" === vim-anyfold
" ===
" activate anyfold by default
augroup anyfold
  autocmd!
  autocmd Filetype * AnyFoldActivate
augroup END

" disable anyfold for large files
let g:LargeFile = 1000000 " file is large if size greater than 1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
function LargeFile()
  augroup anyfold
    autocmd! 
    autocmd Filetype * setlocal foldmethod=indent " fall back to indent folding
  augroup END
  execute ":ContextDisable"
endfunction
" ===
" === end vim-anyfold
" ===


" let g:clever_f_mark_direct = 1



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
" === context.vim
" ===
let g:context_add_mappings = 0
let g:context_nvim_no_redraw = 1

let g:context_max_filesize = 2000000
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:context_max_filesize || f == -2 | execute ":ContextDisable" | endif
" ===
" === end context.vim
" ===

" ===
" === hop
" ===
lua<<EOF
require'hop'.setup()
-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>",{})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_words({  current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1()<cr>",{})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('', '<leader>l', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>", {})
EOF
onoremap f v:HopChar1<CR>
" ===
" === end hop
" ===



" ===
" === dap
" ===

" mappings
" nnoremap <C-S-F12> :lua require'dap'.continue()<cr>

" map <silent> <F5> :lua require'dap'.continue()<CR>
" map <silent> <F10> :lua require'dap'.step_over()<CR>
" map <silent> <F11> :lua require'dap'.step_into()<CR>
" map <silent> <F12> :lua require'dap'.step_out()<CR>
" map <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" map <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" map <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" map <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" map <silent> <leader>dl :lua require'dap'.run_last()<CR>

" lua require('dap-python').setup('~/.venv/bin/python')
" lua<<EOF
" local dap = require 'dap'
" local repl = require 'dap.repl'
" repl.commands = vim.tbl_extend('force', repl.commands, {
" -- Add a new alias for the existing .exit command
" exit = {'exit', '.exit', '.bye'},
" -- Add your own commands; run `.echo hello world` to invoke
" -- this function with the text "hello world"
" custom_commands = {
" ['.echo'] = function(text)
" dap.repl.append(text)
" end,
" -- Hook up a new command to an existing dap function
" ['.restart'] = dap.restart,
" },
" })
" EOF

" ===
" === end dap
" ===

" ===
" === vimspector
" ===
" map <C-S-F12> <Plug>VimspectorContinue
" let g:vimspector_enable_mappings = 'HUMAN'
" " for normal mode - the word under the cursor
" nmap <Leader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
" xmap <Leader>di <Plug>VimspectorBalloonEval
" ===
" === end vimspector
" ===


" ===
" === indentLine
" ===
" let g:indentLine_concealcursor = 'nc'

" ===
" === end indentLine
" ===

" ===
" === abbrevMan
" ===
lua << EOF
local abbrev_man = require("abbrev-man")

abbrev_man.setup({
load_natural_dictionaries_at_startup = true,
load_programming_dictionaries_at_startup = true,
natural_dictionaries = {
  ["nt_en"] = {
    }
  },
programming_dictionaries = {
  ["pr_py"] = {}
  }
})
EOF

" ===
" === end abbrevMan
" ===

" ===
" === vim-bufkill
" ===
map <C-F4> :BD<CR>
nnoremap <leader>bd :BD<CR>

" ===
" === end vim-bufkill
" ===


" ===
" === instant-markdown
" ===
let g:instant_markdown_slow = 1

" ===
" === end instant-markdown
" ===


" ===
" === nvim-ts-autotag
" ===
lua<<EOF
require('nvim-ts-autotag').setup()
EOF

" ===
" === end nvim-ts-autotag
" ===

" ===
" === bufferline
" ===
set termguicolors
lua<<EOF
require("bufferline").setup{
  options = {
    numbers = function(opts)
      return string.format('%s.', opts.ordinal)
    end,
    diagnostics = 'coc',
    offsets = {
    {
        filetype = 'coc-explorer',
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"

    }
    }
  }
}
EOF
map <silent> <leader>gb :BufferLinePick<CR>

nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>]b :BufferLineCyclePrev<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" ===
" === end bufferline
" ===


" ===
" === wilder.nvim
" ===
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': ['rg', '--files'],
      \       'dir_command': ['fzf', '.', '-type', 'd', '-printf', '%P\n'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
        \   ' ', wilder#popupmenu_devicons(),
        \ ],
        \ 'right': [
          \   ' ', wilder#popupmenu_scrollbar(),
          \ ],
          \ }))
" ===
" === end wilder.nvim
" ===

" ===
" === comment.vim
" ===
lua << EOF
require('Comment').setup {
  pre_hook = function(ctx)
  local U = require 'Comment.utils'

  local location = nil
  if ctx.ctype == U.ctype.block then
    location = require('ts_context_commentstring.utils').get_cursor_location()
  elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
    location = require('ts_context_commentstring.utils').get_visual_start_location()
  end

  return require('ts_context_commentstring.internal').calculate_commentstring {
    key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
    location = location,
    }
end,
}
EOF

" ===
" === end comment.vim
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

" ===
" === end cusom functions and commands
" ===

