---------------
-- NOTE: ipatch / ⭐️USEFUL REMINDERS, and other assorted BS
-- NOTE: ipatch, when reloading this file with `:so %` all folds are opened 👎️ workaround save to svim then load svim
---------------
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
  -- NOTE: ipatch this plugin is now OBSOLETE with neovim >= v0.10
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

  -- linting
  'mfussenegger/nvim-lint',

  { -- LSP configuration and plugins
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {
      'williamboman/mason.nvim',           -- Optional
      build = function()
        pcall(vim.api.nvim_command, 'MasonUpdate')
      end,
    },
  },

  { -- Autocompletion blink.cmp
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.1.1',

    -- NOTE: ipatch, requires a nightly install of rustc
    -- build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    -- opts = {
        -- see :h blink-cmp-config-keymap for defining your own keymap
      --   keymap = { preset = 'default' },
      -- },
      -- sources = {
        --   default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- },
        -- fuzzy = { implementation = "prefer_rust_with_warning" },
        -- opts_extend = { "sources.default" },
  },

  -- lsp helper / nvim configuring init.lua + friends
  "folke/lazydev.nvim",

  -- lsp helper / json files ie. tsconfig.json
  "b0o/schemastore.nvim",

  -- lsp helper / typescript
  -- https://stackoverflow.com/a/70294761/708807
  'jose-elias-alvarez/nvim-lsp-ts-utils',

  { -- nvim-treesitter highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = false })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
          require('treesitter-context').setup({
            -- multiline_threshold = 1,
            trim_scope = 'inner',
            max_lines = 1,
          })
        end
      },
    },
  },

  { -- telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && '
          .. 'cmake --build build --config Release && '
          .. 'cmake --install build --prefix build'
      }
    }
  },

  'nvim-lua/popup.nvim',

  { -- dap
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python',
      'jay-babu/mason-nvim-dap.nvim',
    }
  },

  { -- code commenting
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup{
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }

      -- Enable automatic comment continuation on Enter
      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
          vim.opt.formatoptions:append({ 'r' })
          vim.opt.formatoptions:remove({ 'o' })
        end,
      })

      -- Helper function to run without comment extension
      local run_without_comment_extension = function(fn)
        -- save current format options
        local formatoptions = vim.opt.formatoptions:get()
        local old_c = formatoptions.c
        local old_r = formatoptions.r
        local old_o = formatoptions.o

        -- temporarily disable comment continuation
        formatoptions.c = nil
        formatoptions.r = nil
        formatoptions.o = nil
        vim.opt.formatoptions = formatoptions

        -- execute function
        fn()

        -- restore format options (with slight delay due to race condition)
        vim.defer_fn(function()
          formatoptions.c = old_c
          formatoptions.r = old_r
          formatoptions.o = old_o
          vim.opt.formatoptions = formatoptions
        end, 10)
      end

      -- Shift+Enter to insert newline WITHOUT comment continuation
      -- NOTE: ipatch, when using nested tmux sessions the RAW escape code is required 
      -- ... i had to use VIM because neovim was inserting `<M-Esc>` instead of the literal `^[`
      vim.keymap.set('i', '<S-CR>', function()
        run_without_comment_extension(function()
          local cr_key = vim.api.nvim_replace_termcodes('<CR>', true, false, true)
          vim.api.nvim_feedkeys(cr_key, 'i', false)
        end)
      end, { desc = 'Insert newline without comment continuation' })
    end
  },

  { -- UI / git browser
  'junegunn/gv.vim',
  dependencies = 'tpope/vim-fugitive',
  },

  -- UI / gitsigns show changes in file while editing
  'lewis6991/gitsigns.nvim',

  -- UI / themes
  'Mofiqul/vscode.nvim',
  'navarasu/onedark.nvim',
  'projekt0n/github-nvim-theme',

  { -- UI / enhancements / newlines
    -- NOTE: ipatch, neewest version requires nvim nightly circa nov 6 2024
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  { -- UI / enhancements / code folds
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async'
  },

  -- UI / enhancements / color picker
  'NvChad/nvim-colorizer.lua',

  -- UI / enhancements / hover for LSP diagnositics
  'lewis6991/hover.nvim',
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
map('n', '<leader>pv', ':Ex<cr>') -- open netrw, ie. file explorer NOTE: opens dir of current buffer NOT lcd
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
opt.viewoptions = "folds,cursor,curdir,slash,unix"
-- opt.viewoptions = "folds,cursor"
opt.wrap = true

-- session options
vim.o.sessionoptions = vim.o.sessionoptions .. ",folds"

-- NOWORK!!!
-- vim.api.nvim_create_user_command("Mks", function(args)
--   -- Save current window
--   local current_win = vim.api.nvim_get_current_win()
--   local current_buf = vim.api.nvim_get_current_buf()
--   
--   -- Get list of loaded buffers with names
--   local bufs_to_save = {}
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= '' then
--       table.insert(bufs_to_save, buf)
--     end
--   end
--   
--   -- Temporarily split and save view for each buffer
--   for _, buf in ipairs(bufs_to_save) do
--     vim.cmd('silent! split')
--     vim.api.nvim_win_set_buf(0, buf)
--     vim.cmd('silent! mkview')
--     vim.cmd('silent! close')
--   end
--   
--   -- Restore original window and buffer
--   vim.api.nvim_set_current_win(current_win)
--   vim.api.nvim_set_current_buf(current_buf)
--   
--   -- Create session
--   vim.cmd("mksession! " .. args.args)
-- end, { nargs = 1 })

-- Define a simple test function
local function test_function()
  print("Keybinding works!")
end

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

------------------------------
-- SETTINGS /  statusline, stl
-- NOTE: ipatch, the default neovim statusline, stl taken from the help page
-- vim.opt.statusline = "%<%f ${&fileformat} %h%m%r%=%-14.(%l,%c%V%) %P"
----
vim.opt.statusline = "%<%f | %{&fileformat} %h%m%r%=%-14.(%l,%c%V%) %P"

-- Define the user namespace table
vim.g.user = {}

-- Set the event field in the user namespace
vim.g.user.event = "my_event_group"

-- Set the event field in the user namespace
vim.g.user.fold_event = "my_fold_event_group"

-- vim autocmd / save restore cursor position
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
-- SETTINGS / clipboard, ie. pbcopy
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
    -- NOTE: does not work with tmux <= v3.1c
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
  if vim.fn.isdirectory("/var/mobile") == 1 then
    vim.opt.clipboard:append {''}
  elseif vim.fn.has('mac') == 1 or vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 then
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
-- NOTE: ipatch, newer way to add custom filetypes for neovim >= 0.7+
-- NOTE: ipatch, https://github.com/lttb/gh-actions-language-server
----
vim.filetype.add({
  pattern = {
    ['.*/%.github[%w/]+workflows[%w/]+.*%.ya?ml'] = 'yaml.github',
    ['.*%.service.*'] = 'systemd',
    ['.*/%rofi[%w/]+config%.rasi'] = 'rasi'
  },
  filename = {
    ['config.fish-capin-mbp14,3-single-file'] = 'fish',
  }
})

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
-- neovim 0.11+ have native lsp api's thus no need for lsp-zero anymore
-- ref: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
----

local function  my_on_attach(client, bufnr)
  print("lsp attached:", client.name, "buffer:", bufnr)
  local opts = { buffer = bufnr, remap = false }

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

     -- NOTE: ipatch, style LSP diagnostic messages requires nvim >= 0.7
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        -- print("CursorHold fired! Buffer:", bufnr)
        local diagnostics = vim.diagnostic.get(0, {lnum = vim.fn.line('.')-1})
        -- print("Diagnostics on line:", vim.inspect(diagnostics))

        local result = vim.diagnostic.open_float(nil, {
          -- NOTE: ipatch, toggle to true to copy text in diagnostics float window
          focusable = false,
          -- focusable = true,
          border = 'rounded',
          source = 'always',
          prefix = '',
          header = '',
          scope = 'cursor',
          -- scope = 'line',
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        })
        -- print("open_float result:", vim.inspect(result))
      end,
    })
    -- Configure diagnostic signs when LSP attaches
    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '✘',
          [vim.diagnostic.severity.WARN] = '▲',
          [vim.diagnostic.severity.HINT] = '⚑',
          [vim.diagnostic.severity.INFO] = '»',
        },
        texthl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    })
