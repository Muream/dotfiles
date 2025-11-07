require("config.plugins.blink")
require("config.plugins.editing")
require("config.plugins.filetypes")
require("config.plugins.gitsigns")
require("config.plugins.look-n-feel")
require("config.plugins.clangd_extensions")
require("config.plugins.lsp")
require("config.plugins.mini-pick")
require("config.plugins.mini-statusline")
require("config.plugins.mini-tabline")
require("config.plugins.mini-extra")
require("config.plugins.mini-notify")
require("config.plugins.mini-hipatterns")
-- require("config.plugins.mini-ai")
require("config.plugins.misc")
require("config.plugins.navigator")
require("config.plugins.oil")
require("config.plugins.tree-sitter")


local packages_to_delete = {}
for _, package in ipairs(vim.pack.get()) do
    if not package.active then
        table.insert(packages_to_delete, package.spec.name)
    end
end

if next(packages_to_delete) ~= nil then
    vim.pack.del(packages_to_delete)
end
