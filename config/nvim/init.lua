-- Author: github.com/ipatch
-- my neovim ≥ 0.5 configuration/setup
-- some inspiration: https://github.com/David-Kunz/vim/blob/master/init.lua

---------------
-- NOTE: ipatch / ⭐️ USEFUL REMINDERS, and other assorted BS
-- NOTE: ipatch, when reloading this file with `:so %` all folds are opened 👎️ workaround save to svim then load svim
---------------
-- TODO: only add commented line when holding down the shift key, return should not make the next line a comment
-- TODO: finish scaffolding out lazydev.nvim
--
----
-- convert all single quotes in a file to double quotes
-- :%s/'\([^']*\)'/"\1"/g
----
-- print the value of the color under the cursor
-- echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg#")
----

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

-- keymapping / setup leader before lazy.nvim
g.mapleader = " " -- map leader key to spacebar 

-- lazy.nvim
-- migrate from packer.nvim to lazy.nvim
-- https://www.youtube.com/watch?v=aqlxqpHs-aQ

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require('lazy').setup({

  -- tmux / quick pane switching
  'christoomey/vim-tmux-navigator',

  -- clipboard
  {'ojroques/nvim-osc52'},

  {  -- chatgpt
    -- "jackMort/ChatGPT.nvim",
    -- lazy = true,
    -- config = function()
    --   require("chatgpt").setup()
    -- end,
    -- dependencies = {
    --   "MunifTanjim/nui.nvim",
    --   "nvim-lua/plenary.nvim",
    --   "nvim-telescope/telescope.nvim",
    -- }
  },

  { -- LSP configuration and plugins
    'VonHeikemen/lsp-zero.nvim',
    branch = 'dev-v3',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {
        'williamboman/mason.nvim',           -- Optional
        build = function()
          pcall(vim.api.nvim_command, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/nvim-cmp'},     -- Required
      ({ -- snippets / luasnip + friends
        'L3MON4D3/LuaSnip',
          dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
          },
        -- follow latest release.
        tag = 'v2.3.0', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        build = 'make install_jsregexp'
      }),
    }
  },

  -- lsp helper / nvim configuring init.lua + friends
  -- DEPRECATED! migrate to lazydev.nvim
  -- "folke/neodev.nvim",
  "folke/lazydev.nvim",

  -- lsp helper / json files ie. tsconfig.json
  "b0o/schemastore.nvim",

  -- lsp helper / typescript
  -- https://stackoverflow.com/a/70294761/708807
  'jose-elias-alvarez/nvim-lsp-ts-utils',

  { -- nvim-treesitter Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = false })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    }
  },
  -- NOTE: ipatch, deprecated
  -- 'nvim-treesitter/playground',

  { -- telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
  },

  'nvim-lua/popup.nvim',
  'mfussenegger/nvim-dap',
  'nvim-telescope/telescope-dap.nvim',

  { -- dap / nvim-dap-ui
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'nvim-neotest/nvim-nio'
    }
  },

  { -- code commenting
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup{
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },

  { -- UI / git browser
  'junegunn/gv.vim',
  dependencies = 'tpope/vim-fugitive',
  },

  -- UI / themes
  'Mofiqul/vscode.nvim',
  'navarasu/onedark.nvim',
  'projekt0n/github-nvim-theme',

  -- UI / enhancements / newlines
  {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  { -- UI / enhancements / code folds
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async'
  },

  -- UI / enhancements / color picker
  'NvChad/nvim-colorizer.lua',
})

---------------
-- key mappings
-- g.mapleader = " " -- map leader key to spacebar 
map('n', '<leader>bd', ':bd<cr>', {noremap = true}) -- close buffer
map('n', '<leader>x', ':bd<cr>', {noremap = true}) -- close buffer
-- NOTE: ipatch, see line num ~= :191
-- map('n', '<cr>', ':', {noremap = true}) -- press enter, return ↩ in normal to go into cmd mode
map('n', '<leader>w', ':w<cr>', {noremap = true}) -- save current buffer
map('n', '<leader><leader>', '<c-^>', {noremap = true}) -- toggle between last 2 buffers
map('n', '<leader>e', ':e ', {noremap = true}) -- open/edit new file from cmd
map('n', '<leader>pv', ':Ex<cr>') -- open netrw, ie. file explorer
-- alt way to above mapping
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- open netrw, ie. file explorer
-- NOTE: ipatch, `gn` in netrw to refocus the top level dir under the cursor
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<leader>s', ':set spell!<cr>') -- toggle spell checking