end

-- apply above config to all lsp servers
vim.lsp.config('*', {
  on_attach = my_on_attach
})

-- configure individual lsp servers using vim.lsp.config()
-- pyright - Python
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'basic',
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      }
    }
  },
  on_attach = my_on_attach
})

-- jsonls
vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git', 'package.json' },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

-- yaml, yml - yamlls
vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab' },
  root_markers = { '.git' },
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas(),
      validate = true,
    },
  },
})

-- html - HTML
vim.lsp.config('html', {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { '.git', 'package.json' },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true
  },
})

-- lua ie. lua_ls
vim.lsp.config('lua_ls', {
  root_markers = {'.luarc.json', '.luarc.jsonc', '.git' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.list_extend(
          vim.api.nvim_get_runtime_file("", true),
          {
            vim.fn.stdpath('data') .. '/lazy/nvim-dap',
            vim.fn.stdpath('data') .. '/lazy/nvim-dap-ui',
          }
        ),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- ruby_lsp - Ruby
-- NOTE: ipatch, when using rvm to manage rubies, rvm needs to be init'd before running `:masoninstall ruby-lsp`
vim.lsp.config('ruby_lsp', {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
    enabledFeatures = {
      bundlerLock = false,
    },
  },
})

-- gh-actions-language-server
vim.lsp.config('gh_actions_ls', {
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/gh-actions-language-server'), '--stdio' },
  filetypes  = { 'yaml.github' },
  root_markers = { '.github', '.git' },
  init_options = {
    sessionToken = "",
    -- sessionToken = os.getenv("GITHUB_ACTIONS_LS_TOKEN"),
  },
})

-- clangd language server
-- https://clangd.llvm.org/installation#neovim-built-in-lsp-client
-- NOTE: clangd lsp can be provided by homebrew llvm ie. `brew install llvm`
vim.lsp.config('clangd', {
  cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
  -- NOTE: ipatch, for reasons i do not understand this has to be explicitly called
  on_attach = my_on_attach
})

vim.lsp.config('cmake', {
  cmd = { vim.fn.stdpath('data') .. '/mason/bin/cmake-language-server' },
  filetypes = { 'cmake' },
  root_dir = vim.fs.dirname(vim.fs.find('CMakeLists.txt', { upward = true })[1]),
  -- root_markers = { "CMakeLists.txt" },  -- replaces root_dir function
  init_options = {
    buildDirectory = "build",
  },
})

local lint = require("lint")

-- TODO: ipatch this is NOT WORKING as expected
lint.linters.cmakecheck = {
  cmd = "cmake",
  args = { "-P" },
  stdin = false,
  append_fname = true,
  ignore_exitcode = true,
  parser = function(output, bufnr)
    local diagnostics = {}

    for line in vim.gsplit(output, "\n", { trimempty = true }) do
      -- Typical CMake error example:
      -- CMake Error at CMakeLists.txt:4 (if):
      --   Parse error. Function missing ending ")". Instead found left paren with text "4.4.0".
      local filename, lnum, message =
        line:match("CMake Error at ([^:]+):(%d+)%s*%(([^)]+)%)")
      if filename and lnum then
        table.insert(diagnostics, {
          lnum = tonumber(lnum) - 1,
          col = 0,
          severity = vim.diagnostic.severity.ERROR,
          source = "cmake",
          message = message or "CMake parse error",
        })
      else
        -- fallback if CMake prints generic text on the next line
        if #diagnostics > 0 then
          diagnostics[#diagnostics].message = diagnostics[#diagnostics].message
            .. "\n"
            .. line
        end
      end
    end

    return diagnostics
  end,
}

require('lint').linters_by_ft = {
  cmake = { 'cmakelint', 'cmakecheck' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
  callback = function()
    require("lint").try_lint()
  end,
})

---------------
-- PLUGIN / neovim native lsp / ruby / solargraph
-- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph
-- NOTE: ipatch, use `gem install --user-install solargraph` and NOT mason to install solargraph
-- NOTE: ipatch, code actions are NOT supported https://github.com/castwide/solargraph/issues/614
----
-- vim.lsp.config.solargraph = {
--   capabilities = capabilities,
--   cmd = { "solargraph", "stdio" },
--   root_dir = lsp.util.root_pattern("Gemfile", ".git", "."),
--   settings = {
--     solargraph = {
--       autoformat = false,
--       formatting = false,
--       completion = true,
--       diagnostic = true,
--       folding = true,
--       references = true,
--       rename = true,
--       symbols = true
--     }
--   }
-- }
----

---------------
-- PLUGIN / hover.nvim
-- https://github.com/lewis6991/hover.nvim
-- TODO: follow up on my github issue https://github.com/lewis6991/hover.nvim/issues/110
----
-- require('hover').config({
--   -- list of module names to load as providers
--   --- @type (string|Hover.config.Provider)[]
--   providers = {
--     'hover.providers.diagnostic',
--     'hover.providers.lsp',
--     'hover.providers.dap',
--     'hover.providers.man',
--     'hover.providers.dictionary',
--   },
--   preview_opts = {
--     border = 'single'
--   },
--   -- Whether the contents of a currently open hover window should be moved
--   -- to a :h preview-window when pressing the hover keymap.
--   preview_window = false,
--   title = true,
--   mouse_providers = {
--     'hover.providers.lsp',
--   },
--   mouse_delay = 1000,

--   mouse_providers ={
--     'hover.providers.lsp'
--   }
-- })

-- vim.o.mousemoveevent = true

-- -- setup the mouse hover keymap
-- vim.keymap.set('n', '<MouseMove>', function()
--   -- NOWORK!
--   -- only trigger hover if we're over an identifier / keyword
--   local char = vim.fn.getline('.'):sub(vim.fn.col('.'), vim.fn.col('.'))
--   if not char:match('[%w_]') then
--     return
--   end

--   -- NOWORK!
--   -- this call internally runs providers and only shows a popup if a result is found
--   require('hover').mouse()
-- end, { desc = 'hover.nvim (mouse)' })

-- -- Configure the built-in LSP hover handler to be silent when there is no content.
-- -- This prevents the "No information available" or similar messages
-- -- which can sometimes manifest as an empty hover window via plugins like hover.nvim.
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover,
--   {
--     -- Setting silent to true prevents the display of the default message 
--     -- (like "No information available") when a server returns an empty result.
--     silent = true,
--   }
-- )

---------------
-- PLUGIN / mason LSP + DAP tooling
----
require('mason').setup({
  ui = {
    border = 'rounded'
  }
})

-- NOTE: ipatch, after adding the below lines ie. oct 26, 2025 began seeing diagnostic msg's within my init.lua
require('mason-lspconfig').setup {
  ensure_installed = {
    'pyright',
    'jsonls',
    'html',
    'yamlls',
    'lua_ls',
    'ruby_lsp',
    'solargraph',
    'cmake'
  },
  automatic_installation = true,
}

require('mason-nvim-dap').setup({
  ensure_installed = {
    -- 'python', -- NOTE: ipatch use `python` instead `debugpy`
    -- NOTE: ipatch, for a list of mappings
    -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
    'codelldb',
  },
  automatic_installation = true,
})

-- enable the lsp servers configured above
vim.lsp.enable('pyright')
vim.lsp.enable('jsonls')
vim.lsp.enable('yamlls')
vim.lsp.enable('html')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('gh_actions_ls')
vim.lsp.enable('cmake')
vim.lsp.enable('clangd')

-- language python / indentation / use ruff py formatter provided by mason
-- NOTE: ipatch unfortunately even setting the equalprg to ruff can not fix indentation of a single line in a py file
-- NOTE: ipatch using ruff appears to make things worse from my limited testing 🤦‍♂️
-- TODO: come up with something sane for python files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.bo.equalprg = "ruff format -q -"
--   end,
-- })

