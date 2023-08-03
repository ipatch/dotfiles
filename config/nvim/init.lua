-- Author: github.com/ipatch
-- my experiemental neovim ≥ 0.5 configuratoin/setup
-- some inspiration: https://github.com/David-Kunz/vim/blob/master/init.lua
-- NOTE: ipatch, cursor postion is not restored when loading this file with `:e init.lua`

---------------
-- NOTE: ipatch / ⭐️ USEFUL REMINDERS, and other assorted BS
---
-- convert all single quotes in a file to double quotes
-- :%s/'\([^']*\)'/"\1"/g
---

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

-- nvim / native / providers
-- let g:loaded_python3_provider = 0 -- VIMscript
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- packer.nvim / bootstrap if not setup
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local is_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = true
  fn.system
    {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
    cmd [[packadd packer.nvim]]
end

-- add below line after cloning packer.nvim to ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- cmd [[packadd packer.nvim]]
-- REF: https://www.reddit.com/r/neovim/comments/mpuqzg/help_strange_error_with_initlua_file/
-- NOTE: exp with removing the `return` statement
--
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'christoomey/vim-tmux-navigator'

  -- lsp configuration and plugins
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'dev-v3',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.api.nvim_command, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- lsp helper / json files ie. tsconfig.json
  use "b0o/schemastore.nvim"

  -- lsp helper / typescript
  -- https://stackoverflow.com/a/70294761/708807
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  -- nvim-treesitter Highlight, edit, and navigate code
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = false })
    end
  }
  use 'nvim-treesitter/playground'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim'} }
  }

-- use {
  -- 'nvim-telescope/telescope-fzf-native.nvim', 
  -- run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
  -- }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'nvim-lua/popup.nvim'
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'rcarriga/nvim-dap-ui'

  -- code commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup{
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  }

  -- UI / themes
  use 'Mofiqul/vscode.nvim'
  use 'navarasu/onedark.nvim'
  use "projekt0n/github-nvim-theme"

  -- UI / enhancements / newlines
  use "lukas-reineke/indent-blankline.nvim"
  -- use "tpope/vim-sleuth"

  -- UI / enhancements / code folds
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  }

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

---------------
-- key mappings
g.mapleader = " " -- map leader key to spacebar 
map('n', '<leader>bd', ':bd<cr>', {noremap = true}) -- close buffer
map('n', '<leader>x', ':bd<cr>', {noremap = true}) -- close buffer
map('n', '<cr>', ':', {noremap = true}) -- press enter, return ↩ in normal to go into cmd mode
map('n', '<leader>w', ':w<cr>', {noremap = true}) -- save current buffer
map('n', '<leader><leader>', '<c-^>', {noremap = true}) -- toggle between last 2 buffers
map('n', '<leader>e', ':e ', {noremap = true}) -- open/edit new file from cmd
map('n', '<leader>pv', ':Ex<cr>') -- open netrw, ie. file explorer
-- alt way to above mapping
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- open netrw, ie. file explorer
-- NOTE: ipatch, `gn` in netrw to refocus the top level dir under the cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

---------------
-- key mapping / toggle hidden chars & Settings for hidden chars
map('n', '<leader>h', ':set list!<cr>', {noremap = true})

---------------
-- key mapping / copy the entire buffer to clipboard
-- vim.keymap.set('n', '<C-a>', '<esc>ggVG<CR>')
vim.keymap.set('n', '<C-a>', ':%y+<CR>', { noremap = true})

---------------
-- key mapping / bubble text
-- bubble text, Normal mode, <M-???>, `M` is meta key, `alt/option` on macOS
map('n', '<M-k>', ':m .-2<cr>==', {noremap = true})
map('n', '<M-j>', ':m .+1<cr>==', {noremap = true})

---------------
-- settings / options / use vim settings within nvim via lua
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'
opt.shiftwidth = 2
opt.splitbelow = true
opt.splitright = true

opt.incsearch = true
-- TODO: ipatch, should probably only have this mapping if there are highlighted search terms
-- map('n', '<CR>', ':nohl<CR>') -- unhighlight search terms

opt.backup = false
opt.cmdheight = 1
opt.cursorline = true           -- highlight the current line
opt.expandtab = true            -- use spaces instead of tabs
opt.hidden = true               -- use background buffers
opt.ignorecase = true           -- ignore case
opt.list = false                -- show invisible chars
opt.number = true               -- show line numbers
opt.scrolloff = 4               -- lines of context
opt.shiftround = true           -- round indent
opt.shiftwidth = 2              -- size of an indent
opt.signcolumn = "yes"
opt.smartcase = true            -- don't ignore capital letters when present
opt.smartindent = true          -- insert indents automatically
opt.softtabstop = 2
opt.swapfile = false
opt.tabstop = 2                 -- number of spaces tabs count for
opt.termguicolors = true        -- true color support
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.viewoptions = "folds,cursor"
opt.wrap = true

