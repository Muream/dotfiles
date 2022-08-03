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
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\nâ\1\0\0\a\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0006\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\1K\0\1\0\28<cmd>BufferPrevious<cr>\n<A-n>\24<cmd>BufferNext<cr>\n<A-p>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\fnoremap\2\vsilent\2\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n¶\1\0\0\n\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\2\4\0005\4\v\0004\5\3\0009\6\5\0019\6\6\0065\b\b\0005\t\a\0=\t\t\bB\6\2\2>\6\1\0059\6\n\1>\6\2\5=\5\f\4B\2\2\1K\0\1\0\fsources\1\0\0\nisort\15extra_args\1\0\0\1\2\0\0\v--fast\twith\nblack\nsetup\15formatting\rbuiltins\fnull-ls\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire˜\5\1\0\v\0)\0H6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0005\4\v\0005\5\t\0003\6\b\0=\6\n\5=\5\f\0045\5\14\0009\6\r\1B\6\1\2=\6\15\5=\5\16\0049\5\17\0009\5\18\0059\5\19\0055\a\21\0009\b\17\0009\b\20\b)\nüÿB\b\2\2=\b\22\a9\b\17\0009\b\20\b)\n\4\0B\b\2\2=\b\23\a9\b\17\0009\b\24\bB\b\1\2=\b\25\a9\b\17\0009\b\26\bB\b\1\2=\b\27\a9\b\17\0009\b\28\b5\n\29\0B\b\2\2=\b\30\a9\b\17\0009\b\28\b5\n\31\0B\b\2\2=\b \aB\5\2\2=\5\17\0049\5!\0009\5\"\0054\a\5\0005\b#\0>\b\1\a5\b$\0>\b\2\a5\b%\0>\b\3\a5\b&\0>\b\4\aB\5\2\2=\5\"\0045\5'\0=\5(\4B\2\2\1K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\fsources\vconfig\n<Tab>\1\0\1\vselect\2\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\15cmp_format\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÎ\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\v\0005\4\b\0005\5\t\0=\5\n\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\6\aac\17@class.outer\aic\17@class.inner\aia\21@parameter.inner\aaf\20@function.outer\aaa\21@parameter.outer\aif\20@function.inner\1\0\2\venable\2\14lookahead\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\nÌ\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\tload\15code_style\1\0\5\14functions\tnone\rkeywords\tnone\14variables\tnone\rcomments\tnone\fstrings\tnone\1\0\2\16term_colors\2\nstyle\vdarker\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\nM\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0000splitjoin_python_brackets_on_separate_lines\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nç\3\0\0\t\0\22\0\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0019\1\6\0005\3\20\0005\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\18\0006\6\0\0'\b\16\0B\6\2\0029\6\17\6>\6\1\5=\5\19\4=\4\21\3B\1\2\1K\0\1\0\r<leader>\1\0\0\6v\1\3\0\0\0\18Reload config\18reload_config\24muream.utils.reload\6b\1\3\0\0\31<cmd>Telescope buffers<cr>\20 Buffers Picker\6S\1\3\0\0-<cmd>Telescope lsp_workspace_symbols<cr>\30 Workspace Symbols Picker\6s\1\3\0\0,<cmd>Telescope lsp_document_symbols<cr>\20 Symbols Picker\6f\1\0\0\1\3\0\0\"<cmd>Telescope find_files<cr>\18 Files Picker\rregister\vwindow\1\0\0\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "C:\\Users\\loic\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nç\3\0\0\t\0\22\0\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0019\1\6\0005\3\20\0005\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\18\0006\6\0\0'\b\16\0B\6\2\0029\6\17\6>\6\1\5=\5\19\4=\4\21\3B\1\2\1K\0\1\0\r<leader>\1\0\0\6v\1\3\0\0\0\18Reload config\18reload_config\24muream.utils.reload\6b\1\3\0\0\31<cmd>Telescope buffers<cr>\20 Buffers Picker\6S\1\3\0\0-<cmd>Telescope lsp_workspace_symbols<cr>\30 Workspace Symbols Picker\6s\1\3\0\0,<cmd>Telescope lsp_document_symbols<cr>\20 Symbols Picker\6f\1\0\0\1\3\0\0\"<cmd>Telescope find_files<cr>\18 Files Picker\rregister\vwindow\1\0\0\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÎ\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\v\0005\4\b\0005\5\t\0=\5\n\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\6\aac\17@class.outer\aic\17@class.inner\aia\21@parameter.inner\aaf\20@function.outer\aaa\21@parameter.outer\aif\20@function.inner\1\0\2\venable\2\14lookahead\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring("\27LJ\2\nM\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0000splitjoin_python_brackets_on_separate_lines\6g\bvim\0", "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\nÌ\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\tload\15code_style\1\0\5\14functions\tnone\rkeywords\tnone\14variables\tnone\rcomments\tnone\fstrings\tnone\1\0\2\16term_colors\2\nstyle\vdarker\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nâ\1\0\0\a\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0006\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\1K\0\1\0\28<cmd>BufferPrevious<cr>\n<A-n>\24<cmd>BufferNext<cr>\n<A-p>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\fnoremap\2\vsilent\2\nsetup\15bufferline\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\n\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\2\4\0005\4\v\0004\5\3\0009\6\5\0019\6\6\0065\b\b\0005\t\a\0=\t\t\bB\6\2\2>\6\1\0059\6\n\1>\6\2\5=\5\f\4B\2\2\1K\0\1\0\fsources\1\0\0\nisort\15extra_args\1\0\0\1\2\0\0\v--fast\twith\nblack\nsetup\15formatting\rbuiltins\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire˜\5\1\0\v\0)\0H6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0005\4\v\0005\5\t\0003\6\b\0=\6\n\5=\5\f\0045\5\14\0009\6\r\1B\6\1\2=\6\15\5=\5\16\0049\5\17\0009\5\18\0059\5\19\0055\a\21\0009\b\17\0009\b\20\b)\nüÿB\b\2\2=\b\22\a9\b\17\0009\b\20\b)\n\4\0B\b\2\2=\b\23\a9\b\17\0009\b\24\bB\b\1\2=\b\25\a9\b\17\0009\b\26\bB\b\1\2=\b\27\a9\b\17\0009\b\28\b5\n\29\0B\b\2\2=\b\30\a9\b\17\0009\b\28\b5\n\31\0B\b\2\2=\b \aB\5\2\2=\5\17\0049\5!\0009\5\"\0054\a\5\0005\b#\0>\b\1\a5\b$\0>\b\2\a5\b%\0>\b\3\a5\b&\0>\b\4\aB\5\2\2=\5\"\0045\5'\0=\5(\4B\2\2\1K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\fsources\vconfig\n<Tab>\1\0\1\vselect\2\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\15cmp_format\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