-- COPY DIAGNOSTIC MESSAGE TO CLIPBOARD
-- NOTE: ipatch, best solution i could come up with for time being
-- ...could not get a toggle focus/nofocus binding working
-- ...and float window would reopen after close NO BUENO!
local function copy_diagnostic_to_clipboard()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local bufnr = vim.api.nvim_get_current_buf()

  local line_diagnostics = vim.diagnostic.get(bufnr, { lnum = row - 1 })

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

vim.keymap.set('n', '<leader>yd', copy_diagnostic_to_clipboard, { noremap = true, silent = true })

------------------------------
-- PLUGIN / folke/lazydev.nvim
-- TODO: finish scaffolding out setup / config
-----

-- TODO: ipatch, NO WORK, updated the tsconfig.json for the project instead
-- require('nvim-lsp-ts-utils').setup({
  --   filter_out_diagnostics_by_code = { 80001 },
  -- })
  -- require('nvim-lsp-ts-utils').setup_client(client)

  -- NOTE: ipatch, setup jsonls for tsconfig.json
  -- require('lspconfig').jsonls.setup({
    --   fileMatch = {"tsconfig*.json"},
    --   url = "https://json.schemastore.org/tsconfig.json"
    -- })

-- Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- NOTE: ipatch, https://github.com/hrsh7th/vscode-langservers-extracted
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html