-- key mapping / use `c-q` to insert special characters
map('i', '<C-q>', '<C-v>', {noremap = true})

---------------
-- key mapping / toggle hidden chars & Settings for hidden chars
map('n', '<leader>h', ':set list!<cr>', {noremap = true})

---------------
-- key mapping / copy the entire buffer to clipboard
-- vim.keymap.set('n', '<C-a>', '<esc>ggVG<CR>')
map('n', '<C-a>', ':%y+<CR>', { noremap = true})

---------------
-- key mapping / bubble text
-- bubble text, Normal mode, <M-???>, `M` is meta key, `alt/option` on macOS
map('n', '<M-k>', ':m .-2<cr>==', {noremap = true})
map('n', '<M-j>', ':m .+1<cr>==', {noremap = true})

---------------
-- key mapping / moving through wrapped lines of text, treat wrapped lines of text as multiple lines
--
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

---------------
-- key mapping / clear search term, remove highlighting, then map CR to `:` for normal mode
---
function ClearSearchAndCmd()
  if vim.fn.getreg('/') ~= '' then
    vim.fn.setreg('/', '')
    vim.cmd('noh')
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':', true, true, true), 'n', true)
end
vim.api.nvim_set_keymap('n', '<CR>', ':lua ClearSearchAndCmd()<CR>', { noremap = true, silent = true })

---------------
-- key mapping / delete the current buffer and remove the file from disk
---- delete the current buffer, <leader>rm
------
vim.keymap.set('n', '<leader>rm', ':call delete(expand("%")) | bdelete!<CR>', { noremap = true, silent = true })

---------------
-- SETTINGS / options / use vim settings within nvim via lua
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'
opt.shiftwidth = 2
opt.splitbelow = true
opt.splitright = true

opt.incsearch = true
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
opt.termguicolors = true        -- true color support, use guifg/guibg instead of ctermfg/ctermbg in terminal
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.viewoptions = "folds,cursor"
opt.wrap = true

-- DO NOT insert code comment on next line
-- nowork!
-- opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }

-- NOTE: ipatch, workaround use <c-u> to remove new comment
-- Create an augroup to prevent duplicate autocommands
-- vim.cmd([[
--   augroup RemoveAutoComment
--     autocmd!
--     autocmd BufEnter * set formatoptions-=cro
--     autocmd BufEnter * setlocal formatoptions-=cro
--   augroup END
-- ]])

-- TODO: NO WORK!!
-- Define a function to insert a new line with a comment
function insert_commented_line()
  -- Temporarily enable 'formatoptions'
  local fo = vim.opt.formatoptions:get()
  local fo_str = table.concat(fo, "")
  vim.opt.formatoptions:append { 'c', 'r', 'o' }
  -- Insert a new line below and enter insert mode
  vim.cmd('normal! o')
  -- Restore the original 'formatoptions'
  vim.opt.formatoptions = fo
end

-- TODO: NO WORK!!
-- Map the function to <leader>oc for testing
-- vim.api.nvim_set_keymap('n', '<leader>oc', ':lua insert_commented_line()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>oc', insert_commented_line, {})

-- Define a simple test function
local function test_function()
  print("Keybinding works!")
end
-- Test the keybinding with <leader>t
-- vim.api.nvim_set_keymap('n', '<leader>t', ':lua test_function()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>t', test_function, {})

-- Map the function to <M-o><M-c><M-r>
-- vim.api.nvim_set_keymap('n', '<M-o><M-c><M-r>', ':lua insert_commented_line()<CR>', { noremap = true, silent = true })

-- plugin / https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/67
opt.updatetime = 100
g.netrw_banner = true

---------------
-- SETTINGS / hidden chars
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
-- SETTINGS / VIEWS / Save and restore cursor position
-- `:h 'viewdir`
-----

------------------------------
-- SETTINGS /  statusline, stl
----
-- NOTE: ipatch, the default neovim statusline, stl taken from the help page
-- vim.opt.statusline = "%<%f ${&fileformat} %h%m%r%=%-14.(%l,%c%V%) %P"

vim.opt.statusline = "%<%f | %{&fileformat} %h%m%r%=%-14.(%l,%c%V%) %P"

-- Define the user namespace table
vim.g.user = {}

-- Set the event field in the user namespace
vim.g.user.event = "my_event_group"

