-- Author: github.com/ipatch
-- my experiemental neovim ≥ 0.5 configuratoin/setup
-- Inspiration: https://github.com/David-Kunz/vim/blob/master/init.lua

-- helpers
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- helper function / key mappings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- packer.nvim / bootstrap if not setup
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system(
    {'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path}
  )
end

-- add below line after cloning packer.nvim to ~/.local/share/nvim/site/pack/packer/start/packer.nvim
vim.cmd [[packadd packer.nvim]]
-- REF: https://www.reddit.com/r/neovim/comments/mpuqzg/help_strange_error_with_initlua_file/
-- NOTE: exp with removing the `return` statement
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim'} }
    }
  --
  use 'nvim-lua/popup.nvim'
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'rcarriga/nvim-dap-ui'
  --
  use 'b3nj5m1n/kommentary' -- comment toggling ala vim-commentary
  -- themes
  use 'Mofiqul/vscode.nvim'
  use 'navarasu/onedark.nvim'
  use "projekt0n/github-nvim-theme"

  if packer_bootstrap then
	  require('packer').sync()
  end
end)

-- key mappings
g.mapleader = " " -- map leader key to spaceboar 
map('n', '<leader>bd', ':bd<cr>', {noremap = true}) -- close buffer
map('n', '<leader>x', ':bd<cr>', {noremap = true}) -- close buffer
map('n', '<cr>', ':', {noremap = true})
map('n', '<leader>w', ':w<cr>', {noremap = true})
map('n', '<leader><leader>', '<c-^>', {noremap = true}) -- toggle between last 2 buffers
map('n', '<leader>e', ':e ', {noremap = true}) -- open/edit new file from cmd

-- settings
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.shiftwidth = 2
opt.incsearch = true
opt.cmdheight = 1
opt.expandtab = true            -- use spaces instead of tabs
opt.hidden = true               -- use background buffers
opt.ignorecase = true           -- ignore case
opt.list = true                 -- show some invisible chars
opt.number = true               -- show line numbers
opt.scrolloff = 4               -- lines of context
opt.shiftround = true           -- round indent
opt.shiftwidth = 2              -- size of an indent
opt.softtabstop = 2
opt.smartcase = true            -- don't ignore capital letters when present
opt.smartindent = true          -- insert indents automatically
opt.tabstop = 2                 -- number of spaces tabs count for
opt.termguicolors = true        -- true color support
--opt.wildmode = {'list', 'longest'} -- command mode completion
opt.wrap = false
--
g.netrw_banner = false
g.netrw_liststyle = 3

-- clipboard settings
cmd 'set clipboard&'
if fn.has('mac') then
  opt.clipboard:append {'unnamed'}
elseif fn.has('win64') then
  opt.clipboard:append {'unnamed'}
elseif fn.has('win32') then
  opt.clipboard:append {'unnamed'}
else
  opt.clipboard:append {'unnamedplus'}
end

--[[ require('settings')       -- lua/settings.lua
require('maps')           -- lua/maps.lua
require('statusline')     --lua/statusline.lua ]]

-- plugin / neovim telescope / key mappings
-- mapping using the provided helper function
map('n', ';', ':Telescope buffers<CR>')
-- TODO: set <c-p> in normal mode to launch fuzzy find files
-- map('n', '<leader>fd', ':lua telescope_find_files_path()<CR>') -- NOTE: requires custom function
map('n', '<c-p>', ':Telescope find_files<CR>')

-- mappings / plugin / vim-turmuxnavigator
-- TODO: migrate these mappings from VimL to lua
--[[ let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>j :TmuxNavigateDown<cr>
nnoremap <silent> <leader>k :TmuxNavigateUp<cr>
nnoremap <silent> <leader>l :TmuxNavigateRight<cr>
"nnoremap <silent> :TmuxNavigatePrevious<cr> ]]

-- plugin / tree-sitter
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-- plugin / tree-sitter / colorscheme
-- REF: https://github.com/David-Kunz/vim/blob/master/init.lua#L235
local g = vim.g
local cmd = vim.cmd

-- colorscheme
g.onedark_style = "deep"
g.vscode_style = "dark"
-- cmd('colorscheme onedark')
require("github-theme").setup({
  theme_style = "dark_default",
  -- other config
})
cmd('set foldmethod=expr')
cmd('set foldexpr=nvim_treesitter#foldexpr()')

-- unsorted / builtin vim commands
-- -- highlight on yank
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

-- plugin / mfussenegger/nvim-dap
-- NOTE: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '$HOME/.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directory and uses the python within.
      -- You could adapt this, for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- plugin / nvim-dap / debug node / javascript
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.local/share/debuggers/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    types = 'node2',
    requrest = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}
-- plugin /mfussenegger/nvim-dap 
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🙅', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='✋', texthl='', linehl='', numhl=''})

-- plugin /mfussenegger/nvim-dap / mappings (requires helper function)
--
map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
-- requires external helper file `debugHelper.lua`
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dc', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
map('n', '<leader>dn', ':lua require"dap".continue()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')

-- plugin / nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
map('n', '<leader>dtb', ':Telescope dap list_breakpoints<CR>')
map('n', '<leader>dtf', ':Telescope dap frames<CR>')

-- plugin / rcarriga/nvim-dap-ui
require('dapui').setup()
map('n', '<leader>dq', ':lua require"dapui".toggle()<CR>')