-------------------
-- plugin / nvim / gitsigns.nvim
-- NOTE: ipatch, https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#-keymaps
----
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- navigation

    -- nav forward
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    -- nav back
    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)
  end
}

-----------------------
-- plugin / nvim / blink.cmp
----
require('blink.cmp').setup({
  -- see :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    preset = 'enter',
    ['<Tab>'] = { 'select_next', 'fallback' }, -- use tab for next item
    ['<S-Tab>'] = { 'select_prev', 'fallback' }, -- use shift+tab for previous item

    -- NOTE: ipatch, requires pressing the esc key twice NO GOOD!
    -- ['<Esc>'] = { 'cancel', 'fallback' },

    -- NOTE: ipatch, causes syntax error
    -- ['<Esc>'] = function(cmp)
    --   if cmp.is_visible() then
    --     cmp.hide()
    --   end
    --   -- always exit insert mode regardless
    --   vim.api.nvim_input('<Esc>')
    -- end,

    -- ['<CR>'] = { 'accpet', 'fallback' }, -- enter to confirm
    -- ['<Space>'] = false, -- or {} disable space key for completion
  },
})

-- blink.cmp / Add this global override AFTER the blink.cmp setup
vim.keymap.set('i', '<Esc>', function()
  local blink = require('blink.cmp')
  if blink.is_visible() then
    blink.hide()
  end
  vim.cmd('stopinsert')
end, { desc = 'Hide completion and exit insert mode' })