-- plugin / https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/67
opt.updatetime = 100

-- NOTE: ipatch, below causes error when reloading this config file
-- vim.api.nvim_exec([[
-- command SynID  echo synIDattr(synID(line("."), col("."), 1), "name")
--  ]], true)

---------------
-- settings / hidden chars
-- vim.opt.listchars:append("eol:↴")
-- opt.lcs:append("eol:↴")
opt.listchars:append("eol:¬")
opt.listchars:append("extends:»") -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
opt.listchars:append("nbsp:⦸") -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
opt.listchars:append("precedes:«") -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
opt.lcs:append("space:␣") -- Symbol for the space key
opt.listchars:append("tab:‣ ") -- NOTE:ipatch, requires a trailing `space` after char
opt.listchars:append("trail:•") -- BULLET (U+2022, UTF-8: E2 80 A2)

-- NOTE: ipatch, not required if the TS markdown and markdown_inline parsers are installed
-- setting / filetype / markdown
-- markdown_folding = 1

------------------------------
-- settings / views
-- below should remember cursor position in file
-- TODO: this really should be lua 🤷<200d>♂️
-- TODO: `:h 'viewdir`
vim.api.nvim_exec([[
augroup remember_folds
autocmd!
  if exists('$SUDO_USER')
      set viewdir=
  else
    au BufWinLeave *.* mkview
    au BufWinEnter *.* silent! loadview
  endif
augroup END
 ]], true)

--
g.netrw_banner = true
-- g.netrw_liststyle = 3

------------------------------
-- settings / clipboard
-- Check the operating system and set clipboard accordingly
if vim.fn.has('mac') == 1 or vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 then
    vim.opt.clipboard:append {'unnamed'}
else
    vim.opt.clipboard:append {'unnamedplus'}
end

-- NOTE: ipatch, open help pages in new buffer NOT in a split or tab
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function(event)
    if vim.bo[event.buf].filetype == 'help' then
      -- display help files in the buffer list
      vim.cmd('setlocal buflisted')
      vim.cmd.only()
    end
  end,
})

---------------
-- plugin / neovim native / LSP settings
-- ref: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
---

---------------
-- plugin / neovim / native LSP / mason / lsp manager
-- NOTE: ipatch, did not notice difference before/after lsp settings in init.lua
require('mason').setup({
  ui = {
    border = 'rounded'
  }
})

-- copy diagnostic message to clipboard
-- NOTE: ipatch, best solution i could come up with for time being
-- ...could not get a toggle focus/nofocus binding working
-- ...and float window would reopen after close NO BUENO!
local function copy_diagnostic_to_clipboard()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local bufnr = vim.api.nvim_get_current_buf()

  local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, row - 1)
  if next(line_diagnostics) == nil then
    print("No diagnostic message at the current position.")
  else
    local message = ""
    for _, diagnostic in ipairs(line_diagnostics) do
      message = message .. diagnostic.message .. "\n"
    end
    vim.fn.setreg("+", message)
    print("Diagnostic message copied to clipboard.")
  end
end

vim.keymap.set('n', '<leader>x', copy_diagnostic_to_clipboard, { noremap = true, silent = true })

-- NOTE: ipatch, style LSP diagnostic messages
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local lsp = require('lsp-zero').preset({})

-- TODO: ipatch, set the `cmd` var for the setup parameter for tsserver
lsp.on_attach(function(client, bufnr)

  lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
  })

  -- TODO: ipatch, this didn't work, updated the tsconfig.json for the project instead
  -- require('nvim-lsp-ts-utils').setup({
  --   filter_out_diagnositics_by_code = { 80001 },
  -- })
  -- require('nvim-lsp-ts-utils').setup_client(client)

  -- NOTE: ipatch, setup jsonls for tsconfig.json
  -- require('lspconfig').jsonls.setup({
  --   fileMatch = {"tsconfig*.json"},
  --   url = "https://json.schemastore.org/tsconfig.json"
  -- })

  local opts = {buffer = bufnr, remap = false}

  -- NOTE: ipatch, style LSP diagnostic messages requires nvim >= 0.7
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        -- NOTE: ipatch, toggle to true to copy text in diagnostics float window
        focusable = false,
        -- focusable = true,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = '',
        header = '',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

