-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\loic\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\loic\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\loic\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\loic\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\loic\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\colorbuddy.vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\a\1\0145\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\0026\4\1\0009\4\4\0049\4\5\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\6\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\0\2\bexe\nblack\nstdin\1\3����\4D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2�\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0004\4\3\0003\5\3\0>\5\1\4=\4\5\0034\4\3\0003\5\6\0>\5\1\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\rfiletype\1\0\0\trust\0\vpython\1\0\0\0\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0Ahighlight IndentBlanklineChar guifg=#373b41  blend=nocombine\bcmd\bvim\1\0\1\tchar\b│\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\14powerline\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim"
  },
  neogit = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neogit"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-base16"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\3\0\0\t\0\27\00076\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0005\4\5\0009\5\3\0009\5\4\5B\5\1\2=\5\6\0049\5\3\0009\5\a\5B\5\1\2=\5\b\0049\5\3\0009\5\t\5)\a��B\5\2\2=\5\n\0049\5\3\0009\5\t\5)\a\4\0B\5\2\2=\5\v\0049\5\3\0009\5\f\5B\5\1\2=\5\r\0049\5\3\0009\5\14\5B\5\1\2=\5\15\0049\5\3\0009\5\16\0055\a\19\0009\b\17\0009\b\18\b=\b\20\aB\5\2\2=\5\21\0049\5\3\0009\5\16\0055\a\22\0009\b\17\0009\b\18\b=\b\20\aB\5\2\2=\5\23\4=\4\3\0034\4\3\0005\5\25\0>\5\1\4=\4\26\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\rnvim_lsp\1\0\0\n<Tab>\1\0\1\vselect\2\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nq\0\0\3\0\5\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0009\0\3\0004\2\0\0B\0\2\1K\0\1\0\18rust_analyzer\nsetup\fpyright\14lspconfig\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nq\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-commentary"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\3\0\0\t\0\27\00076\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0005\4\5\0009\5\3\0009\5\4\5B\5\1\2=\5\6\0049\5\3\0009\5\a\5B\5\1\2=\5\b\0049\5\3\0009\5\t\5)\a��B\5\2\2=\5\n\0049\5\3\0009\5\t\5)\a\4\0B\5\2\2=\5\v\0049\5\3\0009\5\f\5B\5\1\2=\5\r\0049\5\3\0009\5\14\5B\5\1\2=\5\15\0049\5\3\0009\5\16\0055\a\19\0009\b\17\0009\b\18\b=\b\20\aB\5\2\2=\5\21\0049\5\3\0009\5\16\0055\a\22\0009\b\17\0009\b\18\b=\b\20\aB\5\2\2=\5\23\4=\4\3\0034\4\3\0005\5\25\0>\5\1\4=\4\26\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\rnvim_lsp\1\0\0\n<Tab>\1\0\1\vselect\2\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nq\0\0\3\0\5\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0009\0\3\0004\2\0\0B\0\2\1K\0\1\0\18rust_analyzer\nsetup\fpyright\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\a\1\0145\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\0026\4\1\0009\4\4\0049\4\5\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\6\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\0\2\bexe\nblack\nstdin\1\3����\4D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2�\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0004\4\3\0003\5\3\0>\5\1\4=\4\5\0034\4\3\0003\5\6\0>\5\1\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\rfiletype\1\0\0\trust\0\vpython\1\0\0\0\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0Ahighlight IndentBlanklineChar guifg=#373b41  blend=nocombine\bcmd\bvim\1\0\1\tchar\b│\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nq\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\14powerline\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
