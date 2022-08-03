M = {}

M.reload = function(name)
    for package_name, _ in pairs(package.loaded) do
        if string.find(package_name, name) then
            package.loaded[package_name] = nil
        end
    end
end

M.reload_config = function()
    print("Reloading Config")
    require("muream.utils.reload").reload("muream")
    vim.cmd("source $MYVIMRC")
    require("packer").compile()
end

return M
