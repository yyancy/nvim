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
filetype plugin indent on " 启用根据文件类型自动缩进
syntax on                 " 支持语法高亮显示
" set number                " show line number.
" set hidden
" set relativenumber
" set cursorline " displays a line on the line where the cursor is
" set mouse=a
" set wrap
" set showcmd
" set ignorecase
" set smartcase
" set encoding=utf-8
" set fileencodings=ucs-bom,utf-8,gbk,big5,gb18030,latin1
" set conceallevel=0

" set path=.,**
" set wildmenu
" set wildmode=longest:list,full
" set termguicolors
exec "nohlsearch"

" set autoindent            " 开始新行时处理缩进
" set expandtab             " 将制表符Tab展开为空格，这对于Python尤其有用
" set tabstop=2             " 要计算的空格数
" set softtabstop=2
set shiftwidth=2          " 用于自动缩进的空格数
" set tw=0
" set backspace=2           " 在多数终端上修正退格键Backspace的行为
" set foldlevel=99
" set laststatus=2

" disabled python.vim plugins set shiftwidth
let g:python_recommended_style = 0


" set autochdir



" set ttimeoutlen=300
" set timeoutlen=500
" set notimeout
" set inccommand=split
" set completeopt=longest,noinsert,menuone,noselect,preview
" set lazyredraw "same as above

" restore cursor position which last was.
" set list
" set list
" set scrolloff=5
" set sidescroll=10



" set backupdir

" set clipboard=unnamed,unnamedplus
set clipboard+=unnamedplus
set guioptions+=a
set isfname+=&
" set foldmethod=indent
" set foldenable
" set formatoptions-=tc
" set colorcolumn=100
" set updatetime=4000
" set virtualedit=block
" set viewoptions=folds,cursor

" set backupdir=$HOME/.config/nvim/tmp/backup,.
" set directory=$HOME/.config/nvim/tmp/backup,.

" set undofile

" set undodir=$HOME/.config/nvim/tmp/undo,.

" ===
" === autocmd
" ===

" autocmd CursorHold * normal! m'
" autocmd CursorHold * if line(".") != 1 | normal! m' | endif
" augroup remember_folds
"     autocmd!
"     au BufWinLeave,BufLeave ?* silent! mkview
"     au BufWinEnter          ?* silent! loadview
" augroup END

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
" au FocusLost,WinLeave * :silent! wa
" Trigger autoread when changing buffers or coming back to vim.
" au FocusGained,BufEnter * :silent! !

if !exists('g:vscode')
augroup insert_remap
  " autocmd FileType c,cpp,go,typescript,json,lua,vim nmap i i<C-t>
  " autocmd FileType c,cpp,go,typescript,json,lua,vim nmap a a<C-t>
augroup END
endif


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

inoremap <C-_> <C-o>u
inoremap <a-_> <C-o><C-r>

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
xmap <c-d> "ayp

if has('unix')
  let g:python3_host_prog="/usr/bin/python3"
  autocmd InsertLeave * :silent :!fcitx-remote -s fcitx-keyboard-us
  autocmd InsertEnter * :silent :!fcitx-remote -s sogoupinyin
endif
if has('win32')

let g:sqlite_clib_path="D:/local/lib/sqlite/sqlite3.dll"
  autocmd InsertLeave * :silent :!D:\\local\\bin\\im-select.exe 1033
  autocmd InsertEnter * :silent :!D:\\local\\bin\\im-select.exe 2052
endif

let g:vimsyn_embed = 'l'

" ===
" === dashboard.vim
" ===
nmap <Leader><Leader>ss :<C-u>SaveSession<CR>
nmap <Leader><Leader>sl :<C-u>RestoreSession<CR>

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

" if !exists('g:vscode')
if exists('g:dummy')
" ===
" === coc-git
" ===








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
endif

" ===
" === end ccls
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


function DRemoveLF()
  execute ":%s///g"
endfunction
command  -nargs=0 RemoveLF call DRemoveLF()


function DTransferGo()
  execute ":%s/native.Register/registry.register/g"
  execute ":%s://:# :g"
  execute ":%s/:=/=/g"
  execute ":%s/func/def/g"
  execute "%s/*rtda./:/g"
  execute "%s/ {/:/g"
  execute "%s/}//g"
endfunction
command -nargs=0 TransferGo call DTransferGo()



map qw ysiw{
" map <leader>d I& <esc>j0
map <leader>sw :set wrap!<cr>
map <leader>ss :set spell!<cr>
inoremap <a-o> <Esc>/[)}"'\]>`]<CR>:nohl<CR>a
inoremap <a-i> <Esc>?[({"'\[<`]<CR>:nohl<CR>a
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

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

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    " return match(a:line, "^\\s*$") != -1
    if match(getline('.'), "^\\s*$") != -1
      return "\"_ddko"
      " return "ko"
    else
        return "i"
    endif
endfunction
if !exists('g:vscode')
"  map <expr> i IndentWithI()
end
lua<<EOF
require 'yancy.core'
EOF

if exists('g:vscode')
  source $HOME/.config/nvim/vscode.vim
end
