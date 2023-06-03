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
        -- ensure_installed = { "eslint_d", "cspell" },
        -- automatic_installation = true,
        automatic_setup = true,
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
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
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
  "folke/trouble.nvim",
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
      wilder.setup({ modes = { ":", "/", "?" } })
    end
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    config = function()
      require("telescope").load_extension("advanced_git_search")
      vim.api.nvim_create_user_command(
        "DiffCommitLine",
        "lua require('telescope').extensions.advanced_git_search.diff_commit_line()",
        { range = true }
      )
    end,
    requires = {
      "nvim-telescope/telescope.nvim",
      -- to show diff splits and open commits in browser
      "tpope/vim-fugitive",
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {
          -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  "/github/copilot.vim",
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
}
