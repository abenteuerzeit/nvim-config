# Neovim Configuration

This is a configuration for the Neovim text editor. It uses various plugins and custom settings to enhance the editing experience.

## Installation

1. Install the Neovim text editor.
2. Install the `packer.nvim` plugin manager by following the instructions [here](https://github.com/wbthomason/packer.nvim).
3. Clone or copy the configuration files to your Neovim configuration directory (usually `~/.config/nvim/` on Unix-like systems or `~/AppData/Local/nvim/` on Windows).

## Configuration Files

### `lua/abenteuerzeit/init.lua`

This file sets up the Abenteuerzeit module. It includes the following functionality:

- Requires the `set` and `remap` modules.
- Creates an autogroup for Abenteuerzeit-specific autocommands.
- Sets up a HighlightYank autogroup to highlight yanked text.
- Defines `R(name)`: Reloads the specified Lua module using `plenary.reload`.
- Removes trailing whitespace from files before writing them.
- Configures the Netrw file explorer.
- Sets the `$TMP` environment variable to /tmp (for Windows 11).
- Sets the shell option to cmd.exe (for Windows 11).
  
### `lua/abenteuerzeit/packer.lua`

This file sets up the `packer.nvim` plugin manager and specifies the plugins to be installed and configured. The following plugins are included:

- `wbthomason/packer.nvim` (for managing itself)
- `nvim-telescope/telescope.nvim` (with dependencies)
- `rose-pine/neovim` (with custom configuration)
- `folke/trouble.nvim`
- `nvim-treesitter/nvim-treesitter` (with additional plugins)
- `VonHeikemen/lsp-zero.nvim` (with dependencies)
- `folke/zen-mode.nvim`
- `github/copilot.vim`
- `eandrju/cellular-automaton.nvim`
- `laytan/cloak.nvim`
- `ThePrimeagen/vim-be-good`

### `lua/abenteuerzeit/remap.lua`

This file sets up various key mappings for various purposes, such as moving lines, yanking and deleting, navigating between windows, and more.

Note: The `<leader>` key is set to the space character ` ` in this configuration.

| Key Mapping | Description |
|-------------|-------------|
| `<leader>pv` | Open the command-line window |
| `J` (visual mode) | Move the selected lines down |
| `K` (visual mode) | Move the selected lines up |
| `J` (normal mode) | Join the next line to the current one |
| `<C-d>` | Scroll down while keeping the cursor in the middle |
| `<C-u>` | Scroll up while keeping the cursor in the middle |
| `n` | Search for the next match and center the cursor |
| `N` | Search for the previous match and center the cursor |
| `<leader>vwm` | Start the "vim-with-me" pair programming session |
| `<leader>svwm` | Stop the "vim-with-me" pair programming session |
| `<leader>p` (visual mode) | Paste the selected text without overwriting the register |
| `<leader>y` | Yank to the system clipboard |
| `<leader>Y` | Yank the entire line to the system clipboard |
| `<leader>d` | Delete to the void register |
| `<C-c>` (insert mode) | Exit insert mode |
| `Q` | Remapped to a no-op |
| `<C-f>` | Open a new tmux window with tmux-sessionizer |
| `<leader>f` | Format the current buffer using the configured language server |
| `<C-k>` | Go to the next entry in the quickfix list |
| `<C-j>` | Go to the previous entry in the quickfix list |
| `<leader>k` | Go to the next entry in the location list |
| `<leader>j` | Go to the previous entry in the location list |
| `<leader>s` | Substitute the word under the cursor |
| `<leader>x` | Make the current file executable |
| `<leader>vpp` | Open the `packer.lua` file |
| `<leader>mr` | Run the "make_it_rain" command from the cellular-automaton plugin |
| `<leader><leader>` | Source the current file |
| `<leader>gs` | Open the Git command-line window |
| `<leader>p` (fugitive buffer) | Push to the remote repository |
| `<leader>P` (fugitive buffer) | Pull from the remote repository with rebase |
| `<leader>t` (fugitive buffer) | Push to the remote repository and set the upstream |
| `<leader>a` | Add the current file to the harpoon list |
| `<C-e>` | Toggle the harpoon quick menu |
| `<C-h>` | Navigate to the first harpoon file |
| `<C-t>` | Navigate to the second harpoon file |
| `<C-n>` | Navigate to the third harpoon file |
| `<C-s>` | Navigate to the fourth harpoon file |
| `gd` | Go to the definition of the symbol under the cursor |
| `K` | Show hover information for the symbol under the cursor |
| `<leader>vws` | Open the workspace symbol search |
| `<leader>vd` | Open the diagnostics float |
| `[d` | Go to the next diagnostic |
| `]d` | Go to the previous diagnostic |
| `<leader>vca` | Show code actions |
| `<leader>vrr` | Find references |
| `<leader>vrn` | Rename the symbol under the cursor |
| `<C-h>` (insert mode) | Show the signature help |
| `<leader>ri` (visual mode) | Inline the selected variable |
| `<leader>pf` | Open the file finder |
| `<C-p>` | Open the git file finder |
| `<leader>ps` | Perform a grep search |
| `<leader>vh` | Open the help tags |
| `<leader>xq` | Toggle the quickfix window |
| `<leader>u` | Toggle the undo tree |
| `<leader>zz` | Enable zen mode with a limited width and line numbers |
| `<leader>zZ` | Enable zen mode with a smaller width and no line numbers or color column |

### `lua/abenteuerzeit/set.lua`

This file sets various editor options, such as line numbers, indentation, search behavior, and more. The following options are set:

- `guicursor`: Set to an empty string.
- `nu`: Enable line numbers.
- `relativenumber`: Enable relative line numbers.
- `tabstop`: Set tab width to 4 spaces.
- `softtabstop`: Set soft tab width to 4 spaces.
- `shiftwidth`: Set indentation width to 4 spaces.
- `expandtab`: Expand tabs to spaces.
- `smartindent`: Enable smart indentation.
- `wrap`: Disable line wrapping.
- `swapfile`: Disable swap files.
- `backup`: Disable backups.
- `undodir`: Set the undo directory to `~/.vim/undodir`.
- `undofile`: Enable persistent undo.
- `hlsearch`: Disable highlighting of search results.
- `incsearch`: Enable incremental search.
- `termguicolors`: Enable true color support.
- `scrolloff`: Set scroll offset to 8 lines.
- `signcolumn`: Enable the sign column.
- `isfname`: Append `@-@` to the list of characters considered part of a word.
- `updatetime`: Set update time to 50 milliseconds.
- `colorcolumn`: Set the color column to 80 characters.
- `shell`: Set the shell to `cmd.exe` (for Windows 11).

### `/after/plugin/cloak.lua`

This file configures the `cloak.nvim` plugin, which is used to obfuscate sensitive information in files.

### `/after/plugin/colors.lua`

This file sets up the color scheme and background color for the editor.

- `ColorMyPencils(color)`: Sets the specified color scheme and configures the background color.

### `/after/plugin/fugitive.lua`

This file sets up key mappings for the `vim-fugitive` plugin, which is used for Git integration.

### `/after/plugin/harpoon.lua`

This file sets up key mappings for the `harpoon` plugin, which is used for quickly navigating between files.

### `/after/plugin/lsp.lua`

This file configures the Language Server Protocol (LSP) support using the `lsp-zero.nvim` plugin. It sets up various key mappings for LSP-related functionality.

### `/after/pluginrefactoring.lua`

This file sets up key mappings for the `refactoring.nvim` plugin, which provides refactoring capabilities.

### `/after/plugin/telescope.lua`

This file sets up key mappings for the `telescope.nvim` plugin, which provides a fuzzy finder for various actions.

### `/after/plugin/treesitter.lua`

This file configures the `nvim-treesitter` plugin, which provides syntax highlighting and other features based on tree-sitter parsers.

### `/after/plugin/trouble.lua`

This file sets up a key mapping for the `trouble.nvim` plugin, which provides a list of diagnostics and other information.

### `/after/plugin/undotree.lua`

This file sets up a key mapping for the `undotree` plugin, which provides a visual representation of the undo history.

### `/after/plugin/zenmode.lua`

This file sets up key mappings for the `zen-mode.nvim` plugin, which provides a distraction-free writing mode.