-- TODO: ipatch, cleanup the below code
--[[ 
  require('lspconfig').ruby_ls.setup {
  cmd = {"/home/my_user/.rbenv/shims/ruby-lsp"},
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
-- PLUGIN / luasnips, neovim snippets plugin
----
-- require("luasnip.loaders.from_vscode").lazy_load()

-- TODO: ipatch, this table may no longer used due to migration from nvim-cmp to blink.cmp
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
          -- NOTE: ipatch, mapping to delete/close buffer from picker view
          -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-c-d-to-delete-buffer
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
vim.keymap.set('n', ';', builtin.buffers, {})
-- TODO: i think remapping the below binding to `rg` could help me remember better
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep >") })
end)

-- NOTE: c-p can be used to first check if in git dir, then if not fallback to find_files
local function project_files()
  local is_git_repo = vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null')
  if vim.v.shell_error == 0 then
    require('telescope.builtin').git_files({ previewer = false })
  else
    require('telescope.builtin').find_files({ previewer = false })
  end
end

vim.keymap.set('n', '<c-p>', project_files, { desc = 'fuzzy find project fiels' })

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
-- PLUGIN / tree-sitter, treesitter, treesitter-textobjects
-- NOTE: ipatch, `all` blows up 💥 on m1 mac due to `phpdoc`
-- NOTE: ipatch, https://www.reddit.com/r/neovim/comments/1ds8kcp/i_got_this_error_when_open_help_anyone_known_how/lbewzk1/
-- i had to add the vimdoc and luddoc parsers to prevent the above err
----

-- NOTE: ipatch, the below line is deprecated
local ts = require 'nvim-treesitter.configs'

local user = vim.fn.expand("$USER")

local languages = {
  'bash',
  'c',
  'cmake',
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
}

if user == "mobile" or user == "root" then
  languages = {}
elseif user == "capin" then
  -- NOTE: ipatch, manually ran `:TSInstall yaml-github-action`
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config["yaml-github-action"] = {
    install_info = {
      url = "/opt/code/git/github/forks/tree-sitter-github-action",
      files = {"src/parser.c"},
    },
    filetype = "yaml-github-action"
  }
end

ts.setup {
  modules = {},
  sync_install = false,
  ensure_installed = languages,
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

  indent = {
    -- enable = false
    enable = true,
    disable = { "python" }
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

  -- NOTE: TODO: still not seeing rainbows
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

  -- textobjects
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      -- NOTE: ipatch the below bindings are intended to work with prefix keys ie. `d` or `v`
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) so plugins like which-key display
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
-- PLUGIN / treesitter / nvim-ts-context-commentstring
-- nvim-ts-context-commentstring is set up automatically
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/82
--
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/67
----
require('ts_context_commentstring').setup {
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
    cpp = {
      __default = '// %s',
      comment = '/* %s */',
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
    ["@comment.documentation"] = {fg = '$github_grey'},
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

-- NOTE: ipatch, run `:Syntaxid` ie. syntaxid to print the formatting/highlight under the cursor
-- NOTE: ipatch, adding `command!` allows reloading of this config
-- TODO: not seeing the output of this command being printed
vim.api.nvim_command([[
  command! Syntaxid echo synIDattr(synID(line("."), col("."), 1), "name")
]])

-- NOTE: ipatch, override the default bg color for onedark theme
-- TODO: ipatch, migrate this function / cmd to the above onedark colorscheme
vim.api.nvim_command([[
  augroup ChangeBackgroudColour
  autocmd colorscheme * :hi normal guibg=#0a0a0a
  augroup END
]])

-- NOTE: ipatch, below line required or bg color is not updated in terminal
cmd [[silent! colorscheme onedark]]

-- NOTE: ipatch, colorscheme set background color for folds
vim.api.nvim_set_hl(0, "Folded", { ctermbg = "NONE"})
vim.api.nvim_set_hl(0, "Folded", { bg = "NONE"})

---------------
-- PLUGIN / 'numToStr/Comment.nvim'
-- NOTE: ipatch, attempt to define commentstring for specific dot files
require('Comment').setup({
  -- per the plugin readme ignore empty lines
  ignore = '^$',

  -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
   pre_hook = function(ctx)
    local cs = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()(ctx)
    print('pre_hook called, commentstring: ' .. tostring(cs))
    return cs
  end,
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
-- .set('c', '//%s', '//%s')
.set('gitconfig', '#%s')
.set('systemd', '#%s')

-- unsorted / builtin vim commands
-- -- highlight on yank
cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

---------------
-- PLUGIN / folding / fold settings - ufo
-----
-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`

-- Define a custom highlight group for UFO's virtual text
vim.api.nvim_set_hl(0, 'MyUfoFoldText', { fg = '#48F525', bg = 'NONE', italic = false, bold = true, underline = false })
-- Example colors: '#98C379' is a green, '#61AFEF' is a blue, '#C678DD' is a purple

require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'} -- fallback to indent if treesitter fails
  end,

  -- disable all automatic closing of folds
  close_fold_kinds_for_ft = {},

  fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local lineCount = endLnum - lnum
    -- local suffix = ("  %d lines "):format(lineCount)
    local suffix = (' 󰁂 %d '):format(lineCount)
    local totalWidth = 0
    local suffixWidth = vim.fn.strdisplaywidth(suffix)

    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)

      if totalWidth + chunkWidth < width - suffixWidth then
        table.insert(newVirtText, chunk)
        totalWidth = totalWidth + chunkWidth
      else
        chunkText = truncate(chunkText, width - totalWidth - suffixWidth)
        table.insert(newVirtText, { chunkText, chunk[2] })
        break
      end
    end

    table.insert(newVirtText, { suffix, 'MyUfoFoldText' })
    return newVirtText
  end,
})

-- vim.api.nvim_set_hl(0, 'UfoFoldText', { fg = '#8BE9FD', bg = 'NONE', italic = true })

-- Using ufo provider requires remapping `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


-- NOTE: ipatch, when eding a cpp file,
--   1. and i recursively closed all folds in the file
--   2. found the function i wanted to work in, and recursively expanded fols within that function ie. `zO`
--   3. then saved the file, all my opened fold are collapsed using the old remember_folds function
vim.api.nvim_create_user_command('Mks', function(args)
  -- Save views for all loaded buffers
  local current_win = vim.api.nvim_get_current_win()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= '' then
      local wins = vim.fn.win_findbuf(buf)
      if #wins > 0 then
        vim.api.nvim_set_current_win(wins[1])
        vim.cmd('silent! mkview')
      end
    end
  end
  vim.api.nvim_set_current_win(current_win)

  -- Save session
  local bang = args.bang and '!' or ''
  vim.cmd('mksession' .. bang .. ' ' .. vim.fn.fnameescape(args.args))
end, { nargs = 1, bang = true, complete = 'file' })

-- Still restore views when opening buffers (so session restore gets folds back)
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('restore_folds', { clear = true }),
  pattern = '*.*',
  command = 'silent! loadview',
})


-- Set the default fold level to 99
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- keep top level folds open, but nested folds closed
-- vim.o.foldlevelstart = 1
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

---------------
-- PLUGIN / mfussenegger/nvim-dap
-- NOTE: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
-- NOTE: ipatch, useful link to a dap config
-- https://github.com/NeuralNine/config-files/blob/master/arch_config/.config/nvim/lua/plugins/nvim-dap.lua#L71
----
local dap = require('dap')
local dapui = require('dapui')
-- local dap_python = require('dap-python')

dap.set_log_level('TRACE')

require('dapui').setup({
  icons = { expanded = "▾", collapsed = "▸" },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 10,
      position = "bottom",
    },
  },
})

require('nvim-dap-virtual-text').setup({
  commented = true,
})

-- dap adapter for c++ ie. gdb
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executale',
  command = 'gdb',
  args = {'-i', 'dap'},
}

-- alt adapter ie. lldb
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb',
  name = 'lldb'
}

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.expand('~/.local/share/nvim/mason/bin/codelldb'),
    args = {'--port', '${port}'},
  }
}

