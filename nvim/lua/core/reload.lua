--- Stuff to help with reloading Lua modules
-- @module core.reload

local reload = {}

--- Unload modules with a prefix
--
-- @tparam string prefix The prefix of modules to unload
function reload.unload_modules(prefix)
  local to_unload = {}

  for k, _ in pairs(package.loaded) do
    if vim.startswith(k, prefix .. ".") then
      table.insert(to_unload, k)
    end
  end

  for _, v in pairs(to_unload) do
    package.loaded[v] = nil
  end
end

--- Unloads modules from this user config
--
-- <br>
-- This unloads modules prefixed with `core.` or `layer.`.
function reload.unload_user_modules()
  reload.unload_modules("core") -- Unload config core
  reload.unload_modules("layer") -- Unload layers
end

--- Updates `package.path` from Vim's `runtimepath`
function reload.update_package_path()
  vim._update_package_paths()
end

return reload
