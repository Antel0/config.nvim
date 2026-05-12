local window_lead = "<C-w>"
vim.keymap.set("n", window_lead .. "a", ":vnew<CR>", {noremap = true, silent = false })      -- Open Vertical Window
vim.keymap.set("n", window_lead .. "s", ":vsplit<CR>", { noremap = true, silent = false })   -- Splits Window Vertically
vim.keymap.set("n", window_lead .. "d", ":new<CR>", { noremap = true, silent = false })      -- Open Horizontal Window
vim.keymap.set("n", window_lead .. "f", ":split<CR>", { noremap = true, silent = false })    -- Splits Window Horizontally
--   Terminal Mode Key Maps - Window navigation  
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })
vim.keymap.set("i", "<C-q>", "<C-w>q", { noremap = true, silent = false })        -- Close the window

vim.keymap.set("i", "<C-j>", "<C-w>j", { noremap = true, silent = false })        -- Go to the window down
vim.keymap.set("i", "<C-k>", "<C-w>k", { noremap = true, silent = false })        -- Go to the window above
vim.keymap.set("i", "<C-l>", "<C-w>l", { noremap = true, silent = false })        -- Go to the window right

-- Float Window User Commands
vim.api.nvim_create_user_command(       -- Opens a Floating Window
    "FloatW", 
    function(opts)
        local cmd = opts.args ~= "" and opts.args or "Ex"
        float.float_window(cmd, 90, 30)
    end,
    {
        nargs = "?",
        complete = function()
            return {"Ex", "term", "ls"}  -- optional completions
        end
    }
)
vim.api.nvim_create_user_command(       -- Opens a Floating Window with the this file  
    "FloatC", 
    function()
        local init_path = vim.fn.stdpath("config") .. "/init.lua"
        float.float_window("edit " .. init_path, 90, 30)
    end,
    {}
)
vim.api.nvim_create_user_command(       -- Opens a floating window with a terminal 
    "FloatT", 
    function()
        float.float_window("term", 90, 30)
    end,
    {}
)
