-- Set options
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 5
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = "\""
vim.opt.encoding = "UTF-8"
vim.opt.completeopt:remove("preview") -- Adjusting based on existing settings

-- Hide the GUI cursor when typing
vim.opt.guicursor = ""

-- Enable line numbers and relative line numbers for easier navigation
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tab and indentation settings for consistency across various editors and environments
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 -- See 'tabstop' when inserting tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.expandtab = true -- Convert tabs to spaces

-- Automatically indent new lines so they start at the same position as the line just typed
vim.opt.smartindent = true

-- Disable text wrapping
vim.opt.wrap = false

-- Disable creating swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Set the directory for undo files and enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Highlighting and searching options
vim.opt.hlsearch = false -- Do not highlight all search matches
vim.opt.incsearch = true -- Show incremental search matches

-- Enable 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Set the number of lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- Always show the sign column to avoid text shifting when signs (like git changes) are displayed
vim.opt.signcolumn = "yes"

-- Ensure certain characters are treated as part of a file name
vim.opt.isfname:append("@-@")

-- Reduce the time it takes for NeoVim to respond to certain events (like showing completions)
vim.opt.updatetime = 50

-- Display a vertical line at the 80th character for guiding code formatting
vim.opt.colorcolumn = "80"

-- Set the shell to cmd.exe, useful in Windows environments
vim.opt.shell = 'cmd.exe'

