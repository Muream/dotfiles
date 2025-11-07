-- -- === Auto-reload quickfix list when errorfile changes ===
-- -- Set your errorfile path here (absolute path recommended)
-- vim.o.errorfile = "/tmp/nvim_errors.log"
local errorfile = vim.o.errorfile

local uv = vim.uv
local fs_event = uv.new_fs_event()

local function reload_quickfix()
  vim.schedule(function()
    if vim.fn.filereadable(errorfile) == 1 then
      vim.cmd("silent! cfile " .. errorfile)
      vim.notify("Quickfix reloaded from " .. errorfile, vim.log.levels.INFO, { title = "Quickfix Watcher" })
    end
  end)
end

-- Start watching the errorfile
fs_event:start(errorfile, {}, vim.schedule_wrap(function(err, filename, status)
  if err then
    vim.notify("Error watching errorfile: " .. err, vim.log.levels.ERROR)
    return
  end
  reload_quickfix()
end))

-- Stop watching when Neovim exits
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    fs_event:stop()
    fs_event:close()
  end,
})