dap.configurations.cpp = {
  {
    name = 'launch freecad (debug)',
    type = 'codelldb', -- or cppdbg
    request = 'launch',
    program = '/opt/code/fcgit/installs/issue.tshooting.qt6.py313/bin/FreeCAD',
    -- cwd = '${workspaceFolder}',
    cwd = '/opt/code/fcgit/fcsrc',
    stopAtEntry = false,
    env = {
      DISPLAY = ':11.0',
    },
    sourceMap = {
      ['/opt/code/fcgit/fcsrc'] = '/opt/code/git/github/forks/freecad-git/freecad-src',
    },
    initCommands = {
      -- NOTE: ipatch, did not bypass startup exceptions, NOWORK!
      'settings set target.process.stop-on-exec false',
      -- Load Qt pretty printers
      'command script import /opt/code/fcgit/fcsrc/contrib/debugger/qt_pretty_printers_lldb.py',
    },
    -- This tells it not to stop at exceptions
    exceptionBreakpoints = 'none',
    -- setupCommands = {
    --   {
    --     text = 'enable-pretty-printing',
    --     description = 'enable pretty printing',
    --     ignoreFailures = false
    --   },
    -- },
  },
  {
    -- NOTE: ipatch, using this method has issues with loading shared libraries
    name = 'attach to freecad process',
    type = 'codelldb',
    request = 'attach',
    pid = function()
      local pid = vim.fn.input('Enter freecad pid: ')
      return tonumber(pid)
    end,
    -- NOTE: ipatch, i think `${workspaceFolder}` is set to the value of the :lcd
    -- cwd = '${workspaceFolder}',
    cwd = '/opt/code/fcgit/fcsrc',
  },
}

