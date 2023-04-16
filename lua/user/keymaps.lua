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
vim.keymap.set('n', 'zr', require('ufo').openallfolds)
vim.keymap.set('n', 'zm', require('ufo').closeallfolds)


-- INSERT MODE
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<cr>"


-- VISUAL MODE
-- Paste in place of selection without yanking
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"

-- TODO: check why the override doesn't work
-- lvim.lsp.buffer_mappings.normal_mode["gr"] = {
--   ":lua require'telescope.builtin'.lsp_references()<cr>",
--   " Find references"
-- }

-- lvim.lsp.buffer_mappings.normal_mode["gd"] = {
--   ":lua vim.lsp.buf.definition()<cr>",
--   -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
--   kind.cmp_kind.Reference .. " Definitions"
-- }

-- lvim.lsp.buffer_mappings.normal_mode["gD"] = {
--   ":lua vim.lsp.buf.type_definition()<cr>",
--   kind.cmp_kind.Reference .. " Type Definition"
-- }

-- lvim.lsp.buffer_mappings.normal_mode["gf"] = {
--   ":Telescope frecency<cr>",
--   kind.cmp_kind.Reference .. " Telescope Frecency"
-- }
