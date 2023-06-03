lvim.leader = "space"


-- NORMAL MODE
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- scrolling up/down with centering is done by neoscroll
-- lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
-- lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
-- center cursor when jumping through search results
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
-- TODO: fix require('ufo') being nil
lvim.keys.normal_mode["zr"] = ":lua require('ufo').openallfolds()<cr>"
lvim.keys.normal_mode["zm"] = ":lua require('ufo').closeallfolds()<cr>"
-- vim.keymap.set('n', 'zr', require('ufo').openallfolds)
-- vim.keymap.set('n', 'zm', require('ufo').closeallfolds)


-- INSERT MODE
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<cr>"


-- VISUAL MODE
-- Paste in place of selection without yanking
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"

lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  "Find references"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  "Definitions"
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
  ":lua vim.lsp.buf.type_definition()<cr>",
  "Type Definition"
}

-- lvim.lsp.buffer_mappings.normal_mode["gf"] = {
--   ":Telescope frecency<cr>",
--   "Telescope Frecency"
-- }

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.keys.normal_mode["<leader>a"] = mark.add_file
lvim.keys.normal_mode["<C-x>"] = ui.toggle_quick_menu

lvim.keys.normal_mode["<leader>1"] = function() ui.nav_file(1) end
lvim.keys.normal_mode["<leader>2"] = function() ui.nav_file(2) end
lvim.keys.normal_mode["<leader>3"] = function() ui.nav_file(3) end
lvim.keys.normal_mode["<leader>4"] = function() ui.nav_file(4) end
