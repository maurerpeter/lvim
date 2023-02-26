--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "vscode"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
--
-- Normal Mode
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- scrolling up/down with centering is done by neoscroll
-- lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
-- lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
-- center cursor when jumping through search results
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
--
-- Insert Mode
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<cr>"
--
-- Visual Mode
-- Paste in place of selection without yanking
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

lvim.builtin.which_key.setup.plugins.presets.windows = true
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.mappings["n"] = { ":tabnew<CR>", "Open new tab" }
lvim.builtin.which_key.mappings["R"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace all" }
lvim.builtin.which_key.mappings["u"] = { ":UndotreeToggle<CR>", "Undotree" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  --     "sumneko_lua",
  --     "jsonls",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  --   local function buf_set_option(...)
  --     vim.api.nvim_buf_set_option(bufnr, ...)
  --   end
  --   --Enable completion triggered by <c-x><c-o>
  --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  {
    command = "prettierd",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
})

-- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  {
    command = "cspell",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
})

-- set code actions
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
})

-- Additional Plugins
lvim.plugins = {
  "lunarvim/colorschemes",
  -- vscode theme
  "Mofiqul/vscode.nvim",
  {
    -- smooth scrolling for code jumps
    "karb94/neoscroll.nvim",
    config = function()
      -- Hack source for centering after scroll with neoscroll: https://www.reddit.com/r/neovim/comments/zjeplx/centering_after_cd_with_neoscroll/
      local neoscroll = require("neoscroll")

      local easing = "sine"
      local jump_time_ms = 100

      local centering_function = function()
        vim.cmd("normal! zz")
      end

      neoscroll.setup({
        post_hook = function(info)
          if info ~= "center" then
            return
          end

          centering_function()
        end,
      })

      local mappings = {}

      mappings["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", jump_time_ms, easing, "'center'" } }
      mappings["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", jump_time_ms, easing, "'center'" } }

      require("neoscroll.config").set_mappings(mappings)
    end,
  },
  -- git blame, commands starts with :GitBlame
  "f-person/git-blame.nvim",
  -- Git integration via :G command
  "tpope/vim-fugitive",
  "sindrets/diffview.nvim",
  {
    -- ensures null-ls linters/formatters are installed
    "jayp0521/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "eslint_d", "cspell" },
      })
    end,
  },
  -- refer to link to set up gitlinker https://github.com/ChristianChiarulli/lvim/blob/master/lua/user/git.lua
  -- "ruifm/gitlinker.nvim",
  {
    -- for cursor jumping, press s/S, press first 2 letters of word we want to jump to, press designated decorator character
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  -- refer to link to set up todo-comments https://github.com/ChristianChiarulli/lvim/blob/master/lua/user/todo-comments.lua
  -- "folke/todo-comments.nvim",
  -- Basic zen mode, toggle with :ZenMode
  "folke/zen-mode.nvim",
  -- quickfix/references preview window
  "kevinhwang91/nvim-bqf",
  {
    -- peek lines with :[line_number], where [line_number] is the actual line number we want to peek
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  },
  "mbbill/undotree",
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
          require('lspconfig')[ls].setup({
              capabilities = capabilities
              -- you can add other fields for setting up lsp server in this table
          })
      end
      require('ufo').setup()
    end,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.setup({modes = {":", "/", "?"}})
    end
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

vim.opt.relativenumber = true
-- vim.opt.hlsearch = false
vim.opt.scrolloff = 8
vim.opt.timeoutlen = 100
vim.g.gitblame_enabled = 0

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
