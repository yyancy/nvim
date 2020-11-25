



" 将先导键映射为空格键
let mapleader=" "
" let g:VM_leader="\\\\"






" personal configuration
set nocompatible
syntax on                 " 支持语法高亮显示
set number                " show line number.
set norelativenumber
set cursorline " displays a line on the line where the cursor is 
filetype plugin indent on " 启用根据文件类型自动缩进
set mouse=a
set wrap
set showcmd

set encoding=utf-8
" modify cursor pattern.
let &t_ut=''
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
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

set hlsearch
exec "nohlsearch"
set incsearch
set smartcase

set autoindent            " 开始新行时处理缩进
set expandtab             " 将制表符Tab展开为空格，这对于Python尤其有用
set tabstop=2             " 要计算的空格数
set shiftwidth=2          " 用于自动缩进的空格数
set tw=0
set backspace=2           " 在多数终端上修正退格键Backspace的行为
set foldlevel=99
set laststatus=2
set autochdir

" restore cursor position which last was.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set wildmenu                      " 启用增强的Tab自动补全
set wildmode=list:longest,full    " 补全为允许的最长字符串，然后打开wildmenu

" set list
"set listchars=tab:▸\ ,trail:▫
set scrolloff=5


" mappings 


vmap <C-c> y
vmap <C-v> p
imap <C-v> <esc>p`]a
map <S-C-v> p
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"set clipboard=unnamed,unnamedplus
set clipboard^=unnamed
"set clipboard^=autoselect

"set clipboard=unnamed,autoselect
 set guioptions+=a

map T :edit $MYVIMRC<CR>
map Z :w<CR>:so $MYVIMRC<CR>


" 使用<Ctrl> + hjkl快速在窗口间跳转
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tu :tabe<CR>
map tp :-tabnext<CR>
map tn :+tabnext<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" 在插入模式下加入一对引号或括号
""inoremap ' ''<esc>i
""inoremap " ""<esc>i
""inoremap ( ()<esc>i
""inoremap { {}<esc>i
""inoremap [ []<esc>i
noremap <LEADER><CR> :nohlsearch<CR>

noremap <leader>q :q<cr>
noremap <leader><C-q> :q!<cr>
noremap <leader>w :w<cr>
noremap <leader>x :x<cr>
" Opening a terminal window
"noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res -5<CR>:term<CR>


autocmd BufNewFile *.txt set ft=confluencewiki
autocmd BufEnter *.txt set ft=confluencewiki



""""""""""""""""""""""""""""""""""""""""
"  plugins and relative configuration  "
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/nvim/plugged')

"状态栏的例子
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://gitee.com/winwood/vim-deus'

"Plug 'https://gitee.com/zimingzpp/nerdtree'
Plug 'https://gitee.com/yyancyer/coc.nvim', {'branch': 'release'}
Plug 'https://gitee.com/yyancyer/ultisnips'
Plug 'https://gitee.com/zgpio/vim-snippets'
Plug 'https://gitee.com/yyancyer/vim-visual-multi'
" Plug 'https://gitee.com/yyancyer/vim-floaterm'
Plug 'https://gitee.com/yyancyer/auto-pairs'
Plug 'https://gitee.com/yyancyer/vim-terminal-help'
Plug 'https://gitee.com/yyancyer/nerdcommenter'
Plug 'https://gitee.com/yyancyer/vim-autoformat'
Plug 'https://gitee.com/yyancyer/SimpylFold'
Plug 'junegunn/vim-easy-align'
"Plug 'mg979/vim-xtabline'
Plug 'https://github.com/gcmt/wildfire.vim.git'

Plug 'https://gitee.com/yyancyer/vim-devicons'
Plug 'https://github.com/tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


call plug#end()

nmap <leader>e :CocCommand explorer
    \ --toggle
    \ --sources=buffer+,file+
    \ --open-action-strategy tab
    \<CR>



" loading the plugin
let g:webdevicons_enable = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             UltiSnips                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



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
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)


" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

map <C-/> <Plug>NERDCommenterToggle
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" disable coc warnig
let g:coc_disable_startup_warning = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'



colorscheme murphy        " 修改配色
color deus











" autoformat configuration
noremap <F3> :Autoformat<CR>

