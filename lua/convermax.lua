local get_stores = function()
  local cur_dir = vim.loop.cwd()
  local dirs = {}

  for dir in io.popen([[dir ]] .. cur_dir .. "\\Stores " .. [[ /b /ad]]):lines() do
    table.insert(dirs, dir)
  end

  if #table == 0 then vim.notify('Didn\'t found "./Stores" folder', vim.log.levels.WARN, { title = "convermax" }) end

  return dirs
end

vim.api.nvim_create_user_command("Convermax", function(opts)
  local terminal = require "toggleterm.terminal"
  local current, _ = terminal.get_or_create_term(0)

  if current.is_open(current) == false then current.open(current, 100, "vertical") end
  current.send(current, { "yarn serve " .. opts.fargs[1] }, true)
end, {
  nargs = 1,
  complete = get_stores,
})

-- vim.api.nvim_create_user_command("TestCommand", function() vim.print ";asdasdad" end, {})
