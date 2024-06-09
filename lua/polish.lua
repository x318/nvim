require("neo-tree.command").execute { action = "show" }
require "./neovide"
require "./convermax"

-- Commands
vim.api.nvim_create_user_command(
  "ReloadConfig",
  function() vim.cmd("luafile " .. string.sub(vim.env.MYVIMRC, 0, #vim.env.MYVIMRC - 8) .. "/lua/polish.lua") end,
  {}
)

vim.api.nvim_create_user_command(
  "ConfigHelp",
  function() vim.cmd '!explorer "https://neovim.io/doc/user/lua-guide.html"' end,
  {}
)
