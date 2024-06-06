require("neo-tree.command").execute { action = "show" }

if vim.g.neovide then vim.o.guifont = "Agave Nerd Font Mono" end

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.25) end)
vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.25) end)

if vim.g.neovide then
  vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<C-c>", '"+y') -- Copy
  vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode

  vim.api.nvim_set_keymap("", "<C-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("", "<kEnter>", "<Enter>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<C-v>", "<C-R>+", { noremap = true, silent = true })

  -- Fix kitty Enter key
  vim.api.nvim_set_keymap("", "<kEnter>", "<Enter>", {})
  vim.api.nvim_set_keymap("i", "<kEnter>", "<Enter>", {})
  vim.api.nvim_set_keymap("c", "<kEnter>", "<Enter>", {})
end