-- use same cpp setup for c-lang to
dap.configurations.c = dap.configurations.cpp

-- TODO: fix dap with debugpy
-- dap.adapters.debugpy = function(callback, config)
--   callback({
--     type = 'server',
--     host = '127.0.0.1',
--     port = 5678,
--   })
-- end

-- dap.configurations.python = {
--   {
--     -- The first three options are required by nvim-dap
--     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
--     request = 'launch';
--     name = "Launch file";

--     -- Options below are for debugpy, 
--     -- see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

--     program = "${file}"; -- This configuration will launch the current file if used.
--     pythonPath = function()
--       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--       -- The code below looks for a `venv` or `.venv` folder in the current directory and uses the python within.
--       -- You could adapt this, for example use the `VIRTUAL_ENV` environment variable.
--       local cwd = vim.fn.getcwd()
--       if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
--         return cwd .. '/venv/bin/python'
--       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
--         return cwd .. '/.venv/bin/python'
--       else
--         return '/usr/bin/python'
--       end
--     end;
--   },
-- }

-- Automatically open/close UI
---@diagnostic disable-next-line: undefined-field
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
---@diagnostic disable-next-line: undefined-field
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
---@diagnostic disable-next-line: undefined-field
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

---------------
-- plugin / nvim-dap / js adapter configs
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

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='DiagnosticSignError', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🙅', texthl='DiagnosticSignError', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='✋', texthl='DiagnosticSignWarn', linehl='Visual', numhl='DiagnosticSignWarn'})