-- Set the event field in the user namespace
vim.g.user.fold_event = "my_fold_event_group"

-- Create an autocmd / save restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.g.user.event,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

------------------------------
-- TODO: autocmd / replace <200b> unicode char on paste
----

------------------------------
-- SETTINGS / clipboard
----
-- check for osc52 native support
-- https://github.com/neovim/neovim/commit/cd31a72f9b22741c6ece1c47a91d990e2df218fa
local function has_osc52_support()
  local neovim_version = vim.version()
  -- Checks if the version is 0.10.0 or newer
  return neovim_version.major > 0 or
  (neovim_version.major == 0 and neovim_version.minor >= 10)
end

-- set clipboard based on tmux and or neovim version
-- Check if running inside tmux
if vim.env.TMUX then
  vim.g.clipboard = {
    -- check the clipboard name with the below lua command,
    -- :lua print(vim.g.clipboard.name)
    name = 'tmux',
    copy = {
      ["+"] = {'tmux', 'load-buffer', '-w', '-'},
      ["*"] = {'tmux', 'load-buffer', '-w', '-'},
    },
    paste = {
      ["+"] = {'bash', '-c', 'tmux refresh-client -l && sleep 0.2 && tmux save-buffer -'},
      ["*"] = {'bash', '-c', 'tmux refresh-client -l && sleep 0.2 && tmux save-buffer -'},
    },
    cache_enabled = false,
  }
elseif has_osc52_support() then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
else
  -- Default settings for clipboard based on the operating system
  if vim.fn.has('mac') == 1 or vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 then
    vim.opt.clipboard:append {'unnamed'}
  else
    vim.opt.clipboard:append {'unnamedplus'}
  end
end

-- NOTE: ipatch, UI / personal preference / open help pages in new buffer NOT in splits or tabs
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

------------------------------
-- SETTINGS / filetypes / custom filenames
-- NOTE: rm'd symlink not required anymore but leave here for future ref
----
vim.cmd([[
  autocmd BufRead,BufNewFile config.fish-capin-mpb14,3-single-file set filetype=fish
  autocmd BufNewFile,BufRead *.service* set filetype=systemd
]])

vim.cmd('autocmd BufRead,BufNewFile ~/.config/rofi/config.rasi set filetype=rasi')
---------------
-- PLUGIN / clipboard / nvim-osc52
----
require('osc52').setup {
  max_length = 0,           -- Maximum length of selection (0 for no limit)
  silent = false,           -- Disable message on successful copy
  trim = false,             -- Trim surrounding whitespaces before copy
  tmux_passthrough = true, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
}

---------------
-- PLUGIN / AI / chatgpt.nvim
-- DISABLE chatgpt.nvim
----
local home = vim.fn.expand('$HOME')
local api_key_cmd

-- Check if the file exists before setting api_key_cmd
local api_key_file = home .. '/.ssh/my.openai.api.key.secret.gpg'
if vim.fn.filereadable(api_key_file) == 1 then
    api_key_cmd = 'gpg --decrypt ' .. api_key_file

    -- Conditionally load the setup function
    -- require('chatgpt').setup({
    --     api_key_cmd = api_key_cmd,
    -- })
end
---------------
-- PLUGIN / neovim native / LSP settings
----
-- ref: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

---------------
-- PLUGIN / neovim / native LSP / mason / lsp manager
----
-- NOTE: ipatch, did not notice difference before/after lsp settings in init.lua
require('mason').setup({
  ui = {
    border = 'rounded'
  }
})

-- COPY DIAGNOSTIC MESSAGE TO CLIPBOARD
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

------------------------------
-- PLUGIN / folke/lazydev.nvim
-- TODO: finish scaffolding out setup / config
-----
local nvim_lsp = require('lspconfig')
local lsp = require('lsp-zero').preset({})

-- TODO: ipatch, set the `cmd` var for the setup parameter for tsserver
lsp.on_attach(function(client, bufnr)

  lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»',
  })

  -- TODO: ipatch, NO WORK, updated the tsconfig.json for the project instead
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

-- Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- NOTE: ipatch, https://github.com/hrsh7th/vscode-langservers-extracted
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
require'lspconfig'.html.setup {
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    -- The code-formatting feature of the lsp can be controlled with the `provideFormatter` option.
    provideFormatter = true
  },
  -- settings = {},
  -- single_file_support = true,
  on_attach = on_attach,
}

