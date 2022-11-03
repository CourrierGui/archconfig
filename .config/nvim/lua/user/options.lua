-- cscope
vim.opt.cscopequickfix = "s-,c-,d-,i-,t-,e-,a-"
vim.opt.csto = 1
vim.opt.cscopetag = true

-- search for local config files at startup
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.colorcolumn = "91"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ttimeoutlen = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true

-- See substitution as you type them
vim.opt.inccommand=split

-- Tab to spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- File fuzzy finding
vim.opt.path:append("**")
vim.opt.wildignore:append("**/build/**")

-- See matching character
vim.opt.showmatch = true

-- Better indentation
vim.opt.smartindent = true
vim.opt.cindent = true
-- Better C++ indentation of lambda function
vim.opt.cino = "j1,(0,ws,Ws"

-- Display trailing whitespace and tabs
vim.opt.list = true
vim.opt.listchars = "tab:| ,trail:·"

-- french and english spelling
vim.opt.spelllang = "en,fr"
vim.opt.tags:append("/")

vim.g.vimsyn_embed = 'l'
