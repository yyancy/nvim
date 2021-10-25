" ===
" === yancy vim configuration
" ===


" ===
" === common configuration
" ===

let mapleader=" "
" let g:VM_leader="\\\\"
set nocompatible
syntax on                 " 支持语法高亮显示
set number                " show line number.
set norelativenumber
" set cursorline " displays a line on the line where the cursor is 
filetype plugin indent on " 启用根据文件类型自动缩进
set mouse=a
set wrap
set showcmd
set ignorecase
set smartcase

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,gb18030,latin1

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
set shiftwidth=2          " 用于自动缩进的空格数
set tw=0
set backspace=2           " 在多数终端上修正退格键Backspace的行为
set foldlevel=99
set laststatus=2
" set autochdir

" restore cursor position which last was.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" set list
"set listchars=tab:▸\ ,trail:▫
set scrolloff=5

set clipboard=unnamed,unnamedplus
"set clipboard^=unnamed
"set clipboard^=autoselect

"set clipboard=unnamed,autoselect
 set guioptions+=a



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

vmap <C-c> y
vmap <C-v> p
imap <C-v> <esc>p`]a
map <S-C-v> p
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>


map <leader>T :edit $MYVIMRC<CR>
map <leader>Z :w<CR>:so $MYVIMRC<CR>

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





""""""""""""""""""""""""""""""""""""""""
"  plugins and relative configuration  "
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

"状态栏的例子
Plug 'https://github.com.cnpmjs.org/bling/vim-airline'
Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline-themes'
Plug 'https://gitee.com/winwood/vim-deus'
Plug 'https://github.com.cnpmjs.org/pechorin/any-jump.vim'
Plug 'https://github.com.cnpmjs.org/skywind3000/asynctasks.vim'
Plug 'https://github.com.cnpmjs.org/skywind3000/asyncrun.vim'
Plug 'https://github.com.cnpmjs.org/christoomey/vim-tmux-navigator'
Plug 'https://github.com.cnpmjs.org/easymotion/vim-easymotion'
" Plug 'https://github.com.cnpmjs.org/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

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
Plug 'https://github.com.cnpmjs.org/junegunn/vim-easy-align'
"Plug 'mg979/vim-xtabline'
Plug 'https://github.com.cnpmjs.org/gcmt/wildfire.vim'
Plug 'https://github.com.cnpmjs.org/wellle/targets.vim'

" highlight
Plug 'https://github.com.cnpmjs.org/RRethy/vim-illuminate'

Plug 'https://gitee.com/yyancyer/vim-devicons'
Plug 'https://github.com.cnpmjs.org/tpope/vim-surround'
Plug 'https://github.com.cnpmjs.org/iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'https://github.com.cnpmjs.org/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com.cnpmjs.org/junegunn/fzf.vim'
Plug 'https://github.com.cnpmjs.org/liuchengxu/vista.vim'
Plug 'https://github.com.cnpmjs.org/svermeulen/vim-subversive'
Plug 'https://github.com.cnpmjs.org/lambdalisue/suda.vim'
call plug#end()

" ===
" === vim-subversive
" ===

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" ===
" === fzf.vim
" ===

noremap <leader><C-n> :Files<cr>
noremap <C-N> :Files<cr>
noremap <M-a> :Files<cr>
noremap <M-A> :Files<cr>

" ===
" === wildfile.vim
" ===

nmap <leader>S <Plug>(wildfire-quick-select)


" ===
" === coc-explorer
" ===

nmap <leader>E :CocCommand explorer
    \ --toggle
    \ --sources=buffer+,file+
    \<CR>

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
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
" if has('nvim')
  inoremap <silent><expr> <A-,> coc#refresh()
" else
  " inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
autocmd CursorHold * silent call CocActionAsync('highlight')

" set termguicolors

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

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
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
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

nmap <leader>cc <Plug>(NERDCommenterToggle)
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1 
let g:NERDToggleCheckAllLines = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
" disable coc warnig
let g:coc_disable_startup_warning = 1



" ===
" === airline 
" ===


let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'



" crscheme murphy        " 修改配色
color deus




" ===
" === auto-pairs
" ===
let g:AutoPairsFlyMode = 1





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

noremap <silent><f5> :AsyncTask file-run<cr>
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
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
 " ensure_installed = {"python","c"},     -- one of "all", "language", or a list of languages
  "highlight = {
   " enable = true,              -- false will disable the whole extension
    "disable = {  "rust" },  -- list of language that will be disabled
 " },
"}
"EOF

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