require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

---------------
-- plugin / nvim native lsp / yaml, yml - yamlls
----
require'lspconfig'.yamlls.setup{
  capabilities = capabilities
}

---------------
-- plugin / nvim native lsp / ruby-lsp
-- NOTE: ipatch, when using rvm to manage rubies, rvm needs to be init'd before running `:masoninstall ruby-lsp`
----

--[[ require('lspconfig').ruby_ls.setup {
  -- cmd = {"/home/my_user/.rbenv/shims/ruby-lsp"},
  cmd = { "/Users/brewmaster/.gem/ruby/3.1.0/bin/ruby-lsp" }
}

textDocument/diagnostic support until 0.10.0 is released
_timers = {}
local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      if not result then
        return
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = result.items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end 
]]

---------------
-- PLUGIN / neovim native lsp / ruby / solargraph
-- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph
-- NOTE: ipatch, use `gem install --user-install solargraph` and NOT mason to install solargraph
----
require'lspconfig'.solargraph.setup{
  capabilities = capabilities,
  cmd = { "solargraph", "stdio" },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  settings = {
    solargraph = {
      autoformat = false,
      formatting = false,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}

---------------
-- PLUGIN / luasnips, neovim snippets plugin
----
require("luasnip.loaders.from_vscode").lazy_load()

---------------
-- PLUGIN / nvim-cmp, neovim completion 
----
require('lsp-zero').extend_cmp()

-- NOTE: ipatch, / plugin / nvim-cpm
-- ref: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-codicons-to-the-menu
local kind_icons = {
  Text = '  ',
  Method = 'mth  ',
  Function = 'fn  ',
  Constructor = '  ',
  Field = '  ',
  Variable = 'var  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = 'prop  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = 'kwd  ',
  Snippet = '✂️',  -- Scissors icon for Snippet
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  mapping = {
    -- use `TAB` key to highlight next item in list
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
    ['<C-e>'] = cmp.mapping.abort(),
 },
 formatting = {
   fields = { "kind", "abbr" },
   format = function(entry, vim_item)

     -- kind icons
     -- vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
     vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
     vim_item.menu = ({
       buffer = "(Buffer)",
       path = "(Path)",
     })[entry.source.name]

     return vim_item
   end,
 },
})

---------------
-- PLUGIN / neovim telescope 
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

local actions = require "telescope.actions"

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
    buffers = {
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer
        }
      }
    },
  }
})

local builtin = require('telescope.builtin')

---------------
-- PLUGIN / neovim telescope / key mappings
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
-- PLUGIN / nvim-telescope
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')

---------------
-- PLUGIN / vim-turmuxnavigator / mappings
----

---------------
-- PLUGIN / nvchad/nvim-colorizer.lua 🎨
-- NOTE: ipatch, display the actual colors in the text file 
-- ref: https://github.com/norcalli/nvim-colorizer.lua
----
require 'colorizer'.setup({
  filetypes = {
    '*';
    '!markdown';
    '!gitconfig';
    '!sh';
    lua = { mode = 'foreground'; },
    tmux =  { mode = 'foreground'; }
  },
})

---------------
-- PLUGIN / indent-blankline
require('ibl').setup()

---------------
-- PLUGIN / tree-sitter, treesitter
-- NOTE: ipatch, `all` blows up 💥 on m1 mac due to `phpdoc`
-- NOTE: ipatch, https://www.reddit.com/r/neovim/comments/1ds8kcp/i_got_this_error_when_open_help_anyone_known_how/lbewzk1/
-- i had to add the vimdoc and luddoc parsers to prevent the above err
----
local ts = require 'nvim-treesitter.configs'
ts.setup {
  sync_install = false,
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'fish',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'help',
    'html',
    'javascript',
    'json',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'rasi',
    'ruby',
    'rust',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
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

  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/82
  -- nvim-ts-context-commentstring is set up automatically
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },

  indent = {
    enable = false
  },
  autopairs = { enable = true },

  autotag = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'javascriptreact',
      'svelte',
      'typescript',
      'typescriptreact',
      'vue',
      'xml',
      },
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>', -- set to `false` to disable one of the mappings
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      -- node_decremental = '<c-bs>', -- NOTE: ipatch, could not get <c-bs> key bind to work
      node_decremental = '<bs>',
    },
  },
}

---------------
-- PLUGIN / treesitter / nvim-ts-context-commentstring
----
require('ts_context_commentstring').setup {
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
  },
}

