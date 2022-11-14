local global = require("yancy.core.global")

local function load_options() end
local global_local = {
	termguicolors = true,
	encoding = "utf-8",
	syntax = true,
	fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1",
	number = true,
	relativenumber = true,
	hidden = true,
	viewoptions = "folds,cursor,curdir,slash,unix",
	-- sessionoptions = "curdir,help,tabpages,winsize",
	wildignorecase = true,
	wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",

	history = 2000,
	backup = false,
	writebackup = false,
	swapfile = false,
	undofile = true,
	formatoptions = "1jcroql",
	undodir = global.cache_dir .. "undo/",
	backupdir = global.cache_dir .. "backup/",
	directory = global.cache_dir .. "backup/",
	backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
	virtualedit = "block",
	visualbell = true,
	cursorline = true, -- displays a line on the line where the cursor is,
	mouse = "a",
	wrap = true,
	showcmd = true,
	ignorecase = true,
	infercase = true,
	complete = ".,w,b,k",
	smartcase = true,
	conceallevel = 0,
	concealcursor = "niv",
	path = ".,**",
	wildmenu = true,
	wildmode = "longest:list,full",
	inccommand = "split",
	display = "lastline",
	breakat = [[\ \	;:,!?]],
	showbreak = "↳  ",
	backspace = "indent,eol,start",
	listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
	grepformat = "%f:%l:%c:%m",
	grepprg = "rg --hidden --vimgrep --smart-case --",
	switchbuf = "useopen",
	diffopt = "filler,iwhite,internal,algorithm:patience",
	completeopt = "menuone,noselect",
	jumpoptions = "stack",
	shortmess = "aoOTIcF",
	title = true,
	autoindent = true, -- 开始新行时处理缩进
	expandtab = true,
	breakindentopt = "shift:2,min:20",
	linebreak = true,
	shiftround = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	tw = 0,
	foldlevel = 99,
	laststatus = 2,

	foldmethod = "indent",
	foldenable = true,
	signcolumn = "yes",
	timeoutlen = 500,
	ttimeoutlen = 0,

	pumheight = 15,
	helpheight = 12,
	previewheight = 12,
	hlsearch = true,
	incsearch = true,
	scrolloff = 5,
	sidescroll = 10,
	sidescrolloff = 5,

	autoread = true,
	autowrite = true,
}
for name, value in pairs(global_local) do
	vim.o[name] = value
end
load_options()