---------------
-- plugin / mfussenegger / nvim-dap / mappings (requires helper function)
----
--- EXAMPLES
-- Keybindings
-- vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
-- vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Debug: Step Over' })
-- vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Debug: Step Into' })
-- vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'Debug: Step Out' })
-- vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
-- vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = 'Debug: Run Last' })

-- requires external helper file `debugHelper.lua`
-- map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')

-- set conditional breakpoint
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Debug: Conditional Breakpoint' })
-- set breakpoint, i think toggle and set breakpoint do the samething internally other set bp does not rm the bp
map('n', '<leader>dsb', ':lua require"dap".set_breakpoint()<CR>')
-- toggle breakpoint
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')

-- toggle dap repl
vim.keymap.set('n', '<Leader>dr', function() dap.repl.toggle() end, { desc = 'Debug: toggle DAP REPL' })

-- map('n', '<leader>dc', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = 'Debug: Start/Continue' })

-- step over / into
map('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>')
map('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>')

-- Step Out
vim.keymap.set("n", "<leader>dO", function()
  dap.step_out()
end, { noremap = true, silent = true })

-- step up / down
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')

-- Keymap to terminate debugging
map('n', '<leader>dx', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
vim.keymap.set("n", "<leader>dq", function()
  require("dap").terminate()
end, { noremap = true, silent = true })

-- Toggle DAP UI
vim.keymap.set('n', '<leader>du', function()
  dapui.toggle()
end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end, { desc = 'Debug: Toggle UI' })
-- map('n', '<leader>du', ':lua require"dapui".toggle()<CR>')
-- map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

---------------
-- plugin / nvim-telescope/telescope-dap.nvim
----
require('telescope').load_extension('dap')
map('n', '<leader>dtb', ':Telescope dap list_breakpoints<CR>')
map('n', '<leader>dtf', ':Telescope dap frames<CR>')