---------------
-- PLUGIN / treesitter-textobjects, treesitter, tree-sitter
----
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        -- ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        -- ["[d"] = "@conditional.outer",
      }
    },
  },
}

---------------
-- PLUGIN / UI / theme / colorscheme 🌈 🏳️‍🌈
-- REF: https://github.com/David-Kunz/vim/blob/master/init.lua#L235
-- colorscheme
----
require('onedark').setup {
  style = 'deep',
  -- style = 'darker',
  -- style = 'dark',
  -- style = 'warmer',

  colors = {
    -- NOTE: ipatch, default grey color too light to see on dark background with lots of ambient light
    -- NOTE: github uses #8b949e for code comments in dark contrast web UI
    github_grey = "#8b949e",
    github_grey_lighter = "#9BA5B0",
    tmux_comment = "#6a7076",
    bright_orange = "#ff8800",
    -- red = "#ff0000",
  },
  highlights = {
    -- NOTE: ipatch, run `:Inspect` to get the highlighting group
    -- ["@comment"] = {fg = '$bright_orange'},
    ["@comment"] = {fg = '$github_grey'},
    ["tmuxcomment"] = {fg = '$github_grey_lighter'},
    ["@lsp.type.comment"] = {fg = '$github_grey' },
    ["Comment"] = {fg = '$github_grey'},
    -- ["@spell.mardown"] = { fmt = "undercurl" },
    -- ["@spell"] = { fg = '$red', fmt = "undercurl", sp = '$red'}
  },

  diagnostics = {
    undercurl = true,
  },
  code_style = {
    comments = 'italic',
  }
}

require('onedark').load()

-- NOTE: ipatch, run `:SynID` ie. syntaxid to print the formatting/highlight under the cursor
-- NOTE: ipatch, adding `command!` allows reloading of this config
-- TODO: not seeing the output of this command being printed
vim.api.nvim_command([[
  command! Syntaxid echo synIDattr(synID(line("."), col("."), 1), "name")
]])

-- NOTE: ipatch, override the default bg color for onedark theme
-- TODO: ipatch, migrate this function, cmd to the above onedark colorscheme
vim.api.nvim_command([[
  augroup ChangeBackgroudColour
  autocmd colorscheme * :hi normal guibg=#0a0a0a
  augroup END
]])

-- NOTE: ipatch below line required or bg color is not updated in terminal
cmd [[silent! colorscheme onedark]]

-- ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ NOTE: ipatch, this needs to be below the `colorscheme onedark` cmd above
-- NOTE: ipatch, it appears below line not required with recent update 
-- ref: https://github.com/navarasu/onedark.nvim/commit/09b71d84b
-- vim.cmd [[hi SpellBad gui=undercurl]]

---------------
-- PLUGIN / 'numToStr/Comment.nvim'
-- NOTE: ipatch, attempt to define commentstring for specific dot files
require('Comment').setup({
  -- per the plugin readme ignore empty lines
  ignore = '^$'
})

local ft = require('Comment.ft')
-- 1. Using set function
ft
-- Set only line comment
-- .set('yaml', '#%s')
-- Or set both line and block commentstring
-- .set('javascript', {'//%s', '/*%s*/'})
.set('ini', ';%s')
.set('jsonc', '/*%s*/')
.set('c', '//%s', '//%s')
.set('gitconfig', '#%s')
.set('systemd', '#%s')

-- DEPRECATED
-- cmd('set foldmethod=expr')
-- cmd('set foldexpr=nvim_treesitter#foldexpr()')

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

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

-- remember folds
vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]]

vim.api.nvim_exec([[
  " autocmd BufReadPost * setlocal foldlevel=0
]], false)

-- Set the default fold level to 99
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

---------------
-- PLUGIN / mfussenegger/nvim-dap
-- NOTE: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
----
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
----
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
----
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🙅', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='✋', texthl='', linehl='', numhl=''})

---------------
-- plugin /mfussenegger/nvim-dap / mappings (requires helper function)
----
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
----
require('telescope').load_extension('dap')
map('n', '<leader>dtb', ':Telescope dap list_breakpoints<CR>')
map('n', '<leader>dtf', ':Telescope dap frames<CR>')

---------------
-- plugin / rcarriga/nvim-dap-ui
----
require('dapui').setup()
map('n', '<leader>dq', ':lua require"dapui".toggle()<CR>')

