
local set = vim.opt

vim.g.mapleader = " "

set.number = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = false

set.wrap = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
set.undofile = true

set.hlsearch = true
set.incsearch = true

set.scrolloff = 8
set.signcolumn = "auto"


set.listchars ={
	tab='▷ ',
	multispace='·',
	trail='·',
	extends='◣',
	precedes='◢',
	nbsp='○'
	--eol=''
}

set.list = true
--print(vim.inspect(vim.opt.listchars:get()))

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })

vim.api.nvim_create_autocmd(
	{ "WinEnter", "BufEnter", "BufWinEnter" },
	{ 
		pattern = {"*"},
		command = "set cursorline",
		group = cursorGrp
	}
)

vim.api.nvim_create_autocmd(
	{ "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)

vim.api.nvim_create_autocmd(
	{ "WinEnter", "BufEnter", "BufWinEnter" },
	{ 
		pattern = {"*.c", "*.h", "*.cpp", "*.lua", "*.py"},
		command = "set colorcolumn=80",
		group = cursorGrp
	}
)

vim.api.nvim_create_autocmd(
	{ "WinEnter", "BufEnter", "BufWinEnter" },
	{ 
		pattern = {"*.txt", "*.patch", "*.log", "*.csv"},
		command = "set colorcolumn=",
		group = cursorGrp
	}
)

-- Highlight tabs
local tabsGrp = vim.api.nvim_create_augroup("TabG", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "WinEnter"}, {
	pattern = {"*.c", "*.h"},
	command = "match ColorColumn /\t/",
	group = tabsGrp-- Or myvimfun
})

set.updatetime=50

-- Proper search
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.gdefault = true

-- Limit the lsp suggestions
set.pumheight = 10

-- Decent wildmenu
set.wildmenu = true
set.wildmode = "longest:full"
set.wildignorecase = true
set.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"

