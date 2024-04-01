-- Set the leader key to space
vim.g.mapleader = " "

-- Normal mode mapping to open command-line window with <leader>pv
-- 'project files'
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Visual mode mappings for moving blocks of text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Normal mode mapping to join lines without spaces
vim.keymap.set("n", "J", "mzJ`z")

-- Center screen after page down/up in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Start and stop "Vim With Me" sessions with <leader>vwm and <leader>svwm
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- Remap for paste in visual mode to paste and delete the original text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to clipboard in normal and visual mode with <leader>y and <leader>Y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without yanking with <leader>d in normal and visual mode
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Map Ctrl+c to escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable the Q command in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Normal mode mapping to open tmux sessionizer with <C-f>
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format the current buffer using LSP with <leader>f
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigation through quickfix and location lists
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Substitute word under cursor with <leader>s
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable with <leader>x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open Packer configuration with <leader>vpp
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/abenteuerzeit/packer.lua<CR>");

-- Trigger a custom command with <leader>mr
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Reload the current configuration with <leader><leader>
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Reveal bars and starts in help
vim.api.nvim_set_keymap('n', '<Leader>h', [[:set conceallevel=0<CR>:hi link HelpBar Normal<CR>:hi link HelpStar Normal<CR>]], { noremap = true, silent = true })

-- Additional NERDTree mappings for focusing, opening, and toggling
vim.keymap.set("n", "<C-F>", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-N>", ":NERDTree<CR>")
vim.keymap.set("n", "<C-T>", ":NERDTreeToggle<CR>")

-- Additional mappings
vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>") -- Toggle Tagbar with F8
vim.keymap.set("n", "<C-l>", ":call CocActionAsync('jumpDefinition')<CR>") -- Go to definition with <C-l>

local conceal_level_enabled = true

function Toggle_conceal_level_and_highlight()
    if conceal_level_enabled then
        vim.o.conceallevel = 0
        -- Set the highlight for bars and stars to Normal to make them visible
        vim.cmd('hi link HelpBar Normal')
        vim.cmd('hi link HelpStar Normal')
        conceal_level_enabled = false
    else
        vim.o.conceallevel = 2
        -- Re-link bars and stars to Ignore (or a similar group) to hide them again
        -- Assuming HelpBar and HelpStar are your custom groups for bars and stars
        vim.cmd('hi link HelpBar Ignore')
        vim.cmd('hi link HelpStar Ignore')
        conceal_level_enabled = true
    end
end

vim.api.nvim_set_keymap('n', '<leader>h', ':lua Toggle_conceal_level_and_highlight()<CR>', { noremap = true, silent = true })