-- NOTE: ipatch, did not notice difference before/after lsp settings in init.lua
-- require('mason').setup({
--   ui = {
--     border = 'rounded'
--   }
-- })

require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    end,
  }
})

require('lsp-zero').extend_cmp()

local cmp = require('cmp')

cmp.setup({

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  mapping = {
    -- use `TAB` key to highlight next item in list
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
  },
})

---------------
-- plugin / neovim telescope 
--
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})

local builtin = require('telescope.builtin')

-- plugin / neovim telescope / key mappings
-- NOTE: ipatch, install telecope-fzf-native.nvim to fuzzy search
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', ';', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep >") })
end)

-- TODO: ipatch, mapping to delete/close buffer from picker view
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-c-d-to-delete-buffer

---------------
-- plugin / nvim-telescope
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

---------------
-- plugin / vim-turmuxnavigator / mappings
-- TODO: migrate these mappings from VimL to lua
--[[ let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>j :TmuxNavigateDown<cr>
nnoremap <silent> <leader>k :TmuxNavigateUp<cr>
nnoremap <silent> <leader>l :TmuxNavigateRight<cr>
"nnoremap <silent> :TmuxNavigatePrevious<cr> ]]

---------------
-- plugin / tree-sitter
-- NOTE: ipatch, `all` blows up 💥 on m1 mac due to `phpdoc` use `maintained` for time being
--
local ts = require 'nvim-treesitter.configs'
ts.setup {
  sync_install = false,
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'fish',
    'help',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'ruby',
    'rust',
    'tsx',
    'typescript',
    'vim',
  },
  -- List of parsers to ignore installing
  ignore_install = {
    'beancount',
    'clojure',
    'gleam',
    'help',
    'phpdoc',
    'slint',
  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

---------------
-- plugin / theme / colorscheme
-- REF: https://github.com/David-Kunz/vim/blob/master/init.lua#L235
-- colorscheme
require('onedark').setup {
  style = 'deep',
  -- style = 'darker',
  -- style = 'dark',
  -- style = 'warmer',

  colors = {
    -- NOTE: ipatch, default grey color too light to see on dark background with lots of ambient light
    -- NOTE: github uses #8b949e for code comments in dark contrast web UI
    github_grey = "#8b94e",
  },
  highlights = {
    ["@Comment"] = {fg = '$github_grey'},
  }
}

require('onedark').load()

-- NOTE: ipatch, override the default bg color for onedark theme
-- TODO: ipatch, migrate this function, cmd to the above onedark colorscheme
vim.api.nvim_command([[
augroup ChangeBackgroudColour
autocmd colorscheme * :hi normal guibg=#0a0a0a
augroup END
]])

cmd [[silent! colorscheme onedark]]

---------------
-- plugin / 'numToStr/Comment.nvim'
-- NOTE: ipatch, attempt to define commentstring for specific dot files
local ft = require('Comment.ft')

-- 1. Using set function

ft
-- Set only line comment
-- .set('yaml', '#%s')
-- Or set both line and block commentstring
-- .set('javascript', {'//%s', '/*%s*/'})
.set('ini', ';%s')

cmd('set foldmethod=expr')
cmd('set foldexpr=nvim_treesitter#foldexpr()')

-- unsorted / builtin vim commands
-- -- highlight on yank
cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

---------------
-- plugin / folding / fold settings - ufo
-----
-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
-- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
})

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- NOTE: ipatch Helper function to restore folds
function RestoreFolds()
  local last_view = vim.fn.winsaveview()
  if vim.fn.empty(vim.fn.getwininfo()) > 1 or last_view == nil or last_view.foldlevel == 0 then
    -- set defaults if non exist
    vim.opt.foldenable = true
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = -1
  else
    vim.opt.foldenable = true
    vim.opt.foldlevel = last_view.foldlevel
    vim.opt.foldlevelstart = last_view.foldlevel
  end
end

-- Autocommand to call RestoreFolds() on BufReadPost
vim.cmd([[
augroup remember_folds
autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufReadPost *.* lua RestoreFolds()
augroup END
]])

---------------
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

---------------
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

---------------
-- plugin /mfussenegger/nvim-dap 
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🙅', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='✋', texthl='', linehl='', numhl=''})

---------------
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

---------------
-- plugin / nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
map('n', '<leader>dtb', ':Telescope dap list_breakpoints<CR>')
map('n', '<leader>dtf', ':Telescope dap frames<CR>')

---------------
-- plugin / rcarriga/nvim-dap-ui
require('dapui').setup()
map('n', '<leader>dq', ':lua require"dapui".toggle()<CR>')

