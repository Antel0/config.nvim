--   Tab Key Maps
local tab_lead = "<C-a>"
vim.api.nvim_set_keymap("n", tab_lead .. "c", ":tabc<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("n", tab_lead .. "n", ":tabnew<CR>", {noremap = true, silent = false})
